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
using MySql.Data.MySqlClient;

namespace carazonGarage
{
    /// <summary>
    /// Interaction logic for ugyfelek_uj.xaml
    /// </summary>
    public partial class ugyfelek_uj : Window
    {
        public ugyfelek_uj()
        {
            InitializeComponent();
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(textBox_Name.Text) ||
                string.IsNullOrWhiteSpace(textBox_Email.Text) ||
                string.IsNullOrWhiteSpace(textBox_LicensePlate.Text))
            {
                MessageBox.Show("Név, email és rendszám megadása kötelező!", "Hiba");
                return;
            }

            using (MySqlConnection conn = new MySqlConnection(
                "server=localhost;database=carazongarage;uid=root"))
            {
                conn.Open();

                string checkEmail =
                    $"SELECT COUNT(*) FROM user WHERE email = '{textBox_Email.Text}'";

                MySqlCommand emailCmd = new MySqlCommand(checkEmail, conn);
                int emailExists = Convert.ToInt32(emailCmd.ExecuteScalar());

                if (emailExists > 0)
                {
                    MessageBox.Show("Ez az email már létezik!", "Hiba");
                    return;
                }

                string checkPlate =
                    $"SELECT COUNT(*) FROM vehicle WHERE license_plate = '{textBox_LicensePlate.Text}'";

                MySqlCommand plateCmd = new MySqlCommand(checkPlate, conn);
                int plateExists = Convert.ToInt32(plateCmd.ExecuteScalar());

                if (plateExists > 0)
                {
                    MessageBox.Show("Ez a rendszám már létezik!", "Hiba");
                    return;
                }

                string insertUser =
                    $"INSERT INTO user(name, email, phone_number) " +
                    $"VALUES('{textBox_Name.Text}', '{textBox_Email.Text}', '{textBox_Phone.Text}')";

                MySqlCommand cmdUser = new MySqlCommand(insertUser, conn);
                cmdUser.ExecuteNonQuery();
                int userId = (int)cmdUser.LastInsertedId;

                string insertVehicle =
                    $"INSERT INTO vehicle(user_id, country_id, license_plate, vehicle_make, vehicle_model) " +
                    $"VALUES({userId}, 1, '{textBox_LicensePlate.Text}', '{textBox_Make.Text}', '{textBox_Model.Text}')";

                MySqlCommand cmdVehicle = new MySqlCommand(insertVehicle, conn);
                cmdVehicle.ExecuteNonQuery();
            }

            DialogResult = true;
            Close();
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}