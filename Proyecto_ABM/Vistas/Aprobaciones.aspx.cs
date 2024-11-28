using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_ABM.Vistas
{
	public partial class Aprobaciones : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
                List<Aprobacion> aprobaciones = new List<Aprobacion>
                {
                     new Aprobacion
                    {
                        Id = 1,
                        TipoPedido = "Pedido A",
                        CUIT = "20-12345678-9",
                        RazonSocial = "Empresa X",
                        Provincia = "Buenos Aires",
                        Partido = "San Isidro",
                        Localidad = "Acassuso",
                        Calle = "Av. Libertador",
                        Nro = 1234,
                        Latitud = -34.5821,
                        Longitud = -58.4294,
                        Telefono = "011-12345678",
                        Email = "contacto@empresax.com",
                        Visita = "Pendiente",
                        Entrega = "A realizar",
                        IVA = "21%",
                        CV = "Sí",
                        Rubro = "Comercio",
                        Vendedor = "Juan Pérez",
                        Lista = "A",
                        Dia = "Lunes",
                        Estado = "Pendiente",
                        Motivo = "Requiere revisión",
                        Aprobado = false
                    },
                    new Aprobacion
                    {
                        Id = 2,
                        TipoPedido = "Pedido B",
                        CUIT = "20-98765432-1",
                        RazonSocial = "Empresa Y",
                        Provincia = "CABA",
                        Partido = "Palermo",
                        Localidad = "CABA",
                        Calle = "Calle Falsa",
                        Nro = 4321,
                        Latitud = -34.6044,
                        Longitud = -58.4385,
                        Telefono = "011-98765432",
                        Email = "contacto@empresay.com",
                        Visita = "Realizada",
                        Entrega = "Entregado",
                        IVA = "27%",
                        CV = "No",
                        Rubro = "Servicios",
                        Vendedor = "Ana García",
                        Lista = "B",
                        Dia = "Martes",
                        Estado = "Aprobado",
                        Motivo = "Aprobado por el cliente",
                        Aprobado = true
                    }
                };

                // Asignar la lista como fuente de datos para la GridView
                Grd_Aprobaciones.DataSource = aprobaciones;
                Grd_Aprobaciones.DataBind();
            }
		}

        // Manejar el evento cuando un CheckBox cambia su estado
        protected void chkAprobar_CheckedChanged(object sender, EventArgs e)
        {
            // Encontrar el CheckBox que disparó el evento
            CheckBox chkAprobar = (CheckBox)sender;

            // Obtener el índice de la fila en la que se encuentra el CheckBox
            GridViewRow row = (GridViewRow)chkAprobar.NamingContainer;
            int rowIndex = row.RowIndex;

        }
    }


}




public class Aprobacion
{
    public int Id { get; set; }
    public string TipoPedido { get; set; }
    public string CUIT { get; set; }
    public string RazonSocial { get; set; }
    public string Provincia { get; set; }
    public string Partido { get; set; }
    public string Localidad { get; set; }
    public string Calle { get; set; }
    public int Nro { get; set; }
    public double Latitud { get; set; }
    public double Longitud { get; set; }
    public string Telefono { get; set; }
    public string Email { get; set; }
    public string Visita { get; set; }
    public string Entrega { get; set; }
    public string IVA { get; set; }
    public string CV { get; set; }
    public string Rubro { get; set; }
    public string Vendedor { get; set; }
    public string Lista { get; set; }
    public string Dia { get; set; }
    public string Estado { get; set; }
    public string Motivo { get; set; }
    public bool Aprobado { get; set; }
}