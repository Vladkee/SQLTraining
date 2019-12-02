using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopApp
{
    public class Product
    {
        public string ProductID { get; set; }

        public string ItemName { get; set; }

        public string Price { get; set; }

        public string Quantity { get; set; }

        public Product(string productID, string itemName, string price, string quantity)
        {
            this.ProductID = productID;
            this.ItemName = itemName;
            this.Price = price;
            this.Quantity = quantity;
        }

        public override string ToString()
        {
            return this.ProductID + ", " + this.ItemName + ", " + this.Price + ", " + this.Quantity;
        }
    }
}
