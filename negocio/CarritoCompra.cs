using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using negocio;

namespace Dominio
{
	public class CarritoCompra
	{
		private List<Articulo> Item { get; set; }
		public CarritoCompra()
		{
			Item = new List<Articulo>();
		}
		private Articulo ItemID(int id)
		{
			NegocioArticulo negocio = new NegocioArticulo();
			foreach (Articulo item in negocio.listar())
			{
				if (item.Id == id)
				{
					return item;
				}
				
			}
			return null;
		}
		public void AgregarItem(Articulo item)
		{
			
			Articulo art = ItemID(item.Id);
			
			if (art != null)
			{
				// buscar si existe el item en la lista
				
				if(!Item.Exists(x => x.Id == art.Id))
					Item.Add(item);
				else
				{  int index = Item.FindIndex(x => x.Id == art.Id);
					Item[index].cantidad++;
				}

			}
			
		}
		public void EliminarItem(int id)
		{
			Item.RemoveAll(x => x.Id == id);
		}
		
		public void Actualizaritem(int id,int cantidad)
		{
			if (cantidad > 0)
			{
				Item[id].cantidad = cantidad;
			}
			else
			{
				EliminarItem(id);
			}
		}

		public decimal TotalCarrito
		{
			get
			{
				if (Item == null)
				{
					return 0;
				}
				else
				{
					decimal total = 0;
					foreach (Articulo item in Item)
					{
						total += item.Precio * item.cantidad;
					}
					return total;
				}
			}

			set
			{
				
			}
		}
		
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public List<Articulo> GetItems()
		{
			return Item;
		}
		
		public int GetCantidad()
		{
			return Item.Count();
		}
		public void VaciarCarrito()
		{
			Item.Clear();
		}
		public void EliminarCarrito()
        {
            Item.Clear();
        }
		
	}

}

