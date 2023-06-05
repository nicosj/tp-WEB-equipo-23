<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="VerCarrito.aspx.cs" Inherits="WebCarrito.VerCarrito" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="h-100">
        
    
        <h1>Shopping Cart</h1>
        
        <% if (carrito != null)
           { %>
            <div class="row">
                <div class="col-md-2">
                <i class="fa fa-cart"></i>                
                </div>
                <div class="col-md-2">
                <h2>Nombre</h2>    
                </div>
                <div class="col-md-2">
                                    <h2>PU</h2>
                                </div>
                <div class="col-md-2">
                    <h2>Cantidad</h2>
                </div>
                <div class="col-md-2">
                 <h2>Total</h2>
                 </div>
                </div>
            <%
               
               foreach (Dominio.Articulo cart in carrito.GetItems())
               {
                   // genera tebale htmml carrito 

        %>
            <%--genera carrito de compra--%>
            <div class="row">
                <div class="col-md-2">
                    <img src="Images/" alt="" class="img-responsive" />
                </div>
                <div class="col-md-2">
                    <h4><%= cart.Nombre %></h4>
                </div>
                <div class="col-md-2">
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
           
                  
              <% }
               %>
             <div class="row">
                            <div class="col-md-8"></div>
                            <div class="col-md-2">
                                <h4>Total:<%=(carrito.TotalCarrito).ToString("c")%></h4>
                            </div>
                        </div>
          <% }
           else
           {%>
            <div class="container">
                <div class="row text-center">
                       <div class="col m-5 text-center">
                            <h1>Nada para Mostrar</h1>
                           <img src="https://i.pinimg.com/originals/6b/22/98/6b2298fec93ad8240f87c8228ab87969.jpg" class="img-fluid" alt="">
                       </div>
                </div>
            </div>
           <%} %>
        <a href="Default.aspx">< Back to Products</a>
        <br />
        <br />
        
        <br />
        <%--<asp:Button runat="server" ID="btnUpdateCart" Text="Update Cart" OnClick="btnUpdateCart_Click" />--%>
    </div>

</asp:Content>
