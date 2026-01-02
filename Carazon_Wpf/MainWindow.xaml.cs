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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace carazonGarage
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        MySql.Data.MySqlClient.MySqlConnection connection = new MySql.Data.MySqlClient.MySqlConnection("server=localhost;database=carazongarage;uid=root");
        
        public MainWindow() : this("")
        {
        }
        public MainWindow(string username)
        {
            InitializeComponent();
            //Texblock_User.Text = $"{username}";
            Texblock_User.Text = App.LoggedInUser;
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
                MySql.Data.MySqlClient.MySqlDataAdapter adapter = new MySql.Data.MySqlClient.MySqlDataAdapter("SELECT * FROM vehicle", connection);
                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                Datagrid_Szerviz.ItemsSource = ds.Tables[0].DefaultView;
                closeConnection();
            }
            catch (Exception hiba)
            {
                MessageBox.Show(hiba.Message);
            }
        }
        
        public void closeConnection()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        private void Ugyfelek_Click(object sender, RoutedEventArgs e)
        {
            ugyfelek mainWindow = new ugyfelek();
            this.Hide();
            mainWindow.Show();
        }

        private void Munkalapok_Click(object sender, RoutedEventArgs e)
        {
            Munkalapok mainWindow = new Munkalapok();
            this.Hide();
            mainWindow.Show();
        }

        private void Alkatreszek_Click(object sender, RoutedEventArgs e)
        {
            Alkatreszek mainWindow = new Alkatreszek();
            this.Hide();
            mainWindow.Show();
        }

        private void Kilepes_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Alkatreszek_Bejelentkezes(object sender, RoutedEventArgs e)
        {
            // fooldalra megy majd a bejelentkezes utana ez mar nem lesz bent
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            // Kereses ful ide jon majd amire rakerestek az emberek
        }
    }
}