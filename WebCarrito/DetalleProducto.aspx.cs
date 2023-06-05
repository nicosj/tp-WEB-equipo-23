using Dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCarrito
{
	public partial class DetalleProducto : System.Web.UI.Page
	{
		CarritoCompra carrito;
		public List<CarritoCompra> listaCarrito { get; set; }
		public List<Imagen> listaImagen { get; set; }
		public List<Articulo> listaArticulos { get; set; }
		public Articulo articulo { get; set; }
		public string alt { get; set; }

		public Categoria categoria { get; set; }
		public List<Categoria> listaCategorias { get; set; }
		public Marca marca { get; set; }	
		public List<Marca> listaMarcas { get; set; }

		protected void Page_Load(object sender, EventArgs e)
		{
			/*int id_Seleccionado = Int32.Parse(Request.QueryString["id_seleccionado"]);*/
			alt = Request.QueryString["id_seleccionado"].ToString();
			
			NegocioArticulo negocio = new NegocioArticulo();
			articulo = negocio.buscarXId(Int32.Parse(alt));			

			
			NegocioImagen Imagen = new NegocioImagen();
			listaArticulos = negocio.listarConSP();
			listaImagen = Imagen.listar();

			NegocioCategoria negocioCategoria = new NegocioCategoria();
			listaCategorias = negocioCategoria.listar();
			NegocioMarca negocioMarca = new NegocioMarca();
			listaMarcas = negocioMarca.listar();
			


		}
		protected void btnAddCarro_Click(object sender, EventArgs e)
		{
			if(Session["carrito"] == null)
			{ 
				carrito = new CarritoCompra();
				Session["carrito"] = carrito;
			}
			carrito = (CarritoCompra)Session["carrito"];
			carrito.AgregarItem(articulo);
	       
			
		}
	}
}