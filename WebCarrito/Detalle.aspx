<%@ Page Title="loco" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="WebCarrito.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<%--TODO: Meter Descripcion, precio, nombre, marcar, etc--%>

	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
		<%
			try
			{
				if (Int32.Parse(alt) != 999)
				{
					foreach (Dominio.Imagen imagen in listaImagen)
					{
						if (Int32.Parse(alt) == imagen.Id)

						{
		%>

		
			<div class="carousel-item active" data-bs-interval="1000">
				<img src="<%: imagen.ImagenUrl %>" class="d-block w-100" alt="...">
			</div>
		
		<%
						}
					}


		%>

			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="false"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="false"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<br />
	<%
				}
				else
				{

	%>
			<div class="alert alert-danger" role="alert">
				<h1> se encontraron imagenes</h1>
				<%--cdn nout found img etiqueta--%>
				<img src="https://img.memegenerator.net/instances/81964216.jpg" alt="">
				

			</div>
		<%
				}
			}
			catch (Exception e)
			{
				e.ToString();
			}
		%>
	Regresar a la lista de productos: <a href="/Default.aspx">Regresar</a>

</asp:Content>
