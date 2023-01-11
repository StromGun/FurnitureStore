using FurnitureStore.Stuff;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Windows.Controls;

namespace FurnitureStore.Entities
{
    partial class Product
    {
        //Высчитываем сумму цен объектов из коллекции
        public decimal Summ(ItemCollection products)
        {
            decimal summ = 0;
            foreach (Product product in products)
            {        
                if(product != null)
                summ += product.Price;
            }
            return summ;
        }

        
        
    }
}
