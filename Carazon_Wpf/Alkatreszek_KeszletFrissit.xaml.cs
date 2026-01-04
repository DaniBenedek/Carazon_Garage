using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Windows;
using System.Windows.Controls;

namespace carazonGarage
{
    /// <summary>
    /// Interaction logic for Alkatreszek_KeszletFrissit.xaml
    /// </summary>
    public partial class Alkatreszek_KeszletFrissit : Window
    {
        MySqlConnection connection =
            new MySqlConnection("server=localhost;database=carazongarage;uid=root");

        private int selectedPartId = -1;

        public Alkatreszek_KeszletFrissit()
        {
            InitializeComponent();
            LoadParts();
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

        private void LoadParts()
        {
            try
            {
                openConnection();

                MySqlDataAdapter adapter =
                    new MySqlDataAdapter("SELECT id, name FROM products", connection);

                DataTable dt = new DataTable();
                adapter.Fill(dt);

                comboBox_Parts.ItemsSource = dt.DefaultView;
                comboBox_Parts.DisplayMemberPath = "name";
                comboBox_Parts.SelectedValuePath = "id";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                closeConnection();
            }
        }

        private void comboBox_Parts_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (comboBox_Parts.SelectedValue == null) return;

            selectedPartId = Convert.ToInt32(comboBox_Parts.SelectedValue);

            try
            {
                openConnection();

                string sql = "SELECT * FROM products WHERE id=@id";
                MySqlCommand cmd = new MySqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@id", selectedPartId);

                MySqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    textBox_Price.Text = reader["price"].ToString();
                    textBox_Quantity.Text = reader["storage_quantity"].ToString();
                    textBox_Type.Text = reader["type"].ToString();
                    textbox_Cikkszam.Text = reader["item_number"].ToString();
                    textBox_Description.Text = reader["description"].ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                closeConnection();
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            if (selectedPartId == -1)
            {
                MessageBox.Show("Válassz ki egy alkatrészt!");
                return;
            }

            MessageBoxResult result = MessageBox.Show(
                "Biztosan törölni szeretnéd ezt az alkatrészt?",
                "Megerősítés",
                MessageBoxButton.YesNo,
                MessageBoxImage.Warning);

            if (result != MessageBoxResult.Yes)
                return;

            try
            {
                openConnection();

                string sql = "DELETE FROM products WHERE id = @id";
                MySqlCommand cmd = new MySqlCommand(sql, connection);
                cmd.Parameters.AddWithValue("@id", selectedPartId);

                cmd.ExecuteNonQuery();

                MessageBox.Show("Alkatrész törölve!");

                Alkatreszek mainWindow = new Alkatreszek();
                this.Close();
                mainWindow.Show();
            }
            catch (Exception)
            {
                MessageBox.Show("Hiba történt törlés közben:\n");
            }
            finally
            {
                closeConnection();
            }
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (selectedPartId == -1)
            {
                MessageBox.Show("Válassz ki egy alkatrészt!");
                return;
            }

            try
            {
                openConnection();

                string sql = @"
                    UPDATE products SET
                        price = @price,
                        storage_quantity = @qty,
                        type = @type,
                        item_number = @itemNumber,
                        description = @desc
                    WHERE id = @id";

                MySqlCommand cmd = new MySqlCommand(sql, connection);

                cmd.Parameters.AddWithValue("@price", decimal.Parse(textBox_Price.Text));
                cmd.Parameters.AddWithValue("@qty", int.Parse(textBox_Quantity.Text));
                cmd.Parameters.AddWithValue("@type", textBox_Type.Text);
                cmd.Parameters.AddWithValue("@itemNumber", textbox_Cikkszam.Text);
                cmd.Parameters.AddWithValue("@desc", textBox_Description.Text);
                cmd.Parameters.AddWithValue("@id", selectedPartId);

                cmd.ExecuteNonQuery();

                MessageBox.Show("Alkatrész frissítve ✔");

                Alkatreszek mainWindow = new Alkatreszek();
                this.Close();
                mainWindow.Show();
            }
            catch (Exception)
            {
                MessageBox.Show("Hiba történt: Nem megfelelő formátum!");
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
