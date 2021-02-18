using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Librerias
{
    public class Conectar
    {
        public SqlConnection getConexion()
        {
            try
            {
                string cadena = @"Data Source=JARED\SQLEXPRESS;Initial Catalog=DBProyecto;Integrated Security=True";
                SqlConnection con = new SqlConnection(cadena);
                con.Open();
                return con;
            }
            catch (Exception)
            {

                return null;
            }
        }
    }
}
