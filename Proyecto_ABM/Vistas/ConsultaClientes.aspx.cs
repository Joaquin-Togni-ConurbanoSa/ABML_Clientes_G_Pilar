using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_ABM.Vistas
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Manejar el postback para abrir el modal si es necesario
            if (IsPostBack && ViewState["MostrarModal"] != null && (bool)ViewState["MostrarModal"])
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "mostrarModalDetalles", "mostrarModalDetalles();", true);
                ViewState["MostrarModal"] = false;
            }
        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            HacerVisiblesLosLabels(this);

            lblIngrese.Text = "Información cliente: " + "Juan Pérez";
            lblWarning.Visible = false;
            txtCuil.Visible = false;
            BtnAceptar.Visible = false;

            // Simula consulta de datos (deberías reemplazar esto con tu propia lógica)
            string cuil = txtCuil.Text;

            // Aquí puedes reemplazarlo con la lógica real para obtener datos de una base de datos o API
           /*lblIDCliente.Text = "1";
            lblNombreCliente.Text = "Juan Pérez";
            lblRubroCodigo.Text = "123";
            lblGrupoCodigo.Text = "456";
            lblGrupoDescripcion.Text = "Grupo de Prueba";
            lblZona.Text = "Zona 1";
            lblTelefono.Text = "123-456-7890";
            lblCondicionIva.Text = "Responsable Inscripto";
            lblAplicacionIva.Text = "IVA General";
            lblAplicacionImpuestosInternos.Text = "No";
            lblTipoDocumento.Text = "CUIL";
            lblNumeroDocumento.Text = cuil;
            lblNumeroIibb.Text = "123456789";
            lblIdClienteMadre.Text = "0";
            lblCalle.Text = "Calle Falsa";
            lblAltura.Text = "123";
            lblLocalidad.Text = "Ciudad";
            lblPartido.Text = "Partido";
            lblProvincia.Text = "Provincia";
            lblUbicacion.Text = "Ubicación";
            lblCodigoPostal.Text = "1000";
            lblLatitud.Text = "-34.6037";
            lblLongitud.Text = "-58.3816";
            lblEmail.Text = "juan.perez@example.com";
            lblSuspendido.Text = "No";
            lblDesactivado.Text = "No";
            lblCobrador.Text = "Cobrador 1";
            lblObservacion.Text = "Observaciones";
            lblFechaAlta.Text = DateTime.Now.ToString("dd/MM/yyyy");
            lblEmpresaCodigo.Text = "Empresa 1";
            lblUltimaModificacion.Text = DateTime.Now.ToString("dd/MM/yyyy");
            lblVendedorPredeterminado.Text = "Vendedor 1";*/

            
        }

        private void HacerVisiblesLosLabels(Control parent)
        {
            foreach (Control c in parent.Controls)
            {
                if (c is Label && !((Label)c).Visible) { ((Label)c).Visible = true; }
                // Llamada recursiva para asegurar que se revisen todos los controles dentro de contenedores
                if (c.HasControls())
                {
                    HacerVisiblesLosLabels(c);
                }
            }

        }

    }
}
