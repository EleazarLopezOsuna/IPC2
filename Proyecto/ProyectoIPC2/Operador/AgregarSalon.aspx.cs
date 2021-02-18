using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Librerias;

namespace ProyectoIPC2
{
    public partial class AgregarSalon : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string edificio = Edificio.Text;
            string salon = Salon.Text;
            if (op.agregarSalon(edificio, salon))
            {
                Response.Write("<script>window.alert('Salon Agregado')</script>");
            }
            else
            {
                Response.Write("<script>window.alert('Error al Agregar')</script>");
            }
        }
    }
}