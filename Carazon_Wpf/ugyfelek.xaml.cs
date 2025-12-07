using MySql.Data.MySqlClient;
using MySqlConnector;
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

namespace carazonGarage
{
    /// <summary>
    /// Interaction logic for ugyfelek.xaml
    /// </summary>
    public partial class ugyfelek : Window
    {
        MySql.Data.MySqlClient.MySqlConnection connection = new MySql.Data.MySqlClient.MySqlConnection("server=localhost;database=carazongarage;uid=root");
        MySql.Data.MySqlClient.MySqlCommand command;
        public ugyfelek()
        {
            InitializeComponent();
            AdatbazisIndit();
        }
        public void openConnection()
        {
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
        }
        public class Ugyfel
        {
            public string name;
            public string description;
            public int phone;
        }
        private void AdatbazisIndit()
        {
            try
            {
                MySql.Data.MySqlClient.MySqlDataAdapter adapter = new MySql.Data.MySqlClient.MySqlDataAdapter("SELECT * FROM vehicle", connection);
                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                //Datagrid_Szerviz.ItemsSource = ds.Tables[0].DefaultView;
                closeConnection();
            }
            catch (Exception hiba)
            {
                MessageBox.Show(hiba.Message);
            }
        }


        public void executeQuery(string query)
        {
            try
            {
                openConnection();
                command = new MySql.Data.MySqlClient.MySqlCommand(query, connection);
                if (command.ExecuteNonQuery() >= 1)
                {
                    MessageBox.Show("Végrehajtva!");
                }
                else
                {
                    MessageBox.Show("Nem lett végrehajtva!");
                }
            }
            catch (Exception kivetel)
            {
                MessageBox.Show(kivetel.Message);
            }
            finally
            {
                closeConnection();
            }
        }

        public void closeConnection()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            this.Close();
            mainWindow.Show();
        }

        private void Uj_UgyfelClick(object sender, RoutedEventArgs e)
        {

        }
    }
}
