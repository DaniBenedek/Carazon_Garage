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
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace carazonGarage
{
    /// <summary>
    /// Interaction logic for Alkatreszek.xaml
    /// </summary>
    public partial class Alkatreszek : Window
    {
        MySql.Data.MySqlClient.MySqlConnection connection = new MySql.Data.MySqlClient.MySqlConnection("server=localhost;database=carazongarage;uid=root");
        MySql.Data.MySqlClient.MySqlCommand command;
        public Alkatreszek()
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
        private void AdatbazisIndit()
        {
            try
            {
                MySql.Data.MySqlClient.MySqlDataAdapter adapter = new MySql.Data.MySqlClient.MySqlDataAdapter("SELECT id AS \"sorszám\", \r\n\t\tname AS \"név\",\r\n        type AS \"Típus\",\r\n        item_number AS \"Cikkszám\",\r\n        description AS \"Leírás\",\r\n        storage_quantity AS \"Raktáron\",\r\n        price AS \"Ár\",\r\n        description AS \"Leírás\"\r\nFROM products;", connection);
                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                Datagrid_Alkatreszek.ItemsSource = ds.Tables[0].DefaultView;
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

        private void Alkatreszek_kilepes(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            this.Close();
            mainWindow.Show();
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Alkatreszek_uj ujalkatresz = new Alkatreszek_uj();
            this.Close();
            ujalkatresz.Show();
        }

        private void DataGrid_Alkatreszek_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Datagrid_Alkatreszek.SelectedItem == null)
                return;

            var row = Datagrid_Alkatreszek.SelectedItem as DataRowView;

            if (row == null)
                return;

            TextBlock_Name.Text = row["név"].ToString();
            TextBlock_Cikkszam.Text = row["Cikkszám"].ToString();
            Textblock_Category.Text = row["Típus"].ToString();
            Textblock_Description.Text = row["Leírás"].ToString();
            Textblock_Price.Text = row["Ár"].ToString();
            Textblock_Quanity.Text = row["Raktáron"].ToString();

        }

<<<<<<< HEAD
        private void Button_NewPart(object sender, RoutedEventArgs e)
        {
            Alkatreszek_uj mainWindow = new Alkatreszek_uj();
            this.Hide();
            mainWindow.Show();
        }

        private void Button_UpdatePart(object sender, RoutedEventArgs e)
        {
            Alkatreszek_KeszletFrissit mainWindow = new Alkatreszek_KeszletFrissit();
            this.Close();
            mainWindow.Show();
        }
=======
>>>>>>> 3ae9ff8e3e6aae9cd38a01283d4cd6e78b36f3d2
    }
}
