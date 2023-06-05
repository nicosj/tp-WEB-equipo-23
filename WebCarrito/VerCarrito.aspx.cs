using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace WebCarrito
{
    
    public partial class VerCarrito : Page
    {
        public CarritoCompra carrito;
        public List<Articulo> listaCarrito { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                carrito = (CarritoCompra)Session["carrito"];
                MostrarCarro();
            }
            if(carrito == null)
            {
             
             
            }
            else
            {
                
            }
        }

        private void MostrarCarro()
        {
            /*gvCart.DataSource = carrito.GetItems();
            gvCart.DataBind();*/
            
        }
    }
}