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
		public  List<Imagen> listaImagen { get; set; }
		public Articulo articulo { get; set; }
		public string alt  { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{
			/*int id_Seleccionado = Int32.Parse(Request.QueryString["id_seleccionado"]);*/
			alt = Request.QueryString["id_seleccionado"].ToString();


			NegocioArticulo negocio = new NegocioArticulo();
			NegocioImagen Imagen = new NegocioImagen();
			listaImagen = Imagen.listar();
			/*articulo = negocio.buscarXId(id_Seleccionado);*/


		}
		
	}
}