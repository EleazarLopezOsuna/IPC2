using Librerias;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIPC2
{
    public partial class VerIncidentes1 : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            SqlDataAdapter data = op.buscarIncidentes("Pendiente");
            DataSet ds = new DataSet();
            data.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            int codigo = int.Parse(GridView1.Rows[index].Cells[0].Text);
            if (op.resolverIncidentePrestamo(codigo.ToString()))
            {
                Response.Write("<script>window.alert('Incidente Resuelto')</script>");
                BindData();
            }
            else
            {
                Response.Write("<script>window.alert('Incidente No Resuelto')</script>");
            }
        }
    }
}