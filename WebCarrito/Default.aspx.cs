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
    public partial class _Default : Page
    {

        public List<Articulo> listaArticulos { get; set; }
        public List<Imagen> listaImagenes { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            NegocioArticulo negocio = new NegocioArticulo();
            NegocioImagen Imagen = new NegocioImagen();
            listaArticulos= negocio.listarConSP();
            listaImagenes = Imagen.listar();
            
        }
        
        
    }
}