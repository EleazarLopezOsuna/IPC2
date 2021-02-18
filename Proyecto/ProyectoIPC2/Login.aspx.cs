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
    public partial class Login : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            string rol;
            rol = (string)(Session["rol"]);
            switch (rol)
            {
                case "Usuario":
                    Response.Redirect("Default.aspx");
                    break;
                case "Administrador":
                    Response.Redirect("Administrador.aspx");
                    break;
                case "Tutor":
                    Response.Redirect("Tutor.aspx");
                    break;
                case "Operador":
                    Response.Redirect("Operador.aspx");
                    break;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string correo, password;
            correo = loginEmail.Text;
            password = loginPassword.Text;
            if (correo.Equals("") || password.Equals(""))
            {
                Response.Write("<script>window.alert('Ingrese Datos')</script>");
            }
            else
            {
                if (op.buscarLogin(correo, password))
                {
                    SqlDataReader usuario = op.getUsuario(correo);
                    String rol = usuario["rol_usuario"].ToString();
                    String user = usuario["usuario_usuario"].ToString();
                    String carnet = usuario["carnet_usuario"].ToString();
                    Session["rol"] = rol;
                    Session["usuario"] = user;
                    Session["carnet"] = carnet;
                    Response.Redirect("/" + rol + "/" + rol + ".aspx");
                    loginEmail.Text = "";
                    loginPassword.Text = "";
                }
                else
                {
                    Response.Write("<script>window.alert('Datos Erroneos')</script>");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string nombre, usuario, email, password, rpassword, palabra, uno, dos;
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
                            else if (op.insertarUsuario("Usuario", carnet, nombre, hoy, email, telefono, usuario, password, palabra))
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            string email, palabra;
            email = recuperarCorreo.Text;
            palabra = recuperarPalabra.Text;
            if (palabra.Equals("") || email.Equals(""))
            {
                Response.Write("<script>window.alert('Ingrese Datos')</script>");
            }
            else
            {
                String password = op.buscarRecuperar(email, palabra);
                if (password.Equals(""))
                {
                    Response.Write("<script>window.alert('La contraseña es: " + password + "')</script>");
                    recuperarPalabra.Text = "";
                    recuperarCorreo.Text = "";
                }
                else
                {
                    Response.Write("<script>window.alert('Los datos no coinciden')</script>");
                    recuperarPalabra.Text = "";
                    recuperarCorreo.Text = "";
                }
            }
        }
    }
}