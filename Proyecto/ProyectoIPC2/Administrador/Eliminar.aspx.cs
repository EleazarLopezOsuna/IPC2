using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Librerias;
using System.Data.SqlClient;

namespace ProyectoIPC2
{
    public partial class Eliminar : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            Bloquear();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            String email = (string)(Busqueda.Text);
            if (op.eliminarUsuario(email))
            {
                Response.Write("<script>window.alert('Usuario Eliminado')</script>");
                limpiar();
                Busqueda.Text = "";
            }
            else
            {
                Response.Write("<script>window.alert('No se encontraron los datos')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string busqueda = (string)(Busqueda.Text);
            if (busqueda.Equals(""))
            {
                Response.Write("<script>window.alert('Ingrese todos los campos')</script>");
            }
            else
            {
                SqlDataReader reader = op.getUsuario(busqueda);
                if (reader != null)
                {
                    crearCarnet.Text = (string)(reader["carnet_usuario"]);
                    crearEmail.Text = (string)(reader["email_usuario"]);
                    crearNombre.Text = (string)(reader["nombre_usuario"]);
                    crearPassword.Text = (string)(reader["password_usuario"]);
                    crearPassword2.Text = (string)(reader["password_usuario"]);
                    String hola = Convert.ToString(reader["nacimiento_usuario"]);
                    DateTime fechahora = Convert.ToDateTime(hola);
                    crearNacimiento.Text = fechahora.ToString("yyyy-MM-dd");
                    crearUsuario.Text = (string)(reader["usuario_usuario"]);
                    crearPalabra.Text = (string)(reader["palabra_usuario"]);
                    crearTelefono.Text = (string)(reader["telefono_usuario"]);
                    Button1.Enabled = true;
                }
                else
                {
                    Response.Write("<script>window.alert('No se encontraron los datos')</script>");
                }
            }
        }

        void limpiar()
        {
            crearCarnet.Text = "";
            crearEmail.Text = "";
            crearNombre.Text = "";
            crearPassword.Text = "";
            crearPassword2.Text = "";
            crearNacimiento.Text = "";
            crearUsuario.Text = "";
            crearPalabra.Text = "";
            crearTelefono.Text = "";
        }
        void limpiarPassword()
        {
            crearPassword.Text = "";
            crearPassword2.Text = "";
        }

        void Bloquear()
        {
            crearCarnet.Enabled = false;
            crearEmail.Enabled = false;
            crearNombre.Enabled = false;
            crearPassword.Enabled = false;
            crearPassword2.Enabled = false;
            crearNacimiento.Enabled = false;
            crearUsuario.Enabled = false;
            crearPalabra.Enabled = false;
            crearTelefono.Enabled = false;
            crearRol.Enabled = false;
            Button1.Enabled = false;
            crearCarnet.CssClass = "form-control";
            crearEmail.CssClass = "form-control";
            crearNombre.CssClass = "form-control";
            crearPassword.CssClass = "form-control";
            crearPassword2.CssClass = "form-control";
            crearNacimiento.CssClass = "form-control";
            crearUsuario.CssClass = "form-control";
            crearPalabra.CssClass = "form-control";
            crearTelefono.CssClass = "form-control";
            crearRol.CssClass = "form-control";
            Button1.CssClass = "btn btn-theme btn-block";
        }
    }
}