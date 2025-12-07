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

namespace carazonGarage
{
    /// <summary>
    /// Interaction logic for MunkalapReszletek.xaml
    /// </summary>
    public partial class MunkalapReszletek : Window
    {
        public MunkalapReszletek()
        {
            InitializeComponent();
            this.Closed += Window_Closed;
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            Application.Current.Shutdown();
        }
        public MunkalapReszletek(string name, string plate, string note, string status)
        {
            InitializeComponent();
            UgyfelNev.Text = "Ügyfél: " + name;
            Rendszam.Text = "Rendszám: " + plate;
            Statusz.Text = "Státusz: " + status;
            Leiras.Text = "Leírás: " + note;
        }

        private void Mentes_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Mentve!");
            this.Close();
        }

        private void Kilpes_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
