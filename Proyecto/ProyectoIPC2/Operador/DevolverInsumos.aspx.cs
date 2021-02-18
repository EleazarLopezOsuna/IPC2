using Librerias;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIPC2
{
    public partial class DevolverInsumos1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Operaciones op = new Operaciones();
            string codigo, carnet;
            codigo = codInsumo.Text;
            carnet = carnetUsuario.Text;
            if (op.buscarUsuario(carnet, "carnet"))
            {
                if (op.devolverPrestamo(codigo, carnet))
                {
                    Response.Write("<script>window.alert('Prestamo Devuelto')</script>");
                }
                else
                {
                    Response.Write("<script>window.alert('Error al devolver Prestamo')</script>");
                }
            }
            else
            {
                Response.Write("<script>window.alert('El Usuario no Existe')</script>");
            }
        }
    }
}