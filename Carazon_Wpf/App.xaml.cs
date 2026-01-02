using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace carazonGarage
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static string LoggedInUser { get; set; }
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            Login loginWindow = new Login();
            bool? result = loginWindow.ShowDialog();

            if (result == true)
            {
                LoggedInUser = loginWindow.LoggedInUser;

                MainWindow mainWindow = new MainWindow(loginWindow.LoggedInUser);
                MainWindow = mainWindow; // important
                mainWindow.Show();
            }
            else
            {
                Shutdown();
            }
        }
    }
}
