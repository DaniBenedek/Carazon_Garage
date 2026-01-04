using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Windows;

namespace carazonGarage
{
    /// <summary>
    /// Interaction logic for Alkatreszek_uj.xaml
    /// </summary>
    public partial class Alkatreszek_uj : Window
    {
        MySqlConnection connection = new MySqlConnection("server=localhost;database=carazongarage;uid=root");

        public Alkatreszek_uj()
        {
            InitializeComponent();
        }

        private void openConnection()
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();
        }

        private void closeConnection()
        {
            if (connection.State == ConnectionState.Open)
                connection.Close();
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                openConnection();

                string sql = @"
                            INSERT INTO products
                            (name, price, storage_quantity, type, item_number, description)
                            VALUES
                            (@name, @price, @qty, @type, @itemNumber, @desc)";

                MySqlCommand cmd = new MySqlCommand(sql, connection);

                cmd.Parameters.AddWithValue("@name", textBox_Name.Text);
                cmd.Parameters.AddWithValue("@price", decimal.Parse(textBox_Price.Text));
                cmd.Parameters.AddWithValue("@qty", int.Parse(textBox_Quantity.Text));
                cmd.Parameters.AddWithValue("@type", textBox_Type.Text);
                cmd.Parameters.AddWithValue("@itemNumber", textbox_Cikkszam.Text);
                cmd.Parameters.AddWithValue("@desc", textBox_Description.Text);

                cmd.ExecuteNonQuery();

                MessageBox.Show("Alkatrész sikeresen felvéve ✔");

                Alkatreszek mainWindow = new Alkatreszek();
                this.Close();
                mainWindow.Show();

            }
            catch (Exception)
            {
                MessageBox.Show("Hiba történt: Nem megfelelő formátum\n");
            }
            finally
            {
                closeConnection();
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Alkatreszek mainWindow = new Alkatreszek();
            this.Close();
            mainWindow.Show();
        }
    }
}
