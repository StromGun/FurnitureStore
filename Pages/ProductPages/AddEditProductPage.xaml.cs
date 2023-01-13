using FurnitureStore.Entities;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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

namespace FurnitureStore.Pages.ProductPages
{
    /// <summary>
    /// Логика взаимодействия для AddEditProductPage.xaml
    /// </summary>
    public partial class AddEditProductPage : Page
    {
        Product currentProduct = null;
        private byte[] imageData; 

        public AddEditProductPage()
        {
            InitializeComponent();

            CBoxType.ItemsSource = App.Context.ProductTypes.ToList();
            CBoxManufacturer.ItemsSource = App.Context.Manufacturers.ToList();
        }

        public AddEditProductPage(Product product)
        {
            InitializeComponent();

            currentProduct = product;
            Title = "Редактирование мебели";

            CBoxType.ItemsSource = App.Context.ProductTypes.ToList();
            CBoxManufacturer.ItemsSource = App.Context.Manufacturers.ToList();

            TBoxName.Text = currentProduct.Name;
            CBoxType.SelectedValue = currentProduct.ProductType;
            CBoxManufacturer.SelectedValue = currentProduct.Manufacturer_number;
            TBoxPrice.Text = currentProduct.Price.ToString();
            TBoxGuarantee.Text = currentProduct.GuaranteeMonth.ToString();
            if (currentProduct.Image != null)
                ImageProduct.Source = (ImageSource)new ImageSourceConverter().ConvertFrom(currentProduct.Image);
        }

        private void BtnAddImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Image | *.png; *.jpg; *.jpeg";
            if (ofd.ShowDialog() == true)
            {
                imageData = File.ReadAllBytes(ofd.FileName);
                ImageProduct.Source = (ImageSource)new ImageSourceConverter().ConvertFrom(imageData);
            }
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if ( currentProduct == null)
            {
                var product = new Product
                {
                    Name = TBoxName.Text,
                    ProductType = Convert.ToInt32(CBoxType.SelectedValue),
                    Manufacturer_number = Convert.ToInt32(CBoxManufacturer.SelectedValue),
                    Price = Convert.ToInt32(TBoxPrice.Text),
                    GuaranteeMonth = Convert.ToInt32(TBoxGuarantee.Text)
                };
                App.Context.Products.Add(product);
                App.Context.SaveChanges();
            }
            NavigationService.GoBack();
        }
    }
}
