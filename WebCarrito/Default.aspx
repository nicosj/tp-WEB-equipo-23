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

<% }%>




	<div class="row row-cols-1 row-cols-md-3 g-4">

		<% 
			foreach (Dominio.Articulo articulo in listaArticulos)
			{
		%>


		<div class="col">
			<div class="card">
				<% 
					foreach (Dominio.Imagen imagen in listaImagenes)
					{
						if (articulo.Id == imagen.IdArticulo)
						{



				%>
				<img src="<% = imagen.ImagenUrl %>" class="card-img-top" alt="...">


				<%
						}
					}
				%>
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
