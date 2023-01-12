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
        Product currentProduct = new Product();
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

            Title = "Редактирование мебели";

            CBoxType.ItemsSource = App.Context.ProductTypes.ToList();
            CBoxManufacturer.ItemsSource = App.Context.Manufacturers.ToList();
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

        }
    }
}
