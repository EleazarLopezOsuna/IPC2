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
    public partial class ReportarIncidente1 : System.Web.UI.Page
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
                    string codigoPrestamo = GridView1.Rows[rowIndex].Cells[0].Text;
                    string codigoInsumo = GridView1.Rows[rowIndex].Cells[1].Text;
                    string carnet = GridView1.Rows[rowIndex].Cells[3].Text;
                    string motivo = FileUp.Text;
                    if (op.agregarIncidente(codigoPrestamo, codigoInsumo, carnet, motivo))
                    {
                        Response.Write("<script>window.alert('Incidente Reportado')</script>");
                        BindData();
                    }
                    else
                    {

                    }
                }
                catch (Exception)
                {
                    Response.Write("<script>window.alert('Error')</script>");
                }
            }
        }

        protected void BindData()
        {
            SqlDataAdapter data = op.buscarPrestamos();
            DataSet ds = new DataSet();
            data.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}