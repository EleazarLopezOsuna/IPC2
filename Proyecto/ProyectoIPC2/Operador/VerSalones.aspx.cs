using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Librerias;

namespace ProyectoIPC2
{
    public partial class VerSalones : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            int codigo = int.Parse(GridView1.Rows[index].Cells[0].Text);
            if (op.eliminarSalon(codigo))
            {
                Response.Write("<script>window.alert('Salon Eliminado')</script>");
                BindData();
            }
            else
            {
                Response.Write("<script>window.alert('Error al Eliminar')</script>");
            }
        }

        protected void BindData()
        {
            SqlDataAdapter data = op.buscarSalones();
            DataSet ds = new DataSet();
            data.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}