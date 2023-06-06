<%@ Page Title="Title" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="VerCarrito.aspx.cs" Inherits="WebCarrito.VerCarrito" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="h-100">
        
    
        <h1>Shopping Cart</h1>
        
        <% 
           if (carrito != null)
           { %>
            <div class="row border-1 border-bottom">
                <div class="col-md-2">
                       <h2>Imagen</h2>                 
                </div>
                <div class="col-md-2">
                <h2>Nombre</h2>    
                </div>
                <div class="col-md-2">
                                    <h2>PU</h2>
                                </div>
                <div class="col-md-3">
                    <h2>Cantidad</h2>
                </div>
                <div class="col-md-2">
                 <h2>Total</h2>
                 </div>
                <div class="col-md-1">
                                 
                                 </div>
                </div>
            <%
               var contador = 0;
               foreach (Dominio.Articulo cart in carrito.GetItems())
               {


        %>

            <div class="row my-2 border-1 border-bottom ">
                <div class="col-md-2">
                    <img src="https://cdn.pixabay.com/photo/2021/09/13/22/02/add-6622547_1280.png" alt="" class="w-50" />
                </div>
                <div class="col-md-2">
                    <h4><%= cart.Nombre %></h4>
                </div>
                <div class="col-md-2">
                    <h4><%= cart.Precio.ToString("c") %></h4>
                </div>
                <div class="col-md-2">
                    <h2><%= cart.cantidad %></h2>
                   
                </div>
                <div class="col-md-1">
                     <div class="col-md-1">
                                            <div id="btn+<%=contador%>" >
                                            </div>
                                            </div>
                                        <div class="col-md-1">
                                            <div id="btn-<%=contador%>" >
                                            </div>
                                        </div>
                   
                </div>
                <div class="col-md-2">
                    <%--<asp:TextBox runat="server" ID="txtCantidad" Text="<%= cart.cantidad.ToString() %>" Width="50px" />--%>
                    <h4><%= (cart.cantidad * cart.Precio).ToString("c") %></h4>
                </div>

                <div class="col-md-1">

                    <div id="btn<%=contador%>" ></div >
                
                 <%contador++;%>

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
        <asp:PlaceHolder ID="adaptador" runat="server"></asp:PlaceHolder>
        <a href="Default.aspx">< Back to Products</a>
        <br />
        <br />
        
        <br />
        <%--<asp:Button runat="server" ID="btnUpdateCart" Text="Update Cart" OnClick="btnUpdateCart_Click" />--%>

    </div>
   <div>

   </div>
   
   		<script >
	
		        var contadorElementos=document.getElementsByClassName('btnOcultoVer').length;
             for (var i = 0; i < contadorElementos ; i++){
                 document.getElementById('btn' + i).appendChild(document.getElementById('MainContent_flotante' + i))
                 document.getElementById('btn+' + i).appendChild(document.getElementById('MainContent_flotante_Suma' + i))
                 document.getElementById('btn-' + i).appendChild(document.getElementById('MainContent_flotante_Resta' + i))
			 }
			</script>

</asp:Content>
