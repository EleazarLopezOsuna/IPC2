using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Librerias;

namespace ProyectoIPC2
{
    public partial class Modificar : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            Bloquear();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombre, usuario, email, password, rpassword, palabra, uno, dos, rol;
            double carnet = 0;
            double telefono = 0;
            string hoy = crearNacimiento.Text;
            nombre = crearNombre.Text;
            usuario = crearUsuario.Text;
            email = crearEmail.Text;
            password = crearPassword.Text;
            rpassword = crearPassword2.Text;
            palabra = crearPalabra.Text;
            uno = crearCarnet.Text;
            dos = crearTelefono.Text;
            rol = crearRol.SelectedValue.ToString();
            string buscado = (string)(Busqueda.Text);
            if (hoy.Equals("") || nombre.Equals("") || usuario.Equals("") || email.Equals("") || password.Equals("") || rpassword.Equals("") || palabra.Equals("") || uno.Equals("") || dos.Equals(""))
            {
                Response.Write("<script>window.alert('Ingrese todos los campos')</script>");
            }
            else
            {
                try
                {
                    carnet = Int64.Parse(crearCarnet.Text);
                    telefono = Int64.Parse(crearTelefono.Text);
                    if (carnet.ToString().Length == 9 && telefono.ToString().Length == 8)
                    {
                        try
                        {
                            if (password.Equals(rpassword))
                            {
                                SqlDataReader reader = op.getUsuario(buscado);
                                int contador = 0;
                                if (reader != null)
                                {
                                    if (!uno.Equals((string)(reader["carnet_usuario"])))
                                    {
                                        if (op.buscarUsuario(carnet.ToString(), "carnet"))
                                        {
                                            contador++;
                                        }
                                    }
                                    if (!email.Equals((string)(reader["email_usuario"])))
                                    {
                                        if (op.buscarUsuario(email, "email"))
                                        {
                                            contador++;
                                        }
                                    }
                                    if (!usuario.Equals((string)(reader["usuario_usuario"])))
                                    {
                                        if (op.buscarUsuario(usuario, "usuario"))
                                        {
                                            contador++;
                                        }
                                    }
                                    if (contador == 0)
                                    {
                                        if (op.updateUsuario(rol, carnet, nombre, hoy, email, telefono, usuario, password, palabra, buscado))
                                        {
                                            Response.Write("<script>window.alert('Usuario Modificado')</script>");
                                            Busqueda.Text = "";
                                            limpiar();
                                        }
                                        else
                                        {
                                            Response.Write("<script>window.alert('Error al Crear Usuario')</script>");
                                            limpiar();
                                        }
                                    }
                                    else
                                    {
                                        Response.Write("<script>window.alert('Carnet, Email o Usuario ya existentes')</script>");
                                    }
                                }
                                else
                                {
                                    Response.Write("<script>window.alert('Datos No Encontrados')</script>");
                                    limpiar();
                                }

                            }
                            else
                            {
                                Response.Write("<script>window.alert('Las contraseñas deben coincidir')</script>");
                                limpiarPassword();
                            }
                        }
                        catch (Exception)
                        {
                            Response.Write("<script>window.alert('Carnet debe ser numerico')</script>");
                            limpiarPassword();
                        }
                    }
                    else
                    {
                        Response.Write("<script>window.alert('DPI debe tener 13 digitos y Carnet debe tener 9 digitos')</script>");
                        limpiarPassword();
                    }
                }
                catch (Exception)
                {

                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string busqueda = (string)(Busqueda.Text);
            if(busqueda.Equals(""))
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
                    crearRol.SelectedValue = (string)(reader["rol_usuario"]);
                    Desbloquear();
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

        void Desbloquear()
        {
            crearCarnet.Enabled = true;
            crearEmail.Enabled = true;
            crearNombre.Enabled = true;
            crearPassword.Enabled = true;
            crearPassword2.Enabled = true;
            crearNacimiento.Enabled = true;
            crearUsuario.Enabled = true;
            crearPalabra.Enabled = true;
            crearTelefono.Enabled = true;
            crearRol.Enabled = true;
            Button1.Enabled = true;
        }
    }
}