using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Librerias;

namespace ProyectoIPC2
{
    public partial class Individual1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Operaciones op = new Operaciones();
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
                }
                catch (Exception)
                {

                }
                if (carnet.ToString().Length == 9 && telefono.ToString().Length == 8)
                {
                    try
                    {
                        if (password.Equals(rpassword))
                        {
                            if (op.buscarUsuario(carnet.ToString(), "carnet") || op.buscarUsuario(email, "email") || op.buscarUsuario(usuario, "usuario"))
                            {
                                Response.Write("<script>window.alert('Carnet, Email o Usuario ya existentes')</script>");
                                limpiarPassword();
                            }
                            else if (op.insertarUsuario(rol, carnet, nombre, hoy, email, telefono, usuario, password, palabra))
                            {
                                Response.Write("<script>window.alert('Usuario Creado')</script>");
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
    }
}