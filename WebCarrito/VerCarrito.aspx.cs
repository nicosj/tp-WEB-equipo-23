using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Dominio;

namespace WebCarrito
{

	public partial class VerCarrito : Page
	{
		protected CarritoCompra carrito;
		public Button btn;
		public List<Articulo> listaCarrito { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{

			int index = 0;
			carrito = (CarritoCompra)Session["carrito"];
			if (carrito != null)
			{
				foreach (Articulo item in carrito.GetItems())
				{
					Console.WriteLine("asdsad");
					btn = new Button();
					btn.Text = "x";
					btn.ID = "btnx"+index.ToString();
					btn.Click += new EventHandler(btnEliminar);
					btn.CommandArgument = item.Id.ToString();
					btn.CssClass = "btn btn-danger btn-xs btnOcultoVer";
					adaptador.Controls.Add(btn);
					index++;



			//< script >

			//	  var contadorElementos = document.getElementsByClassName('btnOcultoVer').length;
			//		for (var i = 0; i < contadorElementos; i++)
			//		{
			//			document.getElementById('btn' + i).appendChild(document.getElementById('btnFlotante' + i))

			//	}
			//</ script >
				}
			}

			if (!IsPostBack)
			{
				carrito = (CarritoCompra)Session["carrito"];
				MostrarCarro();
			}
			if (carrito == null)
			{


			}
			else
			{

			}
		}

		public void btnEliminar(object sender, EventArgs e)
		{

			Button btn = (Button)sender;
			int id = Convert.ToInt32(btn.CommandArgument);
			carrito = (CarritoCompra)Session["carrito"];
			carrito.EliminarItem(id);
			Session.Add("carrito", carrito);

		}

		private void MostrarCarro()
		{
			/*gvCart.DataSource = carrito.GetItems();
			gvCart.DataBind();*/

		}
	}
}