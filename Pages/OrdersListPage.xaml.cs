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
    /// Логика взаимодействия для OrdersListPage.xaml
    /// </summary>
    public partial class OrdersListPage : Page
    {
        public OrdersListPage()
        {
            InitializeComponent();
            UpdateOrders();
        }

        private void UpdateOrders()
        {
            var currentOrder = App.Context.Orders.ToList();

            DgOrder.ItemsSource = currentOrder;
        }

        private void BtnAddOrder_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.AddEditOrderPage());
        }

        private void BtnRemoveOrder_Click(object sender, RoutedEventArgs e)
        {
            var currentOrders = (sender as Button).DataContext as Entities.Order;

            if (MessageBox.Show($"Вы уверены, что хотите удалить заказ: " + $"{currentOrders.ID}?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                App.Context.Orders.Remove(currentOrders);
                App.Context.SaveChanges();
            }
            UpdateOrders();
        }
    }
}
