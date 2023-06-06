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
		public Button btnMas;
		public Button btnMenos;

		public List<Articulo> listaCarrito { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{

			carrito = (CarritoCompra)Session["carrito"];
			int index = 0;
			carrito = (CarritoCompra)Session["carrito"];
			if (carrito != null)
			{
				foreach (Articulo item in carrito.GetItems())
				{
					Console.WriteLine("asdsad");
					btn = new Button();
					btn.Text = "X";
					btn.ID = "flotante" + index;
					btn.Click += new EventHandler(btnEliminar);
					btn.CommandArgument = item.Id.ToString();
					btn.CssClass = "btn btn-danger btn-xs btnOcultoVer";
					adaptador.Controls.Add(btn);

                    btnMas = new Button();
                    btnMas.Text = "+";
                    btnMas.ID = "flotante_Suma" + index;
                    btnMas.Click += new EventHandler(btnSumar);
                    btnMas.CommandArgument = item.Id.ToString();
                    btnMas.CssClass = "btn btn-info btn-xs ";
                    adaptador.Controls.Add(btnMas);

                    btnMenos = new Button();
                    btnMenos.Text = "-";
                    btnMenos.ID = "flotante_Resta" + index;
                    btnMenos.Click += new EventHandler(btnRestar);
                    btnMenos.CommandArgument = item.Id.ToString();
                    btnMenos.CssClass = "btn btn-info btn-xs ";
                    adaptador.Controls.Add(btnMenos);

                    index++;


                    
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

        public void btnSumar(object sender, EventArgs e)
        {

            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            carrito = (CarritoCompra)Session["carrito"];
            carrito.Incrementaritem(id);
            Session.Add("carrito", carrito);

        }

        public void btnRestar(object sender, EventArgs e)
        {

            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            carrito = (CarritoCompra)Session["carrito"];
            carrito.Decrementaritem(id);
            Session.Add("carrito", carrito);

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