using MySql.Data.MySqlClient;
// using MySqlConnector; // Ezt érdemes kikommentelni, ha a MySql.Data-t használod, hogy ne legyen ütközés
using System;
using System.Data;
using System.Windows;
using System.Windows.Controls;

namespace carazonGarage
{
    public partial class Munkalapok : Window
    {
        // Egységesítettük a típust, hogy ne kelljen mindig kiírni a teljes nevet
        MySqlConnection connection = new MySqlConnection("server=localhost;database=carazongarage;uid=root");
        MySqlCommand command;

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
                // JAVÍTOTT LEKÉRDEZÉS: Hozzáadtuk az összekapcsolási feltételeket (ON ...)
                string query = "SELECT user.name as felhasznalonev, " +
                               "appointments.note as megjegyzes, " +
                               "vehicle.license_plate as rendszam, " +
                               "appointments.status as status, " +
                               "appointments.price as ar, " +
                               "appointments.date as hatarido " +
                               "FROM user " +
                               "JOIN vehicle ON user.id = vehicle.user_id " +
                               "JOIN appointments ON user.id = appointments.user_id;";

                MySqlDataAdapter adapter = new MySqlDataAdapter(query, connection);

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

        public void closeConnection()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        private void Datagrid_Munkalapok_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Datagrid_Munkalapok.SelectedItem is DataRowView row)
            {
                TexBlock_UgyfelNev.Text = row["felhasznalonev"].ToString();
                TexBlock_Cim.Text = row["megjegyzes"].ToString();
                Textblocl_Rendszam.Text = row["rendszam"].ToString();
                Textblock_Status.Text = row["status"].ToString();

                if (row["hatarido"] != DBNull.Value)
                    TexBlock_Hatarido.Text = Convert.ToDateTime(row["hatarido"]).ToString("yyyy-MM-dd");
                else
                    TexBlock_Hatarido.Text = "-";
            }
        }

        private void DatePicker_Szures_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Datepicker_Szures.SelectedDate != null)
            {
                BetoltSzurtAdatok(Datepicker_Szures.SelectedDate.Value.Date);
            }
        }

        private void BetoltSzurtAdatok(DateTime datum)
        {
            try
            {
                // Itt is javítottuk az ON feltételeket
                string query =
                    "SELECT user.name as felhasznalonev, appointments.note as megjegyzes, vehicle.license_plate as rendszam, " +
                    "appointments.status, appointments.price, appointments.date as hatarido " +
                    "FROM user " +
                    "JOIN vehicle ON vehicle.user_id = user.id " +
                    "JOIN appointments ON appointments.user_id = user.id " +
                    "WHERE DATE(appointments.date) = @datum";

                openConnection();
                command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@datum", datum.ToString("yyyy-MM-dd"));

                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                Datagrid_Munkalapok.ItemsSource = dt.DefaultView;
                closeConnection();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }

        private void Megnyitas_Click(object sender, RoutedEventArgs e)
        {
            if (Datagrid_Munkalapok.SelectedItem is DataRowView dataRow)
            {
                MunkalapReszletek ujAblak = new MunkalapReszletek(
                    dataRow["felhasznalonev"].ToString(),
                    dataRow["rendszam"].ToString(),
                    dataRow["megjegyzes"].ToString(),
                    dataRow["status"].ToString()
                );
                ujAblak.ShowDialog();
            }
            else
            {
                MessageBox.Show("Nincs kijelölt munkalap!");
            }
        }

        private void Datepicker_Reset_Click(object sender, RoutedEventArgs e)
        {
            Datepicker_Szures.SelectedDate = null;
            AdatbazisIndit();
        }

        private void Kilepes_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            this.Close();
            mainWindow.Show();
        }
    }
}