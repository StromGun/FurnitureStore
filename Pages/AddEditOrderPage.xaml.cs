using FurnitureStore.Entities;
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
    /// Логика взаимодействия для AddEditOrderPage.xaml
    /// </summary>
    public partial class AddEditOrderPage : Page
    {
        public AddEditOrderPage()
        {
            InitializeComponent();
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
    }
}
