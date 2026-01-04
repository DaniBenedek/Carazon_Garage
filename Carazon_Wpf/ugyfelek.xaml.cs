using carazonGarage.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace carazonGarage
{
    /// <summary>
    /// Interaction logic for ugyfelek.xaml
    /// </summary>
    public partial class ugyfelek : Window
    {
        List<CustomerCar> customers = new List<CustomerCar>();

        public ugyfelek()
        {
            InitializeComponent();
            LoadCustomers();
        }

        private void LoadCustomers()
        {
            customers.Clear();

            using (MySqlConnection conn = new MySqlConnection("server=localhost;database=carazongarage;uid=root"))
            {
                conn.Open();

                string query = @"
                                SELECT 
                                    u.id,
                                    u.name,
                                    u.phone_number,
                                    v.license_plate AS plate,
                                    CONCAT(v.vehicle_make, ' ', v.vehicle_model) AS model,
                                    'AKTIV' AS status
                                FROM user u
                                JOIN vehicle v ON v.user_id = u.id";

                MySqlCommand cmd = new MySqlCommand(query, conn);
                MySqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    customers.Add(new CustomerCar
                    {
                        Id = reader.GetInt32("id"),
                        CustomerName = reader.GetString("name"),
                        Phone = reader["phone_number"] != DBNull.Value ? "Telefon: " + reader["phone_number"].ToString() : "",
                        Plate = "Rendszamtabla: " + reader["plate"].ToString(),
                        Car = reader["model"].ToString(),
                        Status = reader["status"].ToString().ToUpper()
                    });
                }
            }

            CustomersItems.ItemsSource = customers;
        }

        private void CustomerCard_Click(object sender, MouseButtonEventArgs e)
        {
            var border = sender as Border;
            if (border == null) return;

            var selected = border.DataContext as CustomerCar;
            if (selected == null) return;

            MessageBox.Show(
                $"Ügyfél: {selected.CustomerName}\nAutó: {selected.Plate} • {selected.Car}\nStátusz: {selected.Status}",
                "Részletek");
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string search = SearchTextBox.Text.ToLower();

            if (string.IsNullOrWhiteSpace(search))
            {
                CustomersItems.ItemsSource = customers;
                return;
            }

            var filtered = customers.FindAll(c =>
                c.CustomerName.ToLower().Contains(search)
            );

            CustomersItems.ItemsSource = filtered;
        }

        private void NewCustomer_Click(object sender, RoutedEventArgs e)
        {
            ugyfelek_uj uj = new ugyfelek_uj();
            if (uj.ShowDialog() == true)
            {
                LoadCustomers();
            }
        }

        private void Kilepes_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
