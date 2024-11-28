using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Proyecto_ABM.Vistas
{
    public partial class PortalSolicitudes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDDL();
            }
        }

        protected void Btn_Siguiente_Click(object sender, EventArgs e)
        {
            bool SeleccionoAlta = rbAlta.Checked;
            bool SeleccionoListar = rbListar.Checked;
            bool SeleccionoVendedor = ddlVendedores.SelectedIndex != 0;

            if (!SeleccionoVendedor)
            {
                WarningVendedor.Text = "* Identifiquese";
            }
            else
            {
                WarningVendedor.Text=String.Empty;
            }

            if(!SeleccionoAlta && !SeleccionoListar)
            {
                Warning.Text = "* Seleccione una opción";
            }
            else
            {
                if(SeleccionoAlta) {
                    Response.Redirect("Alta_Cliente.aspx");
                    Warning.Text=string.Empty;
                }

                if(SeleccionoListar)
                {
                    Response.Redirect("Listado.aspx");
                    Warning.Text = string.Empty;
                }
            }
        }

        protected void CargarDDL()
        {
            // Crear y cargar el DataTable con datos de ejemplo
            DataTable dtVendedores = new DataTable(); dtVendedores.Columns.Add("ID", typeof(int)); dtVendedores.Columns.Add("Nombre", typeof(string));

          
            dtVendedores.Rows.Add(1, "Juan Pérez"); 
            dtVendedores.Rows.Add(2, "Ana Gómez"); 
            dtVendedores.Rows.Add(3, "Pedro López");

            ddlVendedores.Items.Add(new ListItem("Seleccione una opción", ""));

            foreach (DataRow row in dtVendedores.Rows)
            {
                string id = row["ID"].ToString(); string nombre = row["Nombre"].ToString();
                ddlVendedores.Items.Add(new ListItem($"{id} - {nombre}", id));
            }
        }
    }
}
