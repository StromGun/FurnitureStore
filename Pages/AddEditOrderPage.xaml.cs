using FurnitureStore.Entities;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
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
    /// Логика взаимодействия для AddEditOrderPage.xaml
    /// </summary>
    public partial class AddEditOrderPage : Page
    {
        private Product product = new Product();
        private Order currentOrder;

        public AddEditOrderPage()
        {
            InitializeComponent();
            UpdateLboxProducts();
            
            CboxTypeFilter.ItemsSource = App.Context.ProductTypes.ToList();
            CboxTypeFilter.SelectedIndex = 0;
        }

        public AddEditOrderPage(Order order)
        {
            InitializeComponent();
            currentOrder = order;
            Title = "Редактирование заказа";

            LboxProducts.SelectedItem = currentOrder.Products;

            UpdateLboxProducts();

            CboxTypeFilter.ItemsSource = App.Context.ProductTypes.ToList();
            CboxTypeFilter.SelectedIndex = 0;
        }

        private void UpdateLboxProducts()
        {
            var currentProduct = App.Context.Products.ToList();

            if (CboxTypeFilter.SelectedIndex != 0)
                currentProduct = currentProduct.Where(p => p.ProductType == Convert.ToInt32(CboxTypeFilter.SelectedValue)).ToList();
            

            LboxProducts.ItemsSource = currentProduct;
        }

        private void CboxTypeFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateLboxProducts();
        }

        private void LboxProducts_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            // Берем коллекцию объектов из ListView передаем ее в функцию суммы из модели и преобразуем в строковый тип со знаком ₽
            //TboxSumm.Text = product.Summ(LViewOrder.Items).ToString($"Итого {0:C}", CultureInfo.CreateSpecificCulture("ru-RU"));
            TboxSumm.Text = product.Summ(LViewOrder.Items).ToString();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (currentOrder != null)
            {
                var order = new Order
                {
                    DateOrder = DateTime.Now,
                    Cost = Convert.ToDecimal(TboxSumm.Text),
                };

                // Берем каждый выбранный элемент из ListBox и добавляем в промежуточную таблицу
                foreach (var item in LboxProducts.SelectedItems)
                {
                    order.Products.Add((Product)item);
                }

                App.Context.Orders.Add(order);
                App.Context.SaveChanges();
            }
            NavigationService.GoBack();
        }
    }
}
