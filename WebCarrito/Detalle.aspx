﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="WebCarrito.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<%--TODO: Meter Descripcion, precio, nombre, marcar, etc--%>

	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">

		<%
			foreach (Dominio.Imagen imagen in listaImagen)
			{	%>

			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="1000">
					<img src="<%:imagen.ImagenUrl %>" class="d-block w-100" alt="...">
				</div>
			</div>
		<%	}	%>




		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="false"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="false"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>

</asp:Content>