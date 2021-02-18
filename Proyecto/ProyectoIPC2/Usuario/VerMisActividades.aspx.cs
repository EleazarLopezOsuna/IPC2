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
    public partial class VerMisActividades : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("save"))
            {
                try
                {
                    //GridView Row Index
                    int rowIndex = int.Parse(e.CommandArgument.ToString().Trim());
                    TextBox FileUp = (TextBox)GridView1.Rows[rowIndex].FindControl("FileUpload1");
                    string codigo = GridView1.Rows[rowIndex].Cells[0].Text;
                    string carnet = Session["carnet"].ToString();
                    if (op.marcarAsistencia(carnet, codigo))
                    {
                        Response.Write("<script>window.alert('Asistencia Con Exito')</script>");
                        BindData();
                    }
                    else
                    {

                    }
                }
                catch (Exception)
                {
                    Response.Write("<script>window.alert('Asistencia Erronea')</script>");
                }
            }
        }

        protected void BindData()
        {
            SqlDataAdapter data = op.buscarReservacionesCompletas1(Session["carnet"].ToString());
            DataSet ds = new DataSet();
            data.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

    }
}