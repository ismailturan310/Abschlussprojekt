using Microsoft.Win32;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;

namespace Turan_Projekt
{
    /// <summary>
    /// Interaktionslogik für Window2.xaml
    /// </summary>
    public partial class Window2 : Window
    {
        public Window2()
        {
            InitializeComponent();
        }

        private void back_Click(object sender, RoutedEventArgs e)
        {
            Window1 window1 = new Window1();
            window1.Show();
            Close();
        }


       

        private void Confirm_it_Click(object sender, RoutedEventArgs e)
        {
            #region connectionstring
            const string connectionString = "server=localhost;uid=root;database=flug_tickets";
            #endregion

            MySqlConnection con = new MySqlConnection(connectionString);

            con.Open();
            if(vorname_txt.Text.Length > 0 && nachname_txt.Text.Length > 0 && email_txt.Text.Length > 0 && alter_txt.Text.Length > 0 && tel_txt.Text.Length > 0)
            {

                string query  = "Insert into personen (personen_id, vorname, nachname, alter_, email, telefonnummer) values (DEFAULT, '" + vorname_txt.Text + "', '" + nachname_txt.Text + "', " + alter_txt.Text + ", '" + email_txt.Text + "', " + tel_txt.Text + ");";
                MySqlCommand mySqlCommand = new MySqlCommand(query, con);
                mySqlCommand.ExecuteNonQuery();
                MessageBox.Show("Danke für Ihren Einkauf!");
              

                Close();

            }

            else
            {
                MessageBox.Show("Bitte füllen Sie alles ricthig aus!");
            }

        }
    }
}
