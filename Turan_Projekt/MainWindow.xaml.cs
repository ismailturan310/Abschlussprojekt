using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Turan_Projekt
{
    /// <summary>
    /// Interaktionslogik für MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private string[] reise = {"Istanbul", "Athen", "Madrid", "New York City", "Antalya", "Tokyo", "London" };
        private string[] klasse = { "Economy Class", "Bussiness Class", "First Class"};
        private string[] gesellschaften = { "Turkish Airlines", "Austrian Airlines", "Pegasus Airline", "Sun Express", "United Airlines" };

        public MainWindow()
        {
            InitializeComponent();
            Flugliste.ItemsSource = f_list;
            reise_nach_cmbx.ItemsSource = reise;
            class_cmbx.ItemsSource = klasse;
            fluggesellschaft_combx.ItemsSource = gesellschaften;

        }

        ObservableCollection<Data_manager> f_list = new ObservableCollection<Data_manager>();
        Class1 iwas = new Class1();
       

        private Data_manager ConvertToDataManager(DataRowView r)
        {
            Data_manager m = new Data_manager();
            
            m.Abfahrt = r.Row.Field<DateTime>("abfahrt");
            m.Fluggesellschaft = r.Row.Field<string>("flug_name");
            m.Urlaubsziel = r.Row.Field<string>("Reiseziel");
            m.Class = r.Row.Field<string>("class");
            m.Flugpreis = r.Row.Field<int>("budget");


            return m;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Window1 window1 = new Window1();

            Data_manager curItem = ConvertToDataManager(((DataRowView)Flugliste.SelectedItem));

            if (curItem == null)
            {
                MessageBox.Show("Es wurde nichts ausgewählt");
            }
            else
            {
                window1.Show();
                Close();

                iwas.addArticle(curItem);

               


                window1.Warenkorb.ItemsSource = null;
                window1.Warenkorb.ItemsSource = iwas.plaintickets;
                string price = "Price: " + iwas.GetTotalPrice().ToString();
                window1.Price.Content = price;
            }
           
        }


        private void Confirm_it_Click(object sender, RoutedEventArgs e)
        {

            #region connectionstring
            const string connectionString = "server=localhost;uid=root;database=flug_tickets";
            #endregion


            MySqlConnection con = new MySqlConnection(connectionString);
            DataTable dt = new DataTable();

            if(budget_txt.Text.Length > 0)
            {
                MySqlDataAdapter sqldata = new MySqlDataAdapter("Select i.tickets_id, i.Reiseziel, i.class, i.budget, i.abfahrt, f.flug_name from info_tickets i join fluggesellschaft f where i.Reiseziel = '" + reise_nach_cmbx.Text + "' and i.class = '" + class_cmbx.Text + "' and f.flug_name = '" + fluggesellschaft_combx.Text + "' and i.budget <= " + budget_txt.Text + " and i.abfahrt = '" +((DateTime) datum_date.SelectedDate).ToString("yyyy-MM-dd") + "';", con);
                sqldata.Fill(dt);

            }

            else
            {
                MessageBox.Show("Bitte geben Sie eine Zahl ohne Nachkommastellen an.");
            }





            Flugliste.ItemsSource = dt.DefaultView;
        }
    }
}
