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
    /// Interaction logic for Alkatreszek_uj.xaml
    /// </summary>
    public partial class Alkatreszek_uj : Window
    {
        public Alkatreszek_uj()
        {
            InitializeComponent();
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(textBox_Name.Text) ||
                string.IsNullOrWhiteSpace(textBox_Type.Text) ||
                string.IsNullOrWhiteSpace(textbox_Cikkszam.Text))
            {
                MessageBox.Show("Alkatrész név, típus és cikkszám megadása kötelező!", "Hiba");
                return;
            }

            using (MySqlConnection conn = new MySqlConnection(
                "server=localhost;database=carazongarage;uid=root"))
            {
                conn.Open();

                string checkItemCode =
                    $"SELECT COUNT(*) FROM products WHERE item_number = '{textbox_Cikkszam.Text}'";

                MySqlCommand itemcodeCmd = new MySqlCommand(checkItemCode, conn);
                int itemcodeExists = Convert.ToInt32(itemcodeCmd.ExecuteScalar());

                if (itemcodeExists > 0)
                {
                    MessageBox.Show("Ez a cikkszám már létezik!", "Hiba");
                    return;
                }

                string insertPart =
                    $"INSERT INTO products(name, price, storage_quantity, type, item_number, description) " +
                    $"VALUES('{textBox_Name.Text}', '{textBox_Price.Text}', '{textBox_Quantity.Text}', " +
                    $"'{textBox_Type.Text}', '{textbox_Cikkszam.Text}', '{textBox_Description.Text}')";

                MySqlCommand cmdPart = new MySqlCommand(insertPart, conn);
                cmdPart.ExecuteNonQuery();
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
