<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaClientes.aspx.cs" Inherits="Proyecto_ABM.Vistas.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consulta Clientes</title>

    <link href="~/Estilos/style.css" rel="stylesheet" type="text/css" />
    <!-- Favicon -->
    <link rel="icon" href="../Imagenes/Grupo_del_Pilar_logo-G1.png" type="image/x-icon" />

    <style type="text/css">
        #map {
            height: 400px;
            width: 100%;
        }
    </style>

    <script type="text/javascript" src="<%= ResolveUrl("../Javascript/script.js") %>"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDOmu7Tlc10AYwwvImgzk0bp-5Izr8YS8&callback=initMap" async defer></script>


</head>
<body class="bodyAlta">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="form-container">
            <!-- Logo -->
            <div class="logo-container">
                <img src="../Imagenes/Grupo_del_Pilar_logo-2.png" alt="Logo" class="logo" />
            </div>

            <!-- Título y subtítulo -->
            <h2>Portal ABM Clientes</h2>
            <h3>Consulta de clientes</h3>

            <!-- Campos del formulario -->
            <div class="form-group">
                <asp:Label ID="lblIngrese" runat="server" Text="Ingrese el cuil o nombre del cliente: " CssClass="label" Width="338px"></asp:Label>
                <asp:Label ID="lblWarning" runat="server" CssClass="warning"></asp:Label>
                <asp:TextBox ID="txtCuil" runat="server" CssClass="input-field"></asp:TextBox>
                <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" CssClass="btn btnAceptar" OnClick="BtnAceptar_Click" />

                <br />

                <br />


               <%-- <table class="table">
                    <thead>
                        <tr>
                            <th><asp:Label ID="Campo" runat="server" CssClass="label indent" Text="Campos" Visible="false"></asp:Label></th>
                            <th><asp:Label ID="Valores" runat="server" CssClass="label indent" Text="Valores" Visible="false"></asp:Label></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleIDCliente" runat="server" CssClass="label indent" Text="ID Cliente:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblIDCliente" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleNombre" runat="server" CssClass="label indent" Text="Nombre:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblNombreCliente" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleRubroCodigo" runat="server" CssClass="label indent" Text="Rubro Código:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblRubroCodigo" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleGrupoCodigo" runat="server" CssClass="label indent" Text="Grupo Código:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblGrupoCodigo" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleGrupoDescripcion" runat="server" CssClass="label indent" Text="Grupo Descripción:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblGrupoDescripcion" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleZona" runat="server" CssClass="label indent" Text="Zona:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblZona" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleTelefono" runat="server" CssClass="label indent" Text="Teléfono:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblTelefono" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleCondicionIva" runat="server" CssClass="label indent" Text="Condición IVA:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblCondicionIva" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleAplicacionIva" runat="server" CssClass="label indent" Text="Aplicación IVA:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblAplicacionIva" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleAplicacionImpuestosInternos" runat="server" CssClass="label indent" Text="Aplicación Impuestos Internos:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblAplicacionImpuestosInternos" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleTipoDocumento" runat="server" CssClass="label indent" Text="Tipo de Documento:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblTipoDocumento" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleNumeroDocumento" runat="server" CssClass="label indent" Text="Número de Documento:" Visible="False"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblNumeroDocumento" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleNumeroIibb" runat="server" CssClass="label indent" Text="Número IIBB:" Visible="False" Width="200px"></asp:Label></th>
                            <td>
                                <asp:Label ID="lblNumeroIibb" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleIdClienteMadre" runat="server" CssClass="label indent" Text="ID Cliente Madre:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblIdClienteMadre" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleCalle" runat="server" CssClass="label indent" Text="Calle:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblCalle" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleAltura" runat="server" CssClass="label indent" Text="Altura:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblAltura" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleLocalidad" runat="server" CssClass="label indent" Text="Localidad:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblLocalidad" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitlePartido" runat="server" CssClass="label indent" Text="Partido:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblPartido" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleProvincia" runat="server" CssClass="label indent" Text="Provincia:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblProvincia" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleUbicacion" runat="server" CssClass="label indent" Text="Ubicación:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblUbicacion" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleCodigoPostal" runat="server" CssClass="label indent" Text="Código Postal:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblCodigoPostal" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleLatitud" runat="server" CssClass="label indent" Text="Latitud:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblLatitud" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleLongitud" runat="server" CssClass="label indent" Text="Longitud:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblLongitud" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleEmail" runat="server" CssClass="label indent" Text="Correo Electrónico:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleSuspendido" runat="server" CssClass="label indent" Text="Suspendido:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblSuspendido" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleDesactivado" runat="server" CssClass="label indent" Text="Desactivado:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblDesactivado" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleCobrador" runat="server" CssClass="label indent" Text="Cobrador:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblCobrador" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleObservacion" runat="server" CssClass="label indent" Text="Observación:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblObservacion" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleFechaAlta" runat="server" CssClass="label indent" Text="Fecha de Alta:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblFechaAlta" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleEmpresaCodigo" runat="server" CssClass="label indent" Text="Código de Empresa:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblEmpresaCodigo" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleUltimaModificacion" runat="server" CssClass="label indent" Text="Última Modificación:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblUltimaModificacion" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="lblTitleVendedorPredeterminado" runat="server" CssClass="label indent" Text="Vendedor Predeterminado:" Visible="False"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblVendedorPredeterminado" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>--%>

                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="50px" Width="206px">
                    <AlternatingRowStyle BackColor="Gainsboro" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:TemplateField HeaderText="ID Cliente">
                            <ItemTemplate>
                                <asp:Label ID="lblIDCliente" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre cliente">
                            <ItemTemplate>
                                <asp:Label ID="lblNombreCliente" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rubro código">
                            <ItemTemplate>
                                <asp:Label ID="lblRubroCodigo" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Grupo código">
                            <ItemTemplate>
                                <asp:Label ID="lblGrupoCodigo" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Grupo descripción">
                            <ItemTemplate>
                                <asp:Label ID="lblGrupoDescripcion" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zona">
                            <ItemTemplate>
                                <asp:Label ID="lblZona" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Teléfono">
                            <ItemTemplate>
                                <asp:Label ID="lblTelefono" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Condición IVA">
                            <ItemTemplate>
                                <asp:Label ID="lblCondicion" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Aplicación IVA">
                            <ItemTemplate>
                                <asp:Label ID="lblAplicacionIva" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Impuestos internos">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="lblAplicacionImpuestosInternos"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo documento">
                            <ItemTemplate>
                                <asp:Label ID="lblTipoDocumento" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nro documento">
                            <ItemTemplate>
                                <asp:Label ID="lblNumeroDocumento" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Número IIBB">
                            <ItemTemplate>
                                <asp:Label ID="lblNumeroIibb" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cliente madre">
                            <ItemTemplate>
                                <asp:Label ID="lblClienteMadre" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Calle">
                            <ItemTemplate>
                                <asp:Label ID="lblCalle" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Altura">
                            <ItemTemplate>
                                <asp:Label ID="lblAltura" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Localidad">
                            <ItemTemplate>
                                <asp:Label ID="lblLocalidad" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Partido">
                            <ItemTemplate>
                                <asp:Label ID="lblPartido" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Provincia">
                            <ItemTemplate>
                                <asp:Label ID="lblProvincia" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ubicación">
                            <ItemTemplate>
                                <asp:Label ID="lblUbicacion" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Codigo postal">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text="lblCodigoPostal"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Latitud">
                            <ItemTemplate>
                                <asp:Label ID="lblLatitud" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Longitud">
                            <ItemTemplate>
                                <asp:Label ID="lblLongitud" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Suspendido">
                            <ItemTemplate>
                                <asp:Label ID="lblSuspendido" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Desactivado">
                            <ItemTemplate>
                                <asp:Label ID="lblDesactivado" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cobrador">
                            <ItemTemplate>
                                <asp:Label ID="lblCobrador" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Observación">
                            <ItemTemplate>
                                <asp:Label ID="lblObservacion" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha alta">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text="lblFechaAlta"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Código empresa">
                            <ItemTemplate>
                                <asp:Label ID="lblEmpresaCodigo" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Última modificación">
                            <ItemTemplate>
                                <asp:Label ID="lblUltimaModificacion" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Vendedor predeterminado">
                            <ItemTemplate>
                                <asp:Label ID="lblVendedorPredeterminado" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                </asp:DetailsView>



            </div>
        </div>
    </form>

</body>





</html>
