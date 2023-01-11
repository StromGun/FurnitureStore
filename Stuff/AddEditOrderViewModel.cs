using FurnitureStore.Entities;
using FurnitureStore.Stuff.Base;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FurnitureStore.Stuff
{
    public class AddEditOrderViewModel : ObservableObject
    {
        private ObservableCollection<Product> products;
        public ObservableCollection<Product> Products
        {
            get => products;
            set { products = value; NotifyPropertyChanged(); }
        }

        public RelayCommand LboxSelectionChanged;

        //private AddEditOrderViewModel()
        //{
        //    LboxSelectionChanged = new RelayCommand(o =>
        //    {
        //        Products = 
        //    })
        //}

    }
}
