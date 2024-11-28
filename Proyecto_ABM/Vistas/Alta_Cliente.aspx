<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Proyecto_ABM.Vistas.WebForm1" Async="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alta Clientes</title>
    <link href="~/Estilos/style.css" rel="stylesheet" type="text/css" />
     <!-- Favicon -->
    <link rel="icon" href="../Imagenes/Grupo_del_Pilar_logo-G1.png" type="image/x-icon" />

    <style type="text/css">
        #map {
            height: 400px;
            width: 100%;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 350px;
        }
        .auto-style5 {
            width: 357px;
        }
        </style>

   

    <script type="text/javascript" src="<%= ResolveUrl("../Javascript/script.js") %>"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDOmu7Tlc10AYwwvImgzk0bp-5Izr8YS8&callback=initMap" async defer></script>
</head>
<body class="bodyAlta">
<form id="form1" runat="server">
    <div class="form-container">
        <!-- Logo -->
        <div class="logo-container">
            <img src="../Imagenes/Grupo_del_Pilar_logo-2.png" alt="Logo" class="logo" />
        </div>

        <!-- Título y subtítulo -->
        <h2>Portal ABM Clientes</h2>
        <h3>Formulario de alta de clientes</h3>

        <!-- Campos del formulario -->
        <div class="form-group">
            <label for="Txt_Cuit">CUIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Warning_CUIT" runat="server"  CssClass="warning-label" ForeColor="Red"></asp:Label>
            </label>
&nbsp;<asp:TextBox ID="Txt_Cuit" runat="server" placeholder="Ingrese CUIT" class="input-field"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="Txt_RazonSocial">Razón Social&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Warning_RS" runat="server" ForeColor="Red"></asp:Label>
            </label>
            &nbsp;<asp:TextBox ID="Txt_RazonSocial" runat="server" placeholder="Ingrese Razón Social" class="input-field"></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label for="DropDownList1">Provincia&nbsp;
            <asp:Label ID="Warning_Prov" runat="server" ForeColor="Red"></asp:Label>
            </label>
            &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" class="input-field" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
               
            </asp:DropDownList>
        </div>
       

        <div class="form-group">
            <label for="Txt_Partido">Partido&nbsp;&nbsp;
            <asp:Label ID="Warning_Partido" runat="server" ForeColor="Red"></asp:Label>
            </label>
            &nbsp;<asp:DropDownList ID="ddl_partido" runat="server"  class="input-field" OnSelectedIndexChanged="ddl_partido_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

        
         <div class="form-group">
     <label for="Txt_Localidad">Localidad&nbsp;&nbsp;
     <asp:Label ID="Warning_Localidad" runat="server" ForeColor="Red"></asp:Label>
     </label>
     &nbsp;<asp:DropDownList ID="ddl_localidad" runat="server"  class="input-field" AutoPostBack="True" >
     </asp:DropDownList>
 </div>

        <div class="form-group">
    <label for="Txt_Callle">Calle&nbsp;
    <asp:Label ID="Warning_Calle" runat="server" ForeColor="Red"></asp:Label>
    </label>
    &nbsp;<asp:TextBox ID="Txt_Callle" runat="server" placeholder="Ingrese Calle" class="input-field"></asp:TextBox>
</div>
                <div class="form-group">
            <label for="TextBox6">Número&nbsp;
            <asp:Label ID="Warning_Num" runat="server" ForeColor="Red"></asp:Label>
            </label>
&nbsp;<asp:TextBox ID="TextBox6" runat="server" placeholder="Ingrese Número" class="input-field"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="Txt_email">Email&nbsp;&nbsp;
            <asp:Label ID="Warning_Email" runat="server" ForeColor="Red"></asp:Label>
            </label>
            &nbsp;<asp:TextBox ID="Txt_email" runat="server" placeholder="Ingrese Email" type="email" class="input-field"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="Txt_Telefono">Teléfono&nbsp;&nbsp;
            <asp:Label ID="Warning_Tel" runat="server" ForeColor="Red"></asp:Label>
            </label>
            &nbsp;<asp:TextBox ID="Txt_Telefono" runat="server" placeholder="Ingrese Teléfono" type="phone" class="input-field"></asp:TextBox>
        </div>
<!-- Horario de visita -->
<div class="form-group">
    <label>Horario de visita&nbsp;
        <asp:Label ID="Warning_Hor_Visita" runat="server" ForeColor="Red"></asp:Label>
    <br 
    <br />
    &nbsp;<asp:DropDownList ID="ddl_Horario" runat="server"  class="input-field" >
        <asp:ListItem Selected="True">Seleccione un turno</asp:ListItem>
        <asp:ListItem>Mañana</asp:ListItem>
        <asp:ListItem>Mediodia</asp:ListItem>
        <asp:ListItem>Noche</asp:ListItem>
 </asp:DropDownList>
&nbsp;<label> Horario de entrega&nbsp;&nbsp;    </label>
        <asp:Label ID="Warning_Hor_Entrega" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <br />
  <table class="auto-style1">
    <tr>
        <td class="auto-style4">
            <label>
                <input id="Radio4" type="radio" name="hora" />
                <asp:Label ID="Label4" runat="server" Text="Mañana"></asp:Label>
            </label>
        </td>
        <td class="auto-style5">
            <label>
                <input id="Radio5" type="radio" name="hora" />
                <asp:Label ID="Label5" runat="server" Text="Mediodia"></asp:Label>
            </label>
        </td>
        <td>
            <label>
                <input id="Radio6" type="radio" name="hora" />
                <asp:Label ID="Label6" runat="server" Text="Noche"></asp:Label>
            </label>
        </td>
    </tr>
</table>


    &nbsp;
  



         <div class="form-group">
            <label>Seleccione la ubicación</label>
            <div id="map"></div>
        </div>

        <div class="form-group">
            <label for="Txt_Coordenadas">Coordenadas (Latitud, Longitud)</label>
            <asp:TextBox ID="Txt_Coordenadas" runat="server" placeholder="Coordenadas" class="input-field" ReadOnly="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Siguiente" CssClass="btn" OnClick="Btn_Siguiente_Click" />
        </div>
    </div>

        
    
</form>

    
    </label>
    <p>
        &nbsp;</p>

    
</body>
</html>
