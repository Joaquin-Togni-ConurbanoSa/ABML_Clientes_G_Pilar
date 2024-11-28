<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PortalSolicitudes.aspx.cs" Inherits="Proyecto_ABM.Vistas.PortalSolicitudes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Portal solicitudes</title>
    <link href="~/Estilos/style.css" rel="stylesheet" type="text/css" />
     <!-- Favicon -->
    <link rel="icon" href="../Imagenes/Grupo_del_Pilar_logo-G1.png" type="image/x-icon" />

    </head>

<body class="cuerpo">
    <form id="form1" runat="server">

        <div class="form-container">
            <!-- Logo -->
            <div class="logo-container">
                <a href="PortalSolicitudes.aspx"> <img src="../Imagenes/Grupo_del_Pilar_logo-2.png" alt="Logo" class="logo" /> </a>
            </div>

            <!-- Título y subtítulo -->
            <h2>Portal ABM Clientes</h2>
            <h3>Identificación&nbsp;</h3>
            <p>&nbsp;</p>

            <!-- Campos del formulario -->
            <div class="form-group">

                <label>
                    Identifiquese con su ID de vendedor: <asp:Label ID="WarningVendedor" runat="server" CssClass="warning-label" ForeColor="Red"></asp:Label>
                <br />
                    &nbsp;</label>

                <asp:DropDownList ID="ddlVendedores" runat="server">
                </asp:DropDownList>
               
                <br />
                <br />
               
              




                <label>
                Seleccione un formulario: <asp:Label ID="Warning" runat="server" CssClass="warning-label" ForeColor="Red"></asp:Label>
                <br />
                &nbsp;<br />
                
                <asp:RadioButton ID="rbAlta" runat="server" GroupName="opcPortal" /> Alta clientes
                <br />
                <br />
                <asp:RadioButton ID="rbListar" runat="server" GroupName="opcPortal" /> Listar / modificar / eliminar clientes <br />
                <br />
               </label>
            </div>

            <!-- Botón Siguiente -->
            <div class="form-group">
                <asp:Button ID="Btn_Siguiente" runat="server" Text="Siguiente" CssClass="btn" OnClick="Btn_Siguiente_Click" />
            </div>
        </div>

    </form>
</body>
</html>
