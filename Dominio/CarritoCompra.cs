using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{

	[Serializable]
	public class CarritoItem
	{
		private int _IDproducto;
		private string _NombreProducto;
		private string _URLimagen;
		private int _Cantidad;
		private double _Precio;
		private double _subTotal;

		public Articulo articulo { get; set; }


		public CarritoItem()
		{
		}
		public CarritoItem(int IDproducto, string NombreProducto,
				string ImagenUrl, int Cantidad, double Precio)
		{
			_IDproducto = IDproducto;
			_NombreProducto = NombreProducto;
			_URLimagen = ImagenUrl;
			_Cantidad = Cantidad;
			_Precio = Precio;
			_subTotal = Cantidad * Precio;
		}
		public int IDproducto
		{
			get
			{
				return _IDproducto;
			}
			set
			{
				_IDproducto = value;
			}
		}
		public string NombreProducto
		{
			get { return NombreProducto; }
			set { NombreProducto = value; }
		}
		public string ImagenURL
		{
			get { return _URLimagen; }
			set { _URLimagen = value; }
		}

		public int Cantidad
		{
			get { return _Cantidad; }
			set { _Cantidad = value; }
		}

		public double Precio
		{
			get { return _Precio; }
			set { _Precio = value; }
		}

		public double SubTotal
		{
			get { return _Cantidad * _Precio; }

		}
	}
	[Serializable]
	public class Carrito
	{
		private DateTime _FechaCreacion;
		private DateTime _UltActualizacion;
		private List<CarritoItem> _items;

		public Carrito()
		{
			if (this._items == null)
			{
				this._items = new List<CarritoItem>();
				this._FechaCreacion = DateTime.Now;
			}
		}

		public List<CarritoItem> Items
		{
			get { return _items; }
			set { _items = value; }
		}

		public void AgregarItem(int IDproducto, double Precio,
		int Cantidad, string NombreProducto, string ImagenURL)
		{
			int ItemIndex = IndicedeIDitem(IDproducto);
			if (ItemIndex == -1)
			{
				CarritoItem NewItem = new CarritoItem();
				NewItem.IDproducto = IDproducto;
				NewItem.Cantidad = Cantidad;
				NewItem.Precio = Precio;
				NewItem.NombreProducto = NombreProducto;
				NewItem.ImagenURL = ImagenURL;
				_items.Add(NewItem);
			}
			else
			{
				_items[ItemIndex].Cantidad += 1;
			}
			_UltActualizacion = DateTime.Now;
		}

		public void ActualizarItem(int IDFila, int IDproducto,
							  int Cantidad, double Precio)
		{
			CarritoItem Item = _items[IDFila];
			Item.IDproducto = IDproducto;
			Item.Cantidad = Cantidad;
			Item.Precio = Precio;
			_UltActualizacion = DateTime.Now;
		}

		public void BorrarItem(int rowID)
		{
			_items.RemoveAt(rowID);
			_UltActualizacion = DateTime.Now;
		}

		private int IndicedeIDitem(int ProductID)
		{
			int index = 0;
			foreach (CarritoItem item in _items)
			{
				if (item.IDproducto == ProductID)
				{
					return index;
				}
				index += 1;
			}
			return -1;
		}

		public double Total
		{
			get
			{
				double t = 0;
				if (_items == null)
				{
					return 0;
				}
				foreach (CarritoItem Item in _items)
				{
					t += Item.SubTotal;
				}
				return t;
			}
		}

	}
}

