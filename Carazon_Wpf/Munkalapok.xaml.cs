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
    /// Interaction logic for Munkalapok.xaml
    /// </summary>
    public partial class Munkalapok : Window
    {
        MySql.Data.MySqlClient.MySqlConnection connection = new MySql.Data.MySqlClient.MySqlConnection("server=localhost;database=carazongarage;uid=root");
        MySql.Data.MySqlClient.MySqlCommand command;
        public Munkalapok()
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
                MySql.Data.MySqlClient.MySqlDataAdapter adapter = new MySql.Data.MySqlClient.MySqlDataAdapter("" +
                    "SELECT name as felhasznalonev, " +
                    "note as megjegyzes, " +
                    "license_plate as rendszam, " +
                    "status as status, " +
                    "price as ar, " +
                    "date as hatarido " +
                    "FROM user " +
                    "JOIN vehicle " +
                    "ON vehicle.user_id " +
                    "JOIN appointments " +
                    "ON appointments.user_id;", connection);

                openConnection();
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                Datagrid_Munkalapok.ItemsSource = ds.Tables[0].DefaultView;
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
        private void Datagrid_Munkalapok_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Datagrid_Munkalapok.SelectedItem == null)
                return;

            var row = Datagrid_Munkalapok.SelectedItem as DataRowView;

            if (row == null)
                return;

            TexBlock_UgyfelNev.Text = row["felhasznalonev"].ToString();
            TexBlock_Cim.Text = row["megjegyzes"].ToString();
            Textblocl_Rendszam.Text = row["rendszam"].ToString();
            Textblock_Status.Text = row["status"].ToString();

            if (row["hatarido"] != DBNull.Value)
            {
                TexBlock_Hatarido.Text = Convert.ToDateTime(row["hatarido"]).ToString("yyyy-MM-dd");
            }
            else
            {
                TexBlock_Hatarido.Text = "-";
            }
        }


        private void DatePicker_Szures_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Datepicker_Szures.SelectedDate == null)
                return;

            DateTime kivalasztottDatum = Datepicker_Szures.SelectedDate.Value.Date;

            BetoltSzurtAdatok(kivalasztottDatum);
        }

        private void BetoltSzurtAdatok(DateTime datum)
        {
            string query =
                "SELECT name as felhasznalonev, note as megjegyzes, license_plate as rendszam, status, price, date as hatarido " +
                "FROM user " +
                "JOIN vehicle ON vehicle.user_id = user.id " +
                "JOIN appointments ON appointments.user_id = user.id " +
                "WHERE DATE(date) = @datum";

            command = new MySql.Data.MySqlClient.MySqlCommand(query, connection);
            command.Parameters.AddWithValue("@datum", datum.ToString("yyyy-MM-dd"));

            MySql.Data.MySqlClient.MySqlDataAdapter adapter =
                new MySql.Data.MySqlClient.MySqlDataAdapter(command);

            DataTable dt = new DataTable();
            adapter.Fill(dt);

            Datagrid_Munkalapok.ItemsSource = dt.DefaultView;
        }

        private void Megnyitas_Click(object sender, RoutedEventArgs e)
        {
            if (Datagrid_Munkalapok.SelectedItem == null)
            {
                MessageBox.Show("Nincs kijelölt munkalap!");
                return;
            }

            DataRowView dataRow = (DataRowView)Datagrid_Munkalapok.SelectedItem;

            MunkalapReszletek ujAblak = new MunkalapReszletek(
                dataRow["felhasznalonev"].ToString(),
                dataRow["rendszam"].ToString(),
                dataRow["megjegyzes"].ToString(),
                dataRow["status"].ToString()
            );

            ujAblak.ShowDialog();
        }

        private void Datepicker_Reset_Click(object sender, RoutedEventArgs e)
        {
            Datepicker_Szures.SelectedDate = null;

            AdatbazisIndit();
        }
    }
}
