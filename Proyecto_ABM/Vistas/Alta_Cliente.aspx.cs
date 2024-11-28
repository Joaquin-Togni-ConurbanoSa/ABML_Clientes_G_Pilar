using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_ABM.Vistas
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LimpiarMensajes();
                CargarProvincias();


                DropDownList1.AutoPostBack = true;
                ddl_partido.AutoPostBack = true;
            }
        }




        private async void CargarProvincias()
        {
            try
            {

                var provincias = await ObtenerProvinciasAsync();


                DropDownList1.Items.Clear();


                DropDownList1.Items.Add(new ListItem("Seleccione una provincia", ""));


                foreach (var provincia in provincias)
                {
                    DropDownList1.Items.Add(new ListItem(provincia.Nombre, provincia.Id));
                }
            }
            catch (Exception ex)
            {

                Warning_Prov.Text = "No se pudo cargar la lista de provincias. Intente nuevamente.";
            }
        }


        private async Task<List<Provincia>> ObtenerProvinciasAsync()
        {
            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri("https://apis.datos.gob.ar/georef/api/");
                HttpResponseMessage response = await client.GetAsync("provincias");

                if (response.IsSuccessStatusCode)
                {

                    string content = await response.Content.ReadAsStringAsync();


                    var provinciasResponse = JsonConvert.DeserializeObject<ProvinciasResponse>(content);
                    return provinciasResponse.Provincias;
                }
                else
                {

                    throw new Exception("No se pudo obtener las provincias desde la API.");
                }
            }
        }

        protected void Btn_Siguiente_Click(object sender, EventArgs e)
        {
            if (ValidarCampos())
            {
                string coordenadas = Txt_Coordenadas.Text; // Coordenadas en formato "latitud, longitud"


                Response.Write("Coordenadas: " + coordenadas);
            }
            else
            {

            }
        }

        protected bool ValidarCampos()
        {
            LimpiarMensajes();
            bool validacionesCorrectas = true;

            if (string.IsNullOrWhiteSpace(Txt_Cuit.Text))
            {
                Warning_CUIT.Text = "*CUIT es obligatorio.";
                validacionesCorrectas = false;
            }

            if (string.IsNullOrWhiteSpace(Txt_RazonSocial.Text))
            {
                Warning_RS.Text = "*Razón Social es obligatoria.";
                validacionesCorrectas = false;
            }

            if (string.IsNullOrWhiteSpace(ddl_localidad.Text))
            {
                Warning_Localidad.Text = "*Localidad es obligatoria.";
                validacionesCorrectas = false;
            }

            if (string.IsNullOrWhiteSpace(Txt_Callle.Text))
            {
                Warning_Calle.Text = "*Calle es obligatoria.";
                validacionesCorrectas = false;
            }

            if (DropDownList1.SelectedIndex == 0)
            {
                Warning_Prov.Text = "*Debe seleccionar una provincia.";
                validacionesCorrectas = false;
            }

            if (string.IsNullOrWhiteSpace(TextBox6.Text))
            {
                Warning_Num.Text = "Número es obligatorio.";
                validacionesCorrectas = false;
            }

            if (string.IsNullOrWhiteSpace(ddl_partido.Text))
            {
                Warning_Partido.Text = "*Partido es obligatorio.";
                validacionesCorrectas = false;
            }

            if (string.IsNullOrWhiteSpace(Txt_email.Text) || !Regex.IsMatch(Txt_email.Text, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                Warning_Email.Text = "*Email no válido o vacío.";
                validacionesCorrectas = false;
            }

            if (string.IsNullOrWhiteSpace(Txt_Telefono.Text) || !Regex.IsMatch(Txt_Telefono.Text, @"^\d{10}$"))
            {
                Warning_Tel.Text = "*Teléfono no válido o vacío (Debe tener 10 dígitos).";
                validacionesCorrectas = false;
            }

            //if (!RB_Mañ_Visita.Checked && !RB_Medio_Visita.Checked && !RB_Noche_Visita.Checked)
            //{
            //    Warning_Hor_Visita.Text = "*Debe seleccionar un horario de visita.";
            //    validacionesCorrectas = false;
            //}

            //if (!RB_Mañana_Entrega.Checked && !RB_Medio_Entrega.Checked && !RB_Noche_Entrega.Checked)
            //{
            //    Warning_Hor_Entrega.Text = "*Debe seleccionar un horario de entrega.";
            //    validacionesCorrectas = false;
            //}

            return validacionesCorrectas;
        }

        private void LimpiarMensajes()
        {
            Warning_CUIT.Text = string.Empty;
            Warning_RS.Text = string.Empty;
            Warning_Localidad.Text = string.Empty;
            Warning_Calle.Text = string.Empty;
            Warning_Prov.Text = string.Empty;
            Warning_Num.Text = string.Empty;
            Warning_Partido.Text = string.Empty;
            Warning_Email.Text = string.Empty;
            Warning_Tel.Text = string.Empty;
            Warning_Hor_Visita.Text = string.Empty;
            //Warning_Hor_Entrega.Text = string.Empty;
        }

        protected async void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddl_partido.Items.Clear();
            ddl_localidad.Items.Clear();


            if (DropDownList1.SelectedIndex > 0)
            {
                string provinciaId = DropDownList1.SelectedValue;
                await CargarPartidos(provinciaId);

            }

        }

        private async Task CargarPartidos(string provinciaId)
        {
            try
            {

                var departamentos = await ObtenerDepartamentosAsync(provinciaId);


                ddl_partido.Items.Clear();
                ddl_partido.Items.Add(new ListItem("Seleccione un partido", ""));


                foreach (var departamento in departamentos)
                {
                    // Evitar agregar elementos duplicados
                    if (!ddl_partido.Items.Cast<ListItem>().Any(item => item.Value == departamento.Id))
                    {
                        ddl_partido.Items.Add(new ListItem(departamento.Nombre, departamento.Id));
                    }
                }
            }
            catch (Exception ex)
            {

                Warning_Partido.Text = "No se pudo cargar la lista de partidos. Intente nuevamente.";
            }
        }

        private async Task<List<Departamento>> ObtenerDepartamentosAsync(string provinciaId)
        {
            var departamentos = new List<Departamento>();
            int inicio = 0;
            int max = 100;

            while (true)
            {

                var response = await ObtenerDepartamentosPaginaAsync(provinciaId, inicio, max);
                departamentos.AddRange(response.Departamentos);


                if (response.Departamentos.Count < max)
                {
                    break;
                }


                inicio += max;
            }

            return departamentos;
        }

        private async Task<DepartamentosResponse> ObtenerDepartamentosPaginaAsync(string provinciaId, int inicio, int max)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://apis.datos.gob.ar/georef/api/");
                var url = $"departamentos?provincia={provinciaId}&campos=estandar&max={max}&inicio={inicio}";

                HttpResponseMessage response = await client.GetAsync(url);

                if (response.IsSuccessStatusCode)
                {
                    string content = await response.Content.ReadAsStringAsync();
                    var departamentosResponse = JsonConvert.DeserializeObject<DepartamentosResponse>(content);
                    return departamentosResponse;
                }
                else
                {
                    throw new Exception("No se pudo obtener los departamentos desde la API.");
                }
            }
        }





        private async Task CargarLocalidades(string provinciaId, string partidoId)
        {
            try
            {

                var localidades = await ObtenerLocalidadesAsync(provinciaId, partidoId);


                ddl_localidad.Items.Clear();
                ddl_localidad.Items.Add(new ListItem("Seleccione una localidad", ""));



              

                foreach (var localidad in localidades)
                {
                    // Evitar agregar elementos duplicados
                    if (!ddl_localidad.Items.Cast<ListItem>().Any(item => item.Value == localidad.Id))
                    {
                        ddl_localidad.Items.Add(new ListItem(localidad.Nombre, localidad.Id));
                    }
                }
            }
            catch (Exception)
            {
                Warning_Localidad.Text = "No se pudo cargar las localidades. Intente nuevamente. ";
            }
        }


        private async Task<List<Localidad>> ObtenerLocalidadesAsync(string provinciaId, string partidoId)
        {
            var localidades = new List<Localidad>();
            int inicio = 0;
            int max = 100;

            while (true)
            {
                var response = await ObtenerLocalidadesPaginaAsync(provinciaId, partidoId, inicio, max);
                localidades.AddRange(response.Localidades);

                if (response.Localidades.Count < max)
                {
                    break;
                }

                inicio += max;
            }

            return localidades;
        }


        private async Task<LocalidadesResponse> ObtenerLocalidadesPaginaAsync(string provinciaId, string partidoId, int inicio, int max)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://apis.datos.gob.ar/georef/api/");


                var url = $"localidades?provincia={provinciaId}&departamento={partidoId}&aplanar=true&campos=estandar&max={max}&inicio={inicio}&exacto=true";


                HttpResponseMessage response = await client.GetAsync(url);

                if (response.IsSuccessStatusCode)
                {
                    string content = await response.Content.ReadAsStringAsync();
                    var localidadesResponse = JsonConvert.DeserializeObject<LocalidadesResponse>(content);
                    return localidadesResponse;
                }
                else
                {
                    throw new Exception("No se pudo obtener las localidades desde la API.");
                }
            }
        }


        protected async void ddl_partido_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_localidad.Items.Clear();

            if (ddl_partido.SelectedIndex > 0)
            {
                string partidoId = ddl_partido.SelectedValue;  // Obtener el Id del partido seleccionado
                string provinciaId = DropDownList1.SelectedValue;  // Obtener el Id de la provincia seleccionada


                await CargarLocalidades(provinciaId, partidoId);

            }

        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }
    }


    public class Provincia
    {
        public string Id { get; set; }
        public string Nombre { get; set; }
    }


    public class ProvinciasResponse
    {
        public List<Provincia> Provincias { get; set; }
    }

    public class Partido
    {
        public string Id { get; set; }
        public string Nombre { get; set; }
    }

    public class Localidad
    {
        public string Id { get; set; }
        public string Nombre { get; set; }
    }

    public class PartidosResponse
    {
        public List<Partido> Partidos { get; set; }
    }

    public class LocalidadesResponse
    {
        public List<Localidad> Localidades { get; set; }
    }



    public class Departamento
    {
        public string Id { get; set; }
        public string Nombre { get; set; }
    }

    public class DepartamentosResponse
    {
        public List<Departamento> Departamentos { get; set; }
        public int Total { get; set; }
    }


}

