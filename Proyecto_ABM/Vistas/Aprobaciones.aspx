<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Aprobaciones.aspx.cs" Inherits="Proyecto_ABM.Vistas.Aprobaciones" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Aprobaciones</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet" />
    <link href="~/Estilos/style.css" rel="stylesheet" type="text/css" />
    <link rel="icon" href="../Imagenes/Grupo_del_Pilar_logo-G1.png" type="image/x-icon" />
    
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('../Imagenes/logistics-staging-area-warehouse.1.0.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .logo-container {
            text-align: center;
            margin-top: 30px;
        }

        .logo {
            max-width: 250px;
        }

        /* Contenedor principal con filtro translúcido */
        /*.form-container {
            position: relative;
            z-index: 1;
            background-color: rgba(255, 255, 255, 0.8);*/ /* Fondo blanco translúcido */
            /*border-radius: 10px;
            padding: 30px;
            margin-top: 50px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }*/

        .grid-container {
            width: 100%;
            margin: 0 auto;
            overflow-x: auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); 
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .table th, .table td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        .table th {
            background-color: #214491; /* Verde oscuro */
            color: white;
            font-weight: 500;
        }

        .table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .table tr:hover {
            background-color: #4070F4;
        }

        .table td {
            color: #333;
        }

        /* Estilo para el pager */
        .pager {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            margin-top: 20px;
        }

        .pager:hover {
            background-color: #214491;
        }

        /* Mensaje vacío */
        .empty-message {
            text-align: center;
            color: #999;
            font-style: italic;
            padding: 20px;
        }

        /* Botón "Volver a menú principal" */
        .back-button {
            display: block;
            width: 100%;
            margin: 30px auto;
            padding: 12px 0;
            background-color: #214491;
            color: white;
            text-align: center;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
             top: 20px; /* Ajusta la distancia desde la parte superior */
            left: 20px; /* Ajusta la distancia desde el borde izquierdo */
            z-index: 10; /* Asegura que el botón esté por encima de otros elementos */
        }

        .back-button:hover {
            background-color: #4070F4;
        }

        /* Estilo de los campos de filtro si los agregas */
        .filter-input {
            margin: 10px;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>

 
    <form id="form1" class="form-aprobaciones" runat="server">
        <!-- Logo -->
        <div class="logo-container">
            <img src="../Imagenes/Grupo_del_Pilar_logo-2.png" alt="Logo" class="logo" />
        </div>

                <!-- Título y subtítulo -->
        <h2>Portal ABM Clientes</h2>
        <h3>Formulario de Aprobaciones</h3>



        <div class="grid-container">
            <asp:GridView ID="Grd_Aprobaciones" runat="server" AutoGenerateColumns="False" 
                CssClass="table" CellPadding="4" ForeColor="#333333" GridLines="None">
                
                <Columns>
                    <asp:BoundField DataField="TipoPedido" HeaderText="Tipo de Pedido" SortExpression="TipoPedido" />
                    <asp:BoundField DataField="CUIT" HeaderText="CUIT" SortExpression="CUIT" />
                    <asp:BoundField DataField="RazonSocial" HeaderText="Razon Social" SortExpression="RazonSocial" />
                    <asp:BoundField DataField="Provincia" HeaderText="Provincia" SortExpression="Provincia" />
                    <asp:BoundField DataField="Partido" HeaderText="Partido" SortExpression="Partido" />
                    <asp:BoundField DataField="Localidad" HeaderText="Localidad" SortExpression="Localidad" />
                    <asp:BoundField DataField="Calle" HeaderText="Calle" SortExpression="Calle" />
                    <asp:BoundField DataField="Nro" HeaderText="Nro" SortExpression="Nro" />
                    <asp:BoundField DataField="Latitud" HeaderText="Latitud" SortExpression="Latitud" />
                    <asp:BoundField DataField="Longitud" HeaderText="Longitud" SortExpression="Longitud" />
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Visita" HeaderText="Visita" SortExpression="Visita" />
                    <asp:BoundField DataField="Entrega" HeaderText="Entrega" SortExpression="Entrega" />
                    <asp:BoundField DataField="IVA" HeaderText="IVA" SortExpression="IVA" />
                    <asp:BoundField DataField="CV" HeaderText="CV" SortExpression="CV" />
                    <asp:BoundField DataField="Rubro" HeaderText="Rubro" SortExpression="Rubro" />
                    <asp:BoundField DataField="Vendedor" HeaderText="Vendedor" SortExpression="Vendedor" />
                    <asp:BoundField DataField="Lista" HeaderText="Lista" SortExpression="Lista" />
                    <asp:BoundField DataField="Dia" HeaderText="Dia" SortExpression="Dia" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                    <asp:BoundField DataField="Motivo" HeaderText="Motivo" SortExpression="Motivo" />
                    <asp:TemplateField HeaderText="Aprobado">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkAprobar" runat="server" 
                                          Checked='<%# Eval("Aprobado") %>' 
                                          OnCheckedChanged="chkAprobar_CheckedChanged" AutoPostBack="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
                <HeaderStyle BackColor="#4CAF50" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" />
                <AlternatingRowStyle BackColor="#EAE7E1" />
                <PagerStyle BackColor="#4CAF50" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    <div class="empty-message">No hay registros disponibles.</div>
                </EmptyDataTemplate>
            </asp:GridView>


        </div>

                                <!-- Botón para volver al menú principal -->
 <a href="PortalSolicitudes.aspx" class="back-button">Volver a Menú Principal</a>
        
    </form>
</body>
</html>
