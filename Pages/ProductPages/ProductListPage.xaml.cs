using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace FurnitureStore.Pages.ProductPages
{
    /// <summary>
    /// Логика взаимодействия для ProductListPage.xaml
    /// </summary>
    public partial class ProductListPage : Page
    {
        public ProductListPage()
        {
            InitializeComponent();
            UpdateProducts();

            
            CBoxType.ItemsSource = App.Context.ProductTypes.ToList();
            CBoxManufacturer.ItemsSource = App.Context.Manufacturers.ToList();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateProducts();
        }

        private void UpdateProducts()
        {
            var currentProduct = App.Context.Products.ToList();

            if (CBoxManufacturer.SelectedIndex != -1)
            currentProduct = currentProduct.Where(p => p.Manufacturer_number == Convert.ToInt32(CBoxManufacturer.SelectedValue)).ToList();
            if (CBoxType.SelectedIndex != -1)
            currentProduct = currentProduct.Where(p => p.ProductType == Convert.ToInt32(CBoxType.SelectedValue)).ToList();

            currentProduct = currentProduct.Where(p => p.Name.ToLower().Contains(TboxSearch.Text.ToLower())).ToList();

            DgProduct.ItemsSource = currentProduct;
        }

        private void CBoxType_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateProducts();
        }

        private void CBoxManufacturer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateProducts();
        }

        private void TboxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateProducts();
        }

        #region Images

            private void ImgCancel1_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
            {
                CBoxType.SelectedIndex = -1;
            }

            private void ImgCancel2_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
            {
                CBoxManufacturer.SelectedIndex = -1;
            }

        #endregion

        private void BtnEditProduct_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnRemoveProduct_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddEditProductPage());
        }
    }
}
