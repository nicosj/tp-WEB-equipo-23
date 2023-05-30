<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebCarrito._Default" %>
<%@ Import Namespace="System.Security.Policy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<h1>Listado de Articulos</h1>
   
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
        if(articulo.Id == imagen.IdArticulo){
        

            
        %>
                <img src="<% = imagen.ImagenUrl %>" class="card-img-top" alt="...">
          
        
    <%
        }
    }  
    %>
      <div class="card-body">
        <h5 class="card-title"><%:articulo.Nombre %></h5>
        <p class="card-text"><%:articulo.Descripcion %></p>
      </div>
    </div>
  </div>
        <%  }  %>
 
</div>


</asp:Content>
