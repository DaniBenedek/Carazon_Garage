using System;
using System.Windows;
using MySql.Data.MySqlClient;

namespace carazonGarage
{
    /// <summary>
    /// Interaction logic for MunkalapReszletek.xaml
    /// </summary>
    public partial class MunkalapReszletek : Window
    {
        private string _rendszam;

        public MunkalapReszletek(string ugyfelNev, string rendszam, string megjegyzes, string statusz)
        {
            InitializeComponent();

            _rendszam = rendszam;

            UgyfelNev.Text = ugyfelNev;
            Rendszam.Text = $"Rendszám: {rendszam}";
            Statusz.Text = $"Státusz: {statusz}";
            Leiras.Text = megjegyzes;

            LoadServiceStatus();
        }

        private void LoadServiceStatus()
        {
            using (MySqlConnection conn = new MySqlConnection(
                "server=localhost;database=carazongarage;uid=root"))
            {
                conn.Open();

                string query =
                    $"SELECT * FROM service_status " +
                    $"WHERE license_plate = '{_rendszam}' " +
                    $"AND service_date = CURDATE()";

                MySqlCommand cmd = new MySqlCommand(query, conn);
                MySqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    CheckBox_Oilchange.IsChecked = Convert.ToInt32(reader["oil_change"]) == 1;
                    CheckBox_Brakechange.IsChecked = Convert.ToInt32(reader["brake_repair"]) == 1;
                    CheckBox_General.IsChecked = Convert.ToInt32(reader["general_inspection"]) == 1;
                    CheckBox_Diagnostic.IsChecked = Convert.ToInt32(reader["diagnostic"]) == 1;
                    CheckBox_AcFill.IsChecked = Convert.ToInt32(reader["ac_fill"]) == 1;
                    CheckBox_Clutchfix.IsChecked = Convert.ToInt32(reader["clutch_change"]) == 1;
                }
                else
                {
                    CheckBox_Oilchange.IsChecked = false;
                    CheckBox_Brakechange.IsChecked = false;
                    CheckBox_General.IsChecked = false;
                    CheckBox_Diagnostic.IsChecked = false;
                    CheckBox_AcFill.IsChecked = false;
                    CheckBox_Clutchfix.IsChecked = false;
                }
            }
        }
        private void MarkAppointmentDone()
        {
            using (MySqlConnection conn = new MySqlConnection(
                "server=localhost;database=carazongarage;uid=root"))
            {
                conn.Open();

                string query =
                    "UPDATE appointments a " +
                    "JOIN vehicle v ON a.vehicle_id = v.id " +
                    "SET a.status = 'done' " +
                    "WHERE v.license_plate = @plate " +
                    "AND a.date = CURDATE()";

                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@plate", _rendszam);

                cmd.ExecuteNonQuery();
            }
        }

        private void Mentes_Click(object sender, RoutedEventArgs e)
        {
            using (MySqlConnection conn = new MySqlConnection(
                "server=localhost;database=carazongarage;uid=root"))
            {
                conn.Open();

                string check =
                    $"SELECT COUNT(*) FROM service_status " +
                    $"WHERE license_plate = '{_rendszam}' " +
                    $"AND service_date = CURDATE()";

                MySqlCommand checkCmd = new MySqlCommand(check, conn);
                int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

                int oil = CheckBox_Oilchange.IsChecked == true ? 1 : 0;
                int brake = CheckBox_Brakechange.IsChecked == true ? 1 : 0;
                int general = CheckBox_General.IsChecked == true ? 1 : 0;
                int diag = CheckBox_Diagnostic.IsChecked == true ? 1 : 0;
                int ac = CheckBox_AcFill.IsChecked == true ? 1 : 0;
                int clutch = CheckBox_Clutchfix.IsChecked == true ? 1 : 0;

                if (exists > 0)
                {
                    string update =
                        $"UPDATE service_status SET " +
                        $"oil_change={oil}, " +
                        $"brake_repair={brake}, " +
                        $"general_inspection={general}, " +
                        $"diagnostic={diag}, " +
                        $"ac_fill={ac}, " +
                        $"clutch_change={clutch} " +
                        $"WHERE license_plate='{_rendszam}' " +
                        $"AND service_date=CURDATE()";

                    new MySqlCommand(update, conn).ExecuteNonQuery();
                }
                else
                {
                    string insert =
                        $"INSERT INTO service_status " +
                        $"(license_plate, service_date, oil_change, brake_repair, general_inspection, diagnostic, ac_fill, clutch_change) " +
                        $"VALUES ('{_rendszam}', CURDATE(), {oil}, {brake}, {general}, {diag}, {ac}, {clutch})";

                    new MySqlCommand(insert, conn).ExecuteNonQuery();
                }
            }
            MarkAppointmentDone();
            MessageBox.Show("Szerviz mentve.", "Információ");
            DialogResult = true;
            Close();
        }

        private void Kilpes_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
