using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FurnitureStore.Entities
{
    partial class Account
    {
        public string LoginExc 
        {
            get { return Login; }
            set { Login = value;
                if (String.IsNullOrEmpty(value))
                    throw new ApplicationException("Логин обязателен для заполнения");
            }
        }

    }
}
