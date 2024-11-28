using System;
using System.Data;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace Proyecto_ABM.Vistas
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    CargarGridViewJSON();
                }
                catch (Exception ex)
                {
                    Warning.Text = "Error al cargar: " + ex.Message;
                }

                // Obtén los datos del cliente
                ListadoClientesNeg neg = new ListadoClientesNeg();
                DataRow[] cliente = neg.Filtrar_X_ID("083888");

            }
        }


        protected async Task CargarGridViewAPI()
        {
            ListadoClientesNeg neg = new ListadoClientesNeg();
            DataTable clientes = await neg.DS_ExportClientesAsync();

            if (clientes != null)
            {
                grdClientes.DataSource = clientes;
                grdClientes.DataBind();
            }
            else
            {
                Warning.Text = "No se pudo cargar la grid";
            }

        }

        protected void CargarGridViewJSON()
        {
            ListadoClientesNeg neg = new ListadoClientesNeg();
            DataTable clientes = neg.DS_Clientes();

            if (clientes != null)
            {
                grdClientes.DataSource = clientes;
                grdClientes.DataBind();
            }
            else
            {
                Warning.Text = "No se pudo cargar la grid";
            }
        }

        protected void grdClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdClientes.PageIndex = e.NewPageIndex;
            CargarGridViewJSON();
        }

        
        public static string ObtenerDetallesCliente(string idCliente)
        {
            // Obtén los datos del cliente
            ListadoClientesNeg neg = new ListadoClientesNeg();
            DataRow[] cliente = neg.Filtrar_X_ID(idCliente);

            if (cliente != null && cliente.Length > 0)
            {
                DataRow row = cliente[0];

                // Crea un objeto anónimo para devolver los datos
                var datosCliente = new
                {
                    id = row["id"].ToString(),
                    nombre = row["nombre"].ToString(),
                    rubroCodigo = row["rubroCodigo"].ToString(),
                    grupoCodigo = row["grupoCodigo"].ToString(),
                    grupoDescripcion = row["grupoDescripcion"].ToString(),
                    zona = row["zona"].ToString(),
                    telefono = row["telefono"].ToString(),
                    condicionIva = row["condicionIva"].ToString(),
                    aplicacionIva = row["aplicacionIva"].ToString(),
                    aplicacionImpuestosInternos = row["aplicacionImpuestosInternos"].ToString(),
                    tipoDocumento = row["tipoDocumento"].ToString(),
                    numeroDocumento = row["numeroDocumento"].ToString(),
                    numeroIibb = row["numeroIibb"].ToString(),
                    idClienteMadre = row["idClienteMadre"].ToString(),
                    calle = row["calle"].ToString(),
                    altura = row["altura"].ToString(),
                    localidad = row["localidad"].ToString(),
                    partido = row["partido"].ToString(),
                    provincia = row["provincia"].ToString(),
                    ubicacion = row["ubicacion"].ToString(),
                    codigoPostal = row["codigoPostal"].ToString(),
                    latitud = row["latitud"].ToString(),
                    longitud = row["longitud"].ToString(),
                    email = row["eMail"].ToString(),
                    suspendido = row["suspendido"].ToString(),
                    desactivado = row["desactivado"].ToString(),
                    cobrador = row["cobrador"].ToString(),
                    observacion = row["observacion"].ToString(),
                    fechaAlta = row["fechaAlta"].ToString(),
                    empresaCodigo = row["empresaCodigo"].ToString(),
                    ultimaModificacion = row["ultimaModificacion"].ToString(),
                    vendedorPredeterminado = row["vendedorPredeterminado"].ToString()
                };

                // Serializa el objeto a JSON
                return new JavaScriptSerializer().Serialize(datosCliente);
            }
            return "{}"; // Retorna un JSON vacío si no encuentra el cliente
        }


        protected void grdClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "VerDetalles")
            {
                string idCliente = e.CommandArgument.ToString();

                // Obtén los datos del cliente
                ListadoClientesNeg neg = new ListadoClientesNeg();
                DataRow[] cliente = neg.Filtrar_X_ID(idCliente);

                if (cliente != null && cliente.Length > 0)
                {
                    DataRow row = cliente[0];

                    // Generar el script para actualizar los datos del modal
                    string script = $@"
                document.getElementById('lblIDCliente').innerText = '{HttpUtility.JavaScriptStringEncode(row["id"].ToString())}';
                document.getElementById('lblNombreCliente').innerText = '{HttpUtility.JavaScriptStringEncode(row["nombre"].ToString())}';
                document.getElementById('lblRubroCodigo').innerText = '{HttpUtility.JavaScriptStringEncode(row["rubroCodigo"].ToString())}';
                document.getElementById('lblGrupoCodigo').innerText = '{HttpUtility.JavaScriptStringEncode(row["grupoCodigo"].ToString())}';
                document.getElementById('lblGrupoDescripcion').innerText = '{HttpUtility.JavaScriptStringEncode(row["grupoDescripcion"].ToString())}';
                document.getElementById('lblZona').innerText = '{HttpUtility.JavaScriptStringEncode(row["zona"].ToString())}';
                document.getElementById('lblTelefono').innerText = '{HttpUtility.JavaScriptStringEncode(row["telefono"].ToString())}';
                document.getElementById('lblCondicionIva').innerText = '{HttpUtility.JavaScriptStringEncode(row["condicionIva"].ToString())}';
                document.getElementById('lblAplicacionIva').innerText = '{HttpUtility.JavaScriptStringEncode(row["aplicacionIva"].ToString())}';
                document.getElementById('lblAplicacionImpuestosInternos').innerText = '{HttpUtility.JavaScriptStringEncode(row["aplicacionImpuestosInternos"].ToString())}';
                document.getElementById('lblTipoDocumento').innerText = '{HttpUtility.JavaScriptStringEncode(row["tipoDocumento"].ToString())}';
                document.getElementById('lblNumeroDocumento').innerText = '{HttpUtility.JavaScriptStringEncode(row["numeroDocumento"].ToString())}';
                document.getElementById('lblNumeroIibb').innerText = '{HttpUtility.JavaScriptStringEncode(row["numeroIibb"].ToString())}';
                document.getElementById('lblIdClienteMadre').innerText = '{HttpUtility.JavaScriptStringEncode(row["idClienteMadre"].ToString())}';
                document.getElementById('lblCalle').innerText = '{HttpUtility.JavaScriptStringEncode(row["calle"].ToString())}';
                document.getElementById('lblAltura').innerText = '{HttpUtility.JavaScriptStringEncode(row["altura"].ToString())}';
                document.getElementById('lblLocalidad').innerText = '{HttpUtility.JavaScriptStringEncode(row["localidad"].ToString())}';
                document.getElementById('lblPartido').innerText = '{HttpUtility.JavaScriptStringEncode(row["partido"].ToString())}';
                document.getElementById('lblProvincia').innerText = '{HttpUtility.JavaScriptStringEncode(row["provincia"].ToString())}';
                document.getElementById('lblUbicacion').innerText = '{HttpUtility.JavaScriptStringEncode(row["ubicacion"].ToString())}';
                document.getElementById('lblCodigoPostal').innerText = '{HttpUtility.JavaScriptStringEncode(row["codigoPostal"].ToString())}';
                document.getElementById('lblLatitud').innerText = '{HttpUtility.JavaScriptStringEncode(row["latitud"].ToString())}';
                document.getElementById('lblLongitud').innerText = '{HttpUtility.JavaScriptStringEncode(row["longitud"].ToString())}';
                document.getElementById('lblEmail').innerText = '{HttpUtility.JavaScriptStringEncode(row["eMail"].ToString())}';
                document.getElementById('lblSuspendido').innerText = '{HttpUtility.JavaScriptStringEncode(row["suspendido"].ToString())}';
                document.getElementById('lblDesactivado').innerText = '{HttpUtility.JavaScriptStringEncode(row["desactivado"].ToString())}';
                document.getElementById('lblCobrador').innerText = '{HttpUtility.JavaScriptStringEncode(row["cobrador"].ToString())}';
                document.getElementById('lblObservacion').innerText = '{HttpUtility.JavaScriptStringEncode(row["observacion"].ToString())}';
                document.getElementById('lblFechaAlta').innerText = '{HttpUtility.JavaScriptStringEncode(row["fechaAlta"].ToString())}';
                document.getElementById('lblEmpresaCodigo').innerText = '{HttpUtility.JavaScriptStringEncode(row["empresaCodigo"].ToString())}';
                document.getElementById('lblUltimaModificacion').innerText = '{HttpUtility.JavaScriptStringEncode(row["ultimaModificacion"].ToString())}';
                document.getElementById('lblVendedorPredeterminado').innerText = '{HttpUtility.JavaScriptStringEncode(row["vendedorPredeterminado"].ToString())}';
            ";

                    // Ejecutar el script para actualizar los datos del modal
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "actualizarModal", script, true);
                }
                else
                {
                    // Si no se encuentra el cliente, puedes manejar el caso de error aquí
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "errorModal", "alert('Cliente no encontrado');", true);
                }
            }
        }





    }
}
