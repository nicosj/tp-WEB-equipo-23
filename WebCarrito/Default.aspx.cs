using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

using Dominio;
using Microsoft.Ajax.Utilities;
using EventHandler = System.EventHandler;

namespace WebCarrito
{

    public partial class _Default : Page
    {
        public Button btn;
        protected List<Button> pivB;
        public int index=0;
        CarritoCompra carrito;
        public Articulo articulo { get; set; }
        public List<Articulo> listaArticulos { get; set; }
        public List<Categoria> listaCategorias { get; set; }
        public List<Marca> listaMarcas { get; set; }
        public List<Imagen> listaImagenes { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            carrito = (CarritoCompra)Session["carrito"];
            FiltroAvanzado = chkAvanzado.Checked;
            NegocioArticulo negocio = new NegocioArticulo();
            NegocioImagen Imagen = new NegocioImagen();
            pivB = new List<Button>();
            listaArticulos = negocio.listarConSP();
            listaImagenes = Imagen.listar();
            
            foreach(Articulo item in listaArticulos)
            {  
                btn = new Button();
                btn.Text = "Agregar al carrito";
                btn.ID = index.ToString();
                btn.Click += new EventHandler(btnAddCarro_Click);
                btn.CommandArgument= item.Id.ToString();
                btn.CssClass = "btn btn-primary botonHidenPrincipal";
                heroP.Controls.Add(btn);
                index++;

            }

            
            
            if (!IsPostBack)
            {
                Session.Add("listaArticulos", negocio.listarConSP());
                Session.Add("listaImagenes", Imagen.listar());
            }



        }

        protected void Filtro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
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

        protected void ddlCampoo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterioo.Items.Clear();
            if(ddlCampoo.SelectedItem.ToString()== "Categoria")
            {
                NegocioCategoria negocioCategoria = new NegocioCategoria();
                listaCategorias = negocioCategoria.listar();
                foreach (Dominio.Categoria categoria in listaCategorias)
                {
                    ddlCriterioo.Items.Add(categoria.Descripcion.ToString());
									}
                
            }
            else
            {
                if (ddlCampoo.SelectedItem.ToString() == "Marca")
                {
                NegocioMarca negocioMarca = new NegocioMarca();
                listaMarcas = negocioMarca.listar();
                foreach (Dominio.Marca marca in listaMarcas)
                    {
                    ddlCriterioo.Items.Add(marca.Descripcion.ToString());
                }
            }
            
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlCampoo.SelectedItem.ToString() == "Marca")
                {
                    NegocioMarca negocioMarca = new NegocioMarca();
                    listaMarcas = negocioMarca.listar();
                    foreach (Dominio.Marca marca in listaMarcas)
                    {
                        if (ddlCriterioo.SelectedItem.ToString() == marca.Descripcion)
                        {
                            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
                            List<Articulo> listaFiltrada = lista.FindAll(x => x.IdMarca == marca.Id);
                            listaArticulos = listaFiltrada;
                            List<Imagen> listaIMG = (List<Imagen>)Session["listaImagenes"];
                        }
                    }
                }
                else if(ddlCampoo.SelectedItem.ToString() == "Categoria")
                {
                    NegocioCategoria negocioCategoria = new NegocioCategoria();
                    listaCategorias = negocioCategoria.listar();
                    foreach (Dominio.Categoria categoria in listaCategorias)
                    {
                        if (ddlCriterioo.SelectedItem.ToString() == categoria.Descripcion)
                        {
                            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
                            List<Articulo> listaFiltrada = lista.FindAll(x => x.IdCategoria == categoria.Id);
                            listaArticulos = listaFiltrada;
                            List<Imagen> listaIMG = (List<Imagen>)Session["listaImagenes"];
                        }
                    }
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }
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