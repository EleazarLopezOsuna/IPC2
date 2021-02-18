using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;

namespace Librerias
{
    public class Operaciones
    {
        Conectar con = new Conectar();
        public bool insertarUsuario(string rol, double carnet, string nombre, string nacimiento, string email, double telefono, string usuario, string password, string palabra)
        {
            try
            {
                string sql = "Insert into Usuario values('" + rol + "', '" + carnet + "', '" + nombre + "', '" + nacimiento + "', '" + email + "', '" + telefono + "', '" + usuario + "', '" + password + "', '" + palabra + "')";
                SqlCommand cmd = new SqlCommand(sql, con.getConexion());
                int n = cmd.ExecuteNonQuery();
                return n > 0;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool buscarUsuario(String cadena, String tipo)
        {
            bool encontro = false;
            try
            {
                string sql = "Select * from Usuario where " + tipo + "_usuario = '" + cadena + "'";
                if (tipo.Equals("carnet") || tipo.Equals("email") || tipo.Equals("usuario"))
                {

                    SqlCommand cmd = new SqlCommand(sql, con.getConexion());
                    SqlDataReader reader;
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        if (tipo.Equals("carnet") && cadena.Equals(reader["carnet_usuario"].ToString()))
                        {
                            encontro = true;
                        }
                        else if (tipo.Equals("email") && cadena.Equals(reader["email_usuario"].ToString()))
                        {
                            encontro = true;
                        }else if (tipo.Equals("usuario") && cadena.Equals(reader["usuario_usuario"].ToString()))
                        {

                        }
                    }
                }
                return encontro;
            }
            catch (Exception)
            {

                return encontro;
            }
        }

        public bool buscarLogin(string correo, string password)
        {
            bool retorno = false;
            try
            {
                string sql = "Select * from Usuario where email_usuario = '" + correo + "'";
                SqlCommand cmd = new SqlCommand(sql, con.getConexion());
                SqlDataReader reader;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (password.Equals(reader[7]))
                    {
                        retorno = true;
                    }
                }
                return retorno;
            }
            catch (Exception)
            {

                return retorno;
            }
        }
    }
}
