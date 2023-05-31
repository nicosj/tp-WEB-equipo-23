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
        public List<Categoria> listaCategorias { get; set; }
        public List<Marca> listaMarcas { get; set; }
        public List<Imagen> listaImagenes { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            

                FiltroAvanzado = false;
                NegocioArticulo negocio = new NegocioArticulo();
                NegocioImagen Imagen = new NegocioImagen();
                listaArticulos = negocio.listarConSP();
                listaImagenes = Imagen.listar();

            if (!IsPostBack)
            {
                Session.Add("listaArticulos", negocio.listarConSP());
                Session.Add("listaImagenes", Imagen.listar());
            }


            
        }

        protected void Filtro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List < Articulo >) Session["listaArticulos"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            listaArticulos = listaFiltrada;

            List<Imagen> listaIMG = (List<Imagen>)Session["listaImagenes"];
            //List<Imagen> listaIMGFiltrada = listaIMG.FindAll(x => x.ToUpper().Contains(txtFiltro.Text.ToUpper()));

        }


        public bool FiltroAvanzado { get; set; }
        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            txtFiltro.Enabled = !FiltroAvanzado;
        }
        
    }
}