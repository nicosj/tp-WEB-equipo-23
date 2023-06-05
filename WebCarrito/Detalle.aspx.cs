using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using Dominio;

namespace WebCarrito
{
	public partial class Detalle : System.Web.UI.Page
	{
		CarritoCompra carrito;
		public List<CarritoCompra> listaCarrito { get; set; }
		public  List<Imagen> listaImagen { get; set; }
		public Articulo articulo { get; set; }
		public string alt  { get; set; }
		
		protected void Page_Load(object sender, EventArgs e)
		{
			/*int id_Seleccionado = Int32.Parse(Request.QueryString["id_seleccionado"]);*/
			//if(!IsPostBack){
			alt = Request.QueryString["id_seleccionado"].ToString();
			NegocioArticulo negocio = new NegocioArticulo();
			articulo = negocio.buscarXId(Int32.Parse(alt));
			if (!IsPostBack)
			{
				
			}

			NegocioImagen Imagen = new NegocioImagen();
			listaImagen = Imagen.listar();
			


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