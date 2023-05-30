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
		protected void Page_Load(object sender, EventArgs e)
		{
			//string id_Seleccionado = Request.QueryString["id_Seleccionado"].ToString();


			NegocioArticulo negocio = new NegocioArticulo();
			NegocioImagen Imagen = new NegocioImagen();
			listaImagen = Imagen.listar();
		}
	}
}