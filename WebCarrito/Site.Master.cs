using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace WebCarrito
{
    public partial class SiteMaster : MasterPage
    {
        
        public Button btn;
        public CarritoCompra carrito;
        public List<Articulo> listaCarrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            int index = 0;    
                carrito = (CarritoCompra)Session["carrito"];
                if (carrito != null)
                {


                    foreach (Articulo item in carrito.GetItems())
                    {
                        btn = new Button();
                        btn.Text = "X";
                        btn.ID = "T"+index;
                        btn.Click += new EventHandler(btnDelCart_Click);
                        btn.CommandArgument = item.Id.ToString();
                        btn.CssClass = "btn btn-xs btn-danger pull-right botonHidenCart";
                        herot.Controls.Add(btn);
                        index++;

                    }
                }


        }
        
        public void btnDelCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            carrito = (CarritoCompra)Session["carrito"];
            carrito.EliminarItem(id);
            Session.Add("carrito", carrito);
           // Response.Redirect("VerCarrito.aspx");
        }
    }
}