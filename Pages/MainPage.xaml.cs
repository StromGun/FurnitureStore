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
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private void BtnOrderList_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new OrdersListPage());
        }

        private void BtnProductList_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductPages.ProductListPage());
        }

        private void BtnSellerList_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnCheckList_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
