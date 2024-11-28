using System;
using System.Collections.Generic;
using System.Data;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using static System.Net.WebRequestMethods;
using System.IO;



namespace DAO
{
    public class ApiSigma
    {
        // Propiedades privadas
        private string token;

        // Constructor
        public ApiSigma()
        {
            token = "logistica@sigma-ar:7cxNco3kQKlpQP/bH9SXrv1BuRnMd/MMK0MeV2/fTGc=";
        }



        public async Task<DataSet> ConsultarClientesAsync()
        {
            var client = new HttpClient();
            var request = new HttpRequestMessage(HttpMethod.Get, "https://secure.sig2k.com/sigmasaas/logistica@sigma-ar/sigma/api/v10/ExportClientes");
            request.Headers.Add("x-auth-token", token);

            var response = await client.SendAsync(request);
            response.EnsureSuccessStatusCode();

            // Obtener el contenido de la respuesta como string
            var jsonResponse = await response.Content.ReadAsStringAsync();

            // Convertir el JSON a un DataSet 
            var dataSet = ConvertJsonToDataSet(jsonResponse);

            return dataSet;
        }

        public DataSet ObtenerClientes()
        {
            // Ruta al archivo JSON en tu PC
            string filePath = @"C:\Users\dalonzo\Downloads\Proyecto_ABM (2)\Proyecto_ABM\Proyecto_ABM\DAO\Jsons\ExportClientes.json";

            // Leer el contenido del archivo JSON
            string jsonContent;
            try
            {
                jsonContent = System.IO.File.ReadAllText(filePath);

            }
            catch (Exception ex)
            {

                return null;
            }


            DataSet dataSet = ConvertJsonToDataSet(jsonContent);
            return dataSet;


        }

        // Método estático para convertir JSON a DataSet
        private static DataSet ConvertJsonToDataSet(string json)
        {
            // Parsea el JSON a un JArray
            JArray jArray = JArray.Parse(json);

            DataSet dataSet = new DataSet();

            DataTable dtClientes = new DataTable("Clientes");
            DataTable dtVendedores = new DataTable("Vendedores");

            // Columnas de Clientes
            dtClientes.Columns.Add("id", typeof(string));
            dtClientes.Columns.Add("nombre", typeof(string));
            dtClientes.Columns.Add("rubroCodigo", typeof(string));
            dtClientes.Columns.Add("grupoCodigo", typeof(string));
            dtClientes.Columns.Add("grupoDescripcion", typeof(string));
            dtClientes.Columns.Add("zona", typeof(string));
            dtClientes.Columns.Add("telefono", typeof(string));
            dtClientes.Columns.Add("condicionIva", typeof(string));
            dtClientes.Columns.Add("aplicacionIva", typeof(string));
            dtClientes.Columns.Add("aplicacionImpuestosInternos", typeof(string));
            dtClientes.Columns.Add("tipoDocumento", typeof(string));
            dtClientes.Columns.Add("numeroDocumento", typeof(string));
            dtClientes.Columns.Add("numeroIibb", typeof(string));
            dtClientes.Columns.Add("idClienteMadre", typeof(string));
            dtClientes.Columns.Add("calle", typeof(string));
            dtClientes.Columns.Add("altura", typeof(string));
            dtClientes.Columns.Add("localidad", typeof(string));
            dtClientes.Columns.Add("partido", typeof(string));
            dtClientes.Columns.Add("provincia", typeof(string));
            dtClientes.Columns.Add("ubicacion", typeof(string));
            dtClientes.Columns.Add("codigoPostal", typeof(string));
            dtClientes.Columns.Add("latitud", typeof(string));
            dtClientes.Columns.Add("longitud", typeof(string));
            dtClientes.Columns.Add("eMail", typeof(string));
            dtClientes.Columns.Add("suspendido", typeof(bool));
            dtClientes.Columns.Add("desactivado", typeof(bool));
            dtClientes.Columns.Add("cobrador", typeof(string));
            dtClientes.Columns.Add("observacion", typeof(string));
            dtClientes.Columns.Add("fechaAlta", typeof(string));
            dtClientes.Columns.Add("empresaCodigo", typeof(string));
            dtClientes.Columns.Add("ultimaModificacion", typeof(string));
            dtClientes.Columns.Add("vendedorPredeterminado", typeof(string));

            // Columnas de Vendedores
            dtVendedores.Columns.Add("vendedor", typeof(string));
            dtVendedores.Columns.Add("id", typeof(string)); // FK de Clientes
            dtVendedores.Columns.Add("condicionVentaDescripcion", typeof(string));
            dtVendedores.Columns.Add("listaDePrecio", typeof(string));
            dtVendedores.Columns.Add("descuento", typeof(string));
            dtVendedores.Columns.Add("diaDeVisita", typeof(string));
            dtVendedores.Columns.Add("ordenDeVisita", typeof(string));
            dtVendedores.Columns.Add("repartoId", typeof(string));
            dtVendedores.Columns.Add("repartoDescripcion", typeof(string));




            // Procesar cada cliente
            foreach (var cliente in jArray)
            {
                // Agregar fila para Clientes
                DataRow clienteRow = dtClientes.NewRow();
                clienteRow["id"] = cliente["id"]?.ToString() ?? string.Empty;
                clienteRow["nombre"] = cliente["nombre"]?.ToString() ?? string.Empty;
                clienteRow["rubroCodigo"] = cliente["rubroCodigo"]?.ToString() ?? string.Empty;
                clienteRow["grupoCodigo"] = cliente["grupoCodigo"]?.ToString() ?? string.Empty;
                clienteRow["grupoDescripcion"] = cliente["grupoDescripcion"]?.ToString() ?? string.Empty;
                clienteRow["zona"] = cliente["zona"]?.ToString() ?? string.Empty;
                clienteRow["telefono"] = cliente["telefono"]?.ToString() ?? string.Empty;
                clienteRow["condicionIva"] = cliente["condicionIva"]?.ToString() ?? string.Empty;
                clienteRow["aplicacionIva"] = cliente["aplicacionIva"]?.ToString() ?? string.Empty;
                clienteRow["aplicacionImpuestosInternos"] = cliente["aplicacionImpuestosInternos"]?.ToString() ?? string.Empty;
                clienteRow["tipoDocumento"] = cliente["tipoDocumento"]?.ToString() ?? string.Empty;
                clienteRow["numeroDocumento"] = cliente["numeroDocumento"]?.ToString() ?? string.Empty;
                clienteRow["numeroIibb"] = cliente["numeroIibb"]?.ToString() ?? string.Empty;
                clienteRow["idClienteMadre"] = cliente["idClienteMadre"]?.ToString() ?? string.Empty;
                clienteRow["calle"] = cliente["calle"]?.ToString() ?? string.Empty;
                clienteRow["altura"] = cliente["altura"]?.ToString() ?? string.Empty;
                clienteRow["localidad"] = cliente["localidad"]?.ToString() ?? string.Empty;
                clienteRow["partido"] = cliente["partido"]?.ToString() ?? string.Empty;
                clienteRow["provincia"] = cliente["provincia"]?.ToString() ?? string.Empty;
                clienteRow["ubicacion"] = cliente["ubicacion"]?.ToString() ?? string.Empty;
                clienteRow["codigoPostal"] = cliente["codigoPostal"]?.ToString() ?? string.Empty;
                clienteRow["latitud"] = cliente["latitud"]?.ToString() ?? string.Empty;
                clienteRow["longitud"] = cliente["longitud"]?.ToString() ?? string.Empty;
                clienteRow["eMail"] = cliente["eMail"]?.ToString() ?? string.Empty;
                clienteRow["suspendido"] = cliente["suspendido"] != null ? (bool)cliente["suspendido"] : false;
                clienteRow["desactivado"] = cliente["desactivado"] != null ? (bool)cliente["desactivado"] : false;
                clienteRow["cobrador"] = cliente["cobrador"]?.ToString() ?? string.Empty;
                clienteRow["observacion"] = cliente["observacion"]?.ToString() ?? string.Empty;
                clienteRow["fechaAlta"] = cliente["fechaAlta"]?.ToString() ?? string.Empty;
                clienteRow["empresaCodigo"] = cliente["empresaCodigo"]?.ToString() ?? string.Empty;
                clienteRow["ultimaModificacion"] = cliente["ultimaModificacion"]?.ToString() ?? string.Empty;
                clienteRow["vendedorPredeterminado"] = cliente["vendedorPredeterminado"]?.ToString() ?? string.Empty;

                dtClientes.Rows.Add(clienteRow);

                // Agregar filas para los Vendedores de este Cliente
                var vendedores = cliente["vendedores"] as JArray;
                if (vendedores != null)
                {
                    foreach (var vendedor in vendedores)
                    {
                        DataRow vendedorRow = dtVendedores.NewRow();
                        vendedorRow["vendedor"] = vendedor["vendedor"]?.ToString() ?? string.Empty;
                        vendedorRow["id"] = cliente["id"]?.ToString() ?? string.Empty;
                        vendedorRow["condicionVentaDescripcion"] = vendedor["condicionVentaDescripcion"]?.ToString() ?? string.Empty;
                        vendedorRow["listaDePrecio"] = vendedor["listaDePrecio"]?.ToString() ?? string.Empty;
                        vendedorRow["descuento"] = vendedor["descuento"]?.ToString() ?? string.Empty;
                        vendedorRow["diaDeVisita"] = vendedor["diaDeVisita"]?.ToString() ?? string.Empty;
                        vendedorRow["ordenDeVisita"] = vendedor["ordenDeVisita"]?.ToString() ?? string.Empty;
                        vendedorRow["repartoId"] = vendedor["repartoId"]?.ToString() ?? string.Empty;
                        vendedorRow["repartoDescripcion"] = vendedor["repartoDescripcion"]?.ToString() ?? string.Empty;

                        dtVendedores.Rows.Add(vendedorRow);
                    }
                }
            }



            // Agregar las tablas al DataSet
            dataSet.Tables.Add(dtClientes);
            dataSet.Tables.Add(dtVendedores);

            return dataSet;
        }
    }
}

