<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebCarrito._Default" %>

<%@ Import Namespace="System.Security.Policy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


	<h1>Listado de Articulos</h1>
	<div class="row">
		<div class="col-6">
			<div class="mb-3">
	<asp:Label Text="Filtro" runat="server" />
	<asp:TextBox runat="server" ID="txtFiltro" AutoPostBack="true" OnTextChanged="Filtro_TextChanged" Cssclass="form-control"/>
			</div>
			</div>
		<div class="col-6" style="display: flex; flex-direction: column; justify-content:flex-end;">
			<div class="mb-3">
                <asp:CheckBox Text="Filtro Avanzado" cssclass="" ID="chkAvanzado" 
				runat="server" AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged"/>
		</div>
	</div>

</div>
		




	<% if (FiltroAvanzado)
		{ %>
	<div class="row">
		<div class="col-3">
			<div class="mb-3">
				<asp:Label Text="Campo" ID="ddlCampo" runat="server"/>
				<asp:DropDownList runat="server" CssClass="form-control">
					<asp:ListItem Text="Nombre" />
					<asp:ListItem Text="Marca" />
					<asp:ListItem Text="Categoria" />
				</asp:DropDownList>
			</div>
		</div>
		<div class="col-3">
			<div class="mb-3">
				<asp:Label Text="Criterio"  runat="server"/>
				<asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
			</div>
		</div>
		<div class="col-3">
			<div class="mb-3">
				<asp:Label Text="Filtro"  runat="server"/>
				<asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control"/>
				</div>
			</div>
        <div class="col-3">
                <div class="mb-3">
                    <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar"/>
                </div>
                </div>
	</div>

<% }%>




	<div class="row row-cols-1 row-cols-md-3 g-4">

		<% 
			var ide=0;
			foreach (Dominio.Articulo articulo in listaArticulos)
			{
		%>


		<div class="col">
			<div class="card">
				<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                  <div class="carousel-inner">
                    
				<%
					var cont = 0;
					var ban = 0;
					foreach (Dominio.Imagen imagen in listaImagenes)
					{

						if (ide != articulo.Id) {
							ide = articulo.Id;
							ban = 1;
							cont = 0;
						}
						else {ban = 0;} 
						if (ide == imagen.IdArticulo)
						{
							cont++;
				%>
			                <div class="carousel-item <%= ban==1 ? "active" : "" %>">  
							<img src="<% = imagen.ImagenUrl  %>" class="d-block w-100" alt="...">
							</div>
						
				<%
							
						}
						if (cont == 0)
						{
							%>
			                  <div class="carousel-item active">
			                  <img src="https://cloudfront-us-east-1.images.arcpublishing.com/infobae/BLZJHTB27ZHUPKK3A7GXTMIEQA.jpg" class="card-img-top" alt="...">
				                  </div>
			                  <%
						}
					}
				%>
	                  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                      </button>
                      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                      </button>
				</div>
				<div class="card-body">
					<h5 class="card-title"><%:articulo.Nombre %></h5>
					<p class="card-text"><%:articulo.Descripcion %></p>
					<a href="Detalle.aspx?id_Seleccionado=<%=articulo.Id %>" class="btn btn-primary">Ver Detalle</a>
					<a class="btn btn-primary" href="carrito.aspx?id=<% = articulo.Id %>&e=t"><i class="fas fa-shopping-cart"></i></a>

				</div>
			</div>
		</div>
		<%  }  %>
	</div>


</asp:Content>
