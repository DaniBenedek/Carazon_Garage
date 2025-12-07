using System;
using System.Windows;
using MySql.Data.MySqlClient;

namespace carazonGarage
{
    public partial class login : Window
    {
        MySqlConnection connection = new MySqlConnection("server=localhost;database=carazongarage;uid=root;");

        public login()
        {
            InitializeComponent();
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            string username = TxtUsername.Text.Trim();
            string password = TxtPassword.Password.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Kérlek, add meg a felhasználónevet és a jelszót!");
                return;
            }

            try
            {
                connection.Open();
                string query = "SELECT COUNT(*) FROM user WHERE name=@username AND password=@password";
                MySqlCommand cmd = new MySqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                int result = Convert.ToInt32(cmd.ExecuteScalar());

                if (result > 0)
                {
                    // ✅ DialogResult true → modal ablak bezárul, App.xaml.cs folytatódik
                    this.DialogResult = true;
                }
                else
                {
                    MessageBox.Show("Hibás felhasználónév vagy jelszó!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hiba az adatbázis elérésénél: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
