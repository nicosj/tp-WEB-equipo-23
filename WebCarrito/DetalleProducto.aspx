<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="WebCarrito.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<h2>Detalles del producto</h2>
	<br />
	<div class="card mb-3" style="max-width: 540px;">
		<div class="row g-0">
			<%try
				{
					bool primeraImagen = false;
					if (Int32.Parse(alt) != 999)
					{

						foreach (Dominio.Imagen imagen in listaImagen)
						{

							if (Int32.Parse(alt) == imagen.IdArticulo && primeraImagen == false)
							{%>
			<div class="col-md-4">
				<img onerror="this.src='https://image.spreadshirtmedia.net/image-server/v1/compositions/T6A1PA5835PT17X29Y62D162120215W24929H23114/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/dead-link-shirt-mens-t-shirt.jpg'" src="<% =imagen.ImagenUrl %>" class="img-fluid rounded-start" alt="...">
				<%primeraImagen = true;%>
			</div>
			<%
							}
						}
					}

				}
				catch (Exception ex)
				{

					throw ex;
				} %>

			<%--			<div class="col-md-4">
				<img src="https://images.fravega.com/f300/f741c5dc03f09eebef57e56dcc86c8f9.jpg" class="img-fluid rounded-start" alt="...">
			</div>--%>


			<div class="col-md-8">
				<div class="card-body">
					<%
						try
						{
							if (Int32.Parse(alt) != 999)
							{
								foreach (Dominio.Articulo articulo2 in listaArticulos)
								{
									if (Int32.Parse(alt) == articulo2.Id)

									{%>

										<h5 class="card-title"><%:articulo2.Nombre %></h5>
										<p class="card-text">Descripción: <%:articulo2.Descripcion %></p>
										<p class="card-text">Precio (ARS): $ <%:((float)articulo2.Precio) %> .-</p>

										
										<%foreach (Dominio.Categoria categoria in listaCategorias)
										{
											if (categoria.Id == articulo2.IdCategoria)
											{ %>
												<p class="card-text"><small class="text-body-secondary">Categoria: <%:categoria.Descripcion %></small></p>
										<% } %>
									<%} %>
										<%foreach (Dominio.Marca marca in listaMarcas)
										{
											if (marca.Id == articulo2.IdMarca)
											{ %>
												<p class="card-text"><small class="text-body-secondary">Marca: <%:marca.Descripcion %></small></p>
										<% } %>
									<%} %>





								<%



											}
										}
									}
							}
						
						catch (Exception e)
						{
							e.ToString();
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<div id="carouselExampleAutoplaying" class="carousel slide col-md-5" data-bs-ride="carousel" data-bs-theme="dark">

		<div class="carousel-inner">


			<%foreach (Dominio.Imagen imagen in listaImagen)
				{
					if (Int32.Parse(alt) == imagen.IdArticulo)
					{%>



			<div class="carousel-item active">
				<img onerror="this.src='https://image.spreadshirtmedia.net/image-server/v1/compositions/T6A1PA5835PT17X29Y62D162120215W24929H23114/views/1,width=550,height=550,appearanceId=1,backgroundColor=FFFFFF,noPt=true/dead-link-shirt-mens-t-shirt.jpg'" src="<% =imagen.ImagenUrl %>" class="d-block w-30%" alt="...">
			</div>
			<%}%>
			<%}%>
		</div>
		<button class="carousel-control-prev bg-dark" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="false"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next bg-dark" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="false"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	<a href="Default.aspx">⏪ Seguir explorando Artículos</a>
</asp:Content>
