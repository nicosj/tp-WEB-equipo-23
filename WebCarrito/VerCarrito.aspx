<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="VerCarrito.aspx.cs" Inherits="WebCarrito.VerCarrito" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
        
    
        <h1>Shopping Cart</h1>
        <% foreach ( Dominio.Articulo cart in carrito.GetItems() )
           {
        // genera tebale htmml carrito 
               
        %>
            <%--genera carrito de compra--%>
            <div class="row">
                <div class="col-md-2">
                    <img src="Images/" alt="" class="img-responsive" />
                </div>
                <div class="col-md-4">
                    <h4><%= cart.Nombre %></h4>
                    <h4><%= cart.Precio.ToString("c") %></h4>
                </div>
                <div class="col-md-2">
                    <%--<asp:TextBox runat="server" ID="txtCantidad" Text="<%= cart.cantidad.ToString() %>" Width="50px" />--%>
                    <input type="number" id="txtCantidad" onchange=""  value="<%= cart.cantidad.ToString() %>" />
                    
                    
                </div>
                <div class="col-md-2">
                    <%--<asp:TextBox runat="server" ID="txtCantidad" Text="<%= cart.cantidad.ToString() %>" Width="50px" />--%>
                    <h4><%= (cart.cantidad * cart.Precio).ToString("c") %></h4>
                </div>
                <div class="col-md-2">
                    <%--<asp:Button runat="server" ID="btnUpdate" Text="Update" OnClick="btnUpdate_Click" />--%>
                </div>
                <div class="col-md-2">
                    <%--<asp:Button runat="server" ID="btnRemove" Text="Remove" OnClick="btnRemove_Click" />--%>
                </div>
            </div>
            
                  
              <% } %>
        <a href="Default.aspx">< Back to Products</a>
        <br />
        <br />
        
        <br />
        <%--<asp:Button runat="server" ID="btnUpdateCart" Text="Update Cart" OnClick="btnUpdateCart_Click" />--%>
    </div>

</asp:Content>
