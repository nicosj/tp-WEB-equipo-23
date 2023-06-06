<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebCarrito._Default" %>

<%@ Import Namespace="System.Security.Policy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<div class="container">
	<h1>Listado de Articulos</h1>
	<div class="row">
		<div class="col-6">
			<div class="mb-3">
				<asp:Label Text="Filtro" runat="server" />
				<asp:TextBox runat="server" ID="txtFiltro" AutoPostBack="true" OnTextChanged="Filtro_TextChanged" CssClass="form-control" />
			</div>
		</div>
		<div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
			<div class="mb-3">
				<asp:CheckBox Text="Filtro Avanzado" CssClass="" ID="chkAvanzado"
					runat="server" AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged" />
			</div>
		</div>
	</div>





	<% if (FiltroAvanzado)
		{ %>
	<div class="row">
		<div class="col-3">
			<div class="mb-3">
				<asp:Label Text="Campo" ID="ddlCampo" runat="server" />
				<asp:DropDownList runat="server" CssClass="form-control" AutoPostBack="true" ID="ddlCampoo" OnSelectedIndexChanged="ddlCampoo_SelectedIndexChanged">
					<asp:ListItem Text="" />
					<asp:ListItem Text="Marca" />
					<asp:ListItem Text="Categoria" />
				</asp:DropDownList>
			</div>
		</div>
		<div class="col-3">
			<div class="mb-3">
				<asp:Label Text="Criterio" ID="ddlCriterio" runat="server" />
				<asp:DropDownList runat="server" CssClass="form-control" ID="ddlCriterioo" >
					</asp:DropDownList>
			</div>
		</div>
		<div class="col-3">
			<div class="mb-3">
				<asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar"  Onclick="btnBuscar_Click"/>
			</div>
		</div>

		<% }%>


		
		<div class="row ">
			
            				
			<%var primer_id = 0;
			 var contas = 0;
			%>
			<% foreach (Dominio.Articulo articulo in listaArticulos)
			
				{%>
				<div class="col-md-4 col-sm-12 my-2  ">
					<div class="card mx-2 text-center border-warning shadow ">
			
					<div id="carouselExampleSlidesOnly" class="carousel" data-bs-ride="carousel" data-bs-interval="10000">
						<div class="carousel-inner">

							<%	var contador = 0;
								var bandera = 0;
								foreach (Dominio.Imagen imagen in listaImagenes)
								{
									if (primer_id != articulo.Id)
									{
										primer_id = articulo.Id;
										bandera = 1;
										contador = 0;
									}
									else { bandera = 0; }
									if (primer_id == imagen.IdArticulo)
									{
										contador++;%>
							<style>
								.carousel-item {
									height: 300px; /* Ajusta la altura deseada */
									overflow: hidden;
							    }
								.carousel-item .carousel-inner img {
							    height: 100%;
							    object-fit: cover;
								}
							</style>
							<div class="carousel-item <%= bandera==1 ? "active" : "" %>" data-bs-interval="10000">
								<img onerror="this.src='https://image.spreadshirtmedia.net/image-server/v1/compositions/T6A1PA5835PT17X29Y62D162120215W24929H23114/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/dead-link-shirt-mens-t-shirt.jpg'" src="<% = imagen.ImagenUrl  %>" class="card-img-top" alt="Link roto">
							</div>
							<%}
								if (contador == 0)
								{%>
							<div class="carousel-item active" data-bs-interval="10000">
								<img onerror="this.src='https://image.spreadshirtmedia.net/image-server/v1/compositions/T6A1PA5835PT17X29Y62D162120215W24929H23114/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/dead-link-shirt-mens-t-shirt.jpg'" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTBsA3gZlk5cyzhql5sP8ybqKN9UU0fXQ_gw&usqp=CAU" class="card-img-top" alt="...">
							</div>
							<%}
								}%>
						</div>
						
					</div>
						<div class="card-body">
						
						
						<%--<a class="btn btn-primary" href="carrito.aspx?id=<% = articulo.Id %>"><i class="fas fa-shopping-cart"></i></a>--%>



					</div>
						<div class="card-header bg-white border-top border-warning border-2 ">
							<h5 class=" card-title  bg-secondary text-warning p-2 shadow"><%:articulo.Nombre %></h5>
							<p class="card-text "><%:articulo.Descripcion %></p>

							<%--<asp:LinkButton runat="server" ID="btnCarrito" OnClick="btnAddCatrrito">+<i class="fas fa-shopping-cart"></i></asp:LinkButton></div>--%>
						
							<p class="card-text">$<%:((float)articulo.Precio) %></p>
							<div id="button<%=contas++%>" ></div>
							
						
							</div>
					<a  href="DetalleProducto.aspx?id_seleccionado=<%=articulo.Id%>" class="btn btn-warning"><i class="fas fa-eye"></i>Ver Detalle</a>
					</div>

				</div>
			<%  }  %>
				
			</div>
		</div>
			 <asp:PlaceHolder ID="heroP" runat="server"/>
		</div>
	
		<script >
		
		var boton=document.getElementsByClassName('botonHidenPrincipal').length;
		
             for (var i = 0; i < boton ; i++){
				document.getElementById('button'+i).appendChild(document.getElementById('MainContent_'+i))
			 }
            </script>
</asp:Content>


