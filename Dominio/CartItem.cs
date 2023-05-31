using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    internal class CartItem: IEquatable<CartItem>
    {
        #region Properties
        // A place to store the quantity in the cart 
        // This property has an implicit getter and setter. 
        public int CantItems { get; set; }
        private int _ProductoID;
        public int ProductoID
        {
            get { return _ProductoID; }
            set
            {
                // To ensure that the Prod object will be re-created 
                _Producto = null;
                _ProductoID = value;
            }
        }
        private Articulo _Producto = null;
        public Articulo Prod
        {
            get
            {
                // Lazy initialization - the object won't be created until it is needed 
                if (_Producto == null)
                {
                    _Producto = new Articulo(); //???????????????
                }
                return _Producto;
            }
        }
        public string Descripcion
        {
            get { return Prod.Descripcion; }
        }
        public decimal PrecioUnidad
        {
            get { return Prod.Precio; }
        }
        public decimal PrecioTotal
        {
            get { return PrecioUnidad * CantItems; }
        }
        #endregion
        // CartItem constructor just needs a productId 
        public CartItem(int productId)
        {
            this.ProductoID = productId;
        }
        /** 
    * Equals() - Needed to implement the IEquatable interface 
    * Tests whether or not this item is equal to the parameter 
    * This method is called by the Contains() method in the List class 
    * We used this Contains() method in the ShoppingCart AddItem() method 
*/
        public bool Equals(CartItem item)
        {
            return item.ProductoID == this.ProductoID;
        }
    }
