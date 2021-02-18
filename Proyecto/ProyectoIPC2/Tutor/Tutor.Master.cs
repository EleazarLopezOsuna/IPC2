using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIPC2
{
    public partial class Tutor : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["rol"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (!Session["rol"].ToString().Equals("Tutor"))
            {
                string rol = Session["rol"].ToString();
                Response.Redirect(rol + ".aspx");
            }
            Usuario.Text = (string)(Session["usuario"]);
        }
        protected void Salir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Response.Redirect("../Login.aspx");
        }
    }
}