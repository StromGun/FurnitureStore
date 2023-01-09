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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace FurnitureStore.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        public AuthorizationPage()
        {
            InitializeComponent();
        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            var currentUser = App.Context.Accounts
                .FirstOrDefault(p => p.Login == TboxLogin.Text && p.Password == PboxPassword.Password);

            if (currentUser != null)
            {
                App.CurrentUser = currentUser;
                NavigationService.Navigate(new Pages.OrdersListPage());
            }
            else
            {
                MessageBox.Show("Пользователь с такими данными не найден","Ошибка",MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
