using System;

namespace FurnitureStore.Entities
{
    partial class Order
    {
        public decimal Summ
        {
            get 
            {
                decimal summ = 0;
                foreach (var priceT in Products)
                {
                    summ += priceT.Price;
                }
                return summ;
            }
        }

        public DateTime DateTimeOrder
        {
            get => DateOrder + TimeOrder;
        }
    }
}
