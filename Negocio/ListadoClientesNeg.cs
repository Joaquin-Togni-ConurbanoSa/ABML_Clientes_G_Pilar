using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAO;

namespace Negocio
{
    public class ListadoClientesNeg
    {
        public ListadoClientesNeg() { }

        public async Task<DataTable> DS_ExportClientesAsync()
        {
            ApiSigma consulta = new ApiSigma();
            DataSet dataSet = await consulta.ConsultarClientesAsync();

            // Verificar que el DataSet y la tabla no estén vacíos
            if (dataSet != null)
            {
                return dataSet.Tables["Clientes"];
            }
            else
            {
                return null;
            }
        }

        public DataTable DS_Clientes()
        {
            ApiSigma consulta = new ApiSigma();
            DataSet dataSet = consulta.ObtenerClientes();

            if (dataSet != null)
            {
                return dataSet.Tables["Clientes"];
            }
            else
            {
                return null;
            }
        }

        public DataRow[] Filtrar_X_ID(String id)
        {
            ApiSigma consulta = new ApiSigma();
            DataTable dtClientes = DS_Clientes();

            if (dtClientes != null)
            {
                DataRow[] cliente = dtClientes.Select("id = '" + id + "'");
                return cliente;
            }
            else
            {
                return null;
            }
        }


    }
}


