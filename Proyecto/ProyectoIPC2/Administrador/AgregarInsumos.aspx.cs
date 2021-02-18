using Librerias;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIPC2
{
    public partial class AgregarInsumos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Operaciones op = new Operaciones();
            string codigo, nombre, tipo, descripcion;
            codigo = codInsumo.Text;
            nombre = nombreInsumo.Text;
            tipo = tipoInsumo.Text;
            descripcion = descripcionInsumo.Text;
            if (op.agregarInsumo(codigo, nombre, tipo, descripcion))
            {
                Response.Write("<script>window.alert('Insumo Creado')</script>");
            }
            else
            {
                Response.Write("<script>window.alert('Error al crear Insumo')</script>");
            }
        }
    }
}