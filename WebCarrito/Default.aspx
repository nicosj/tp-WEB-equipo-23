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


		
		<div class="row rows-cols-3 ">
			
            				
			<%var primer_id = 0;%>
			<% foreach (Dominio.Articulo articulo in listaArticulos)
			
				{%>
				<div class="col-4 col-  ">
					<div class="card ">
			
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
								<img onerror="this.src='https://image.spreadshirtmedia.net/image-server/v1/compositions/T6A1PA5835PT17X29Y62D162120215W24929H23114/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/dead-link-shirt-mens-t-shirt.jpg'" src="<% = imagen.ImagenUrl  %>" class="img-fluid h-100" alt="Link roto">
							</div>
							<%}
								if (contador == 0)
								{%>
							<div class="carousel-item active" data-bs-interval="10000">
								<img onerror="this.src='https://image.spreadshirtmedia.net/image-server/v1/compositions/T6A1PA5835PT17X29Y62D162120215W24929H23114/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/dead-link-shirt-mens-t-shirt.jpg'" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTBsA3gZlk5cyzhql5sP8ybqKN9UU0fXQ_gw&usqp=CAU" class="img-fluid" alt="...">
							</div>
							<%}
								}%>
						</div>
						
					</div>

					<div class="card-header">
						<h5 class="card-title"><%:articulo.Nombre %></h5>
						<p class="card-text"><%:articulo.Descripcion %></p>

						<%--<asp:LinkButton runat="server" ID="btnCarrito" OnClick="btnAddCatrrito">+<i class="fas fa-shopping-cart"></i></asp:LinkButton></div>--%>

						<p class="card-text">$<%:((float)articulo.Precio) %></p>


						<a href="Detalle.aspx?id_seleccionado=<%=articulo.Id%>" class="btn btn-primary">Ver Detalle</a>
						

						<%--<a href="Detalle.aspx?id_seleccionado=<%=articulo.Id%>" class="btn btn-primary">Ver Detalle</a>--%>
					</div>
					<div class="card-body">
						<a href="DetalleProducto.aspx?id_seleccionado=<%=articulo.Id%>" class="btn btn-primary">Ver Detalle2</a>

						<%--<asp:Button ID="btnGoDetails" runat="server" OnClick="btnGoDetails_Click"	 Text="DetailsNuevo" />--%>

						<a class="btn btn-primary" href="carrito.aspx?id=<% = articulo.Id %>&e=t"><i class="fas fa-shopping-cart"></i></a>



					</div>

						</div>

				</div>
			<%  }  %>
				
			</div>
		</div>

		</div>
		
</asp:Content>


