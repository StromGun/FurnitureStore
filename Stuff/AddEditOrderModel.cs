using FurnitureStore.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace FurnitureStore.Stuff
{
    internal class AddEditOrderModel
    {
        //Высчитываем сумму цен объектов из коллекции
        public string Summ(ItemCollection products)
        {
            decimal summ = 5;
            foreach (Product product in products)
            {
                if (product != null)
                    summ += product.Price;
            }
            return summ.ToString(); ;
        }

    }
}
