using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Librerias;
using System.Data.SqlClient;
using System.Data;

namespace ProyectoIPC2
{
    public partial class Ver : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }

        void BindData()
        {
            string cadena = (string)(Busqueda.Text);
            string campo = (string)(Tipo.SelectedValue);
            SqlDataAdapter datos = op.verUsuario(cadena, campo);
            DataTable dt = new DataTable();
            datos.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}