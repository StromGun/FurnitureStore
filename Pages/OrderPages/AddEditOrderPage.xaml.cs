using FurnitureStore.Entities;
using FurnitureStore.Stuff;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace FurnitureStore.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditOrderPage.xaml
    /// </summary>
    public partial class AddEditOrderPage : Page
    {
        private Product product = new Product();
        private Order currentOrder;
        private readonly AddEditOrderViewModel viewModel = new AddEditOrderViewModel();

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


            //viewModel.Summ = product.Summ(LViewOrder.Items);
            viewModel.Summa(LViewOrder.Items);

            //TboxSumm.Text = product.Summ(LViewOrder.Items).ToString();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (currentOrder == null)
            {
                var order = new Order
                {
                    DateOrder = DateTime.Now,
                    TimeOrder = DateTime.Now.TimeOfDay,
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
            else
            {
                currentOrder.Cost = Convert.ToDecimal(TboxSumm.Text);

                // удаляем старые записи
                currentOrder.Products.Clear();

                foreach (var item in LboxProducts.SelectedItems)
                {
                    currentOrder.Products.Add((Product)item);
                }
                App.Context.SaveChanges();
            }
            NavigationService.GoBack();
        }
    }
}
