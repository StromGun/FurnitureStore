﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FurnitureStore.Entities
{
    partial class OrderProduct
    {
        public ICollection<Product> Products { get; set; }
    }
}
