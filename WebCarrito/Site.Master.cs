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
        public CarritoCompra carrito;
        public List<Articulo> listaCarrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carrito = (CarritoCompra)Session["carrito"];
             
            }

        }
    }
}