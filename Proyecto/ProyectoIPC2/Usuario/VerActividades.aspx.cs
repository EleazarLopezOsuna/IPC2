using Librerias;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIPC2
{
    public partial class VerActividades : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String carnet = Session["carnet"].ToString();
            int index = int.Parse(e.CommandArgument.ToString().Trim());
            String codReservacion = GridView1.Rows[index].Cells[0].Text;
            if (op.crearMatriculacion(carnet, codReservacion))
            {
                Response.Write("<script>window.alert('Matriculado con Exito')</script>");
            }
            else
            {
                Response.Write("<script>window.alert('Error al Matricular')</script>");
            }
            BindData();
        }

        protected void BindData()
        {
            SqlDataAdapter data = op.buscarReservacionesCompletas();
            DataSet ds = new DataSet();
            data.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}