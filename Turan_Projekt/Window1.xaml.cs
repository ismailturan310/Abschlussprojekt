using System;
using System.Collections.Generic;
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
    /// Interaktionslogik für Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Window2 window2 = new Window2();
            window2.Show();
            Close();
        }

        Class1 iwas = new Class1();

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            MainWindow window = new MainWindow();
            window.Show();
            Close();
        }

        private void entfernen_Click(object sender, RoutedEventArgs e)
        {


            foreach (Data_manager zeile in Warenkorb.SelectedItems)
            {
                iwas.removeArticle(zeile);
            }
            Warenkorb.ItemsSource = null;
            Warenkorb.ItemsSource = iwas.plaintickets;

            string price = "Price: " + iwas.GetTotalPrice().ToString();
            Price.Content = price;
        }
    }
}
