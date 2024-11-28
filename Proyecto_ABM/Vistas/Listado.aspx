<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="Proyecto_ABM.Vistas.WebForm2" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Listar / modificar / eliminar clientes</title>
    <link href="~/Estilos/style.css" rel="stylesheet" type="text/css" />
    <!-- Favicon -->
    <link rel="icon" href="../Imagenes/Grupo_del_Pilar_logo-G1.png" type="image/x-icon" />

</head>
<body class="cuerpo">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="form-container2">
            <!-- Logo -->
            <div class="logo-container">
                <a href="PortalSolicitudes.aspx">
                    <img src="../Imagenes/Grupo_del_Pilar_logo-2.png" alt="Logo" class="logo" />
                </a>
            </div>
            <!-- Título y subtítulo -->
            <h2>Portal ABM Clientes</h2>
            <h3>Listado de clientes</h3>
            <!-- Campos del formulario -->
            <div class="form-group">
                <label>
                    Listado de clientes<br />
                    <asp:Label ID="Warning" runat="server" CssClass="warning-label" ForeColor="Red"></asp:Label>
                    <br />
                </label>

                        <asp:GridView ID="grdClientes" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Style="font-size: medium" AllowPaging="True" OnPageIndexChanging="grdClientes_PageIndexChanging" OnRowCommand="grdClientes_RowCommand">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID Cliente">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="BtnVerDetalles" runat="server" CssClass="link-button" CommandName="VerDetalles"
                                            CommandArgument='<%# Eval("id") %>' Text="Ver Detalles" OnClientClick="abrirModal();" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="ID Cliente">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIDCliente" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre cliente">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNomCliente" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Telefono cliente">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTelCliente" runat="server" Text='<%# Eval("telefono") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Calle">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCalle" runat="server" Text='<%# Eval("calle") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Altura">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAltura" runat="server" Text='<%# Eval("altura") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Localidad">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLocalidad" runat="server" Text='<%# Eval("localidad") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Partido">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPartido" runat="server" Text='<%# Eval("partido") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Provincia">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProvincia" runat="server" Text='<%# Eval("provincia") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>


                        <div id="myModal" class="modal" runat="server">

                            <!-- Modal content -->
                            <div class="modal-content">
                                <div>
                                    <span class="close">&times;</span>
                                    <h2>Detalles clientes</h2>
                                </div>
                                <div class="modal-body">
                                    <div>
                                        <label><strong>ID Cliente:</strong></label>
                                        <span id="lblIDCliente"></span>
                                    </div>
                                    <div>
                                        <label><strong>Nombre:</strong></label>
                                        <span id="lblNombreCliente"></span>
                                    </div>
                                    <div>
                                        <label><strong>Rubro Código:</strong></label>
                                        <span id="lblRubroCodigo"></span>
                                    </div>
                                    <div>
                                        <label><strong>Grupo Código:</strong></label>
                                        <span id="lblGrupoCodigo"></span>
                                    </div>
                                    <div>
                                        <label><strong>Grupo Descripción:</strong></label>
                                        <span id="lblGrupoDescripcion"></span>
                                    </div>
                                    <div>
                                        <label><strong>Zona:</strong></label>
                                        <span id="lblZona"></span>
                                    </div>
                                    <div>
                                        <label><strong>Teléfono:</strong></label>
                                        <span id="lblTelefono"></span>
                                    </div>
                                    <div>
                                        <label><strong>Condición IVA:</strong></label>
                                        <span id="lblCondicionIva"></span>
                                    </div>
                                    <div>
                                        <label><strong>Aplicación IVA:</strong></label>
                                        <span id="lblAplicacionIva"></span>
                                    </div>
                                    <div>
                                        <label><strong>Aplicación Impuestos Internos:</strong></label>
                                        <span id="lblAplicacionImpuestosInternos"></span>
                                    </div>
                                    <div>
                                        <label><strong>Tipo de Documento:</strong></label>
                                        <span id="lblTipoDocumento"></span>
                                    </div>
                                    <div>
                                        <label><strong>Número de Documento:</strong></label>
                                        <span id="lblNumeroDocumento"></span>
                                    </div>
                                    <div>
                                        <label><strong>Número IIBB:</strong></label>
                                        <span id="lblNumeroIibb"></span>
                                    </div>
                                    <div>
                                        <label><strong>ID Cliente Madre:</strong></label>
                                        <span id="lblIdClienteMadre"></span>
                                    </div>
                                    <div>
                                        <label><strong>Calle:</strong></label>
                                        <span id="lblCalle"></span>
                                    </div>
                                    <div>
                                        <label><strong>Altura:</strong></label>
                                        <span id="lblAltura"></span>
                                    </div>
                                    <div>
                                        <label><strong>Localidad:</strong></label>
                                        <span id="lblLocalidad"></span>
                                    </div>
                                    <div>
                                        <label><strong>Partido:</strong></label>
                                        <span id="lblPartido"></span>
                                    </div>
                                    <div>
                                        <label><strong>Provincia:</strong></label>
                                        <span id="lblProvincia"></span>
                                    </div>
                                    <div>
                                        <label><strong>Ubicación:</strong></label>
                                        <span id="lblUbicacion"></span>
                                    </div>
                                    <div>
                                        <label><strong>Código Postal:</strong></label>
                                        <span id="lblCodigoPostal"></span>
                                    </div>
                                    <div>
                                        <label><strong>Latitud:</strong></label>
                                        <span id="lblLatitud"></span>
                                    </div>
                                    <div>
                                        <label><strong>Longitud:</strong></label>
                                        <span id="lblLongitud"></span>
                                    </div>
                                    <div>
                                        <label><strong>Correo Electrónico:</strong></label>
                                        <span id="lblEmail"></span>
                                    </div>
                                    <div>
                                        <label><strong>Suspendido:</strong></label>
                                        <span id="lblSuspendido"></span>
                                    </div>
                                    <div>
                                        <label><strong>Desactivado:</strong></label>
                                        <span id="lblDesactivado"></span>
                                    </div>
                                    <div>
                                        <label><strong>Cobrador:</strong></label>
                                        <span id="lblCobrador"></span>
                                    </div>
                                    <div>
                                        <label><strong>Observación:</strong></label>
                                        <span id="lblObservacion"></span>
                                    </div>
                                    <div>
                                        <label><strong>Fecha de Alta:</strong></label>
                                        <span id="lblFechaAlta"></span>
                                    </div>
                                    <div>
                                        <label><strong>Código de Empresa:</strong></label>
                                        <span id="lblEmpresaCodigo"></span>
                                    </div>
                                    <div>
                                        <label><strong>Última Modificación:</strong></label>
                                        <span id="lblUltimaModificacion"></span>
                                    </div>
                                    <div>
                                        <label><strong>Vendedor Predeterminado:</strong></label>
                                        <span id="lblVendedorPredeterminado"></span>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button class="modal-btn" id="btnModificar">Modificar</button>
                                    <button class="modal-btn" id="btnEliminar">Eliminar</button>
                                </div>
                            </div>
            </div>




        </div>
        </div>
    </form>

   <%-- <script>
    function abrirModal() {
    var modal = document.getElementById("<%= myModal.ClientID %>");
    modal.style.display = "block";
    }

// Función para cerrar el modal
var span = document.getElementsByClassName("close")[0];
span.onclick = function () {
    var modal = document.getElementById("<%= myModal.ClientID %>");
    modal.style.display = "none";
};

window.onclick = function (event) {
    var modal = document.getElementById("<%= myModal.ClientID %>");
    if (event.target == modal) {
        modal.style.display = "none";
    }
};

    </script>--%>


    <script>
    // Función para abrir el modal
    function abrirModal() {
        // Obtener el modal por su ID
        var modal = document.getElementById("<%= myModal.ClientID %>");
        modal.style.display = "block";
    }

    // Cerrar el modal al hacer clic en la 'x'
    var span = document.getElementsByClassName("close")[0];
    span.onclick = function () {
        var modal = document.getElementById("<%= myModal.ClientID %>");
        modal.style.display = "none";
    };

    // Cerrar el modal al hacer clic fuera de su contenido
    window.onclick = function (event) {
        var modal = document.getElementById("<%= myModal.ClientID %>");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
</script>
</body>
</html>
