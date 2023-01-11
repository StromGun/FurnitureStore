using System;
using System.Globalization;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

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

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateOrders();
        }

        private void UpdateOrders()
        {
            var currentOrder = App.Context.Orders.ToList();

            if (DPicker1.Text != "")
                currentOrder = currentOrder.Where(p => p.DateTimeOrder >= DateTime.ParseExact(DPicker1.Text, "d", CultureInfo.GetCultureInfo("ru-RU"))).ToList();
            if (DPicker2.Text != "")
                currentOrder = currentOrder.Where(p => p.DateTimeOrder <= DateTime.ParseExact(DPicker2.Text, "d", CultureInfo.GetCultureInfo("ru-RU"))).ToList();


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

        private void BtnEditOrder_Click(object sender, RoutedEventArgs e)
        {
            var currentOrders = (sender as Button).DataContext as Entities.Order;
            NavigationService.Navigate(new AddEditOrderPage(currentOrders));
        }

        #region DatePicker

        private void DPicker1_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateOrders();
        }
        
        private void DPicker2_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateOrders();
        }

        #endregion
    }
}
