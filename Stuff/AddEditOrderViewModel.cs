using FurnitureStore.Entities;
using FurnitureStore.Stuff.Base;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Windows.Controls;

namespace FurnitureStore.Stuff
{
    public class AddEditOrderViewModel : ObservableObject
    {
        Product product = new Product();

        private decimal summ;
        public decimal Summ { get { return summ; } set { summ = value; NotifyPropertyChanged(); } }

        public RelayCommand LboxSelectionChanged;

        public void Summa(ItemCollection item)
        {
            Summ = product.Summ(item);
        }

        //private AddEditOrderViewModel()
        //{
        //    LboxSelectionChanged = new RelayCommand(o =>
        //    {
        //        Products = 
        //    })
        //}

    }
}
