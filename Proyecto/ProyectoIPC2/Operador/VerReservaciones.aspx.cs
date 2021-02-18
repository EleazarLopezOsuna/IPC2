using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Librerias;

namespace ProyectoIPC2
{
    public partial class Ver1 : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BindData()
        {
            SqlDataAdapter data = op.getReservacion();
            DataSet ds = new DataSet();
            data.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            int codigo = int.Parse(GridView1.Rows[index].Cells[0].Text);
            if (op.eliminarReservacion(codigo, "codigo"))
            {
                Response.Write("<script>window.alert('Reservacion Eliminada')</script>");
                BindData();
            }
            else
            {
                Response.Write("<script>window.alert('Error al Eliminar')</script>");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String fileName = string.Empty;
            String FilePath = ConfigurationManager.AppSettings["cartas"].ToString();
            if (e.CommandName.Equals("save"))
            {
                try
                {
                    //GridView Row Index
                    int rowIndex = int.Parse(e.CommandArgument.ToString().Trim());
                    FileUpload FileUp = (FileUpload)GridView1.Rows[rowIndex].FindControl("FileUpload1");
                    string codigo = GridView1.Rows[rowIndex].Cells[0].Text;
                    string carnet = GridView1.Rows[rowIndex].Cells[7].Text;
                    string extension = Path.GetExtension(FileUp.FileName);
                    fileName = string.Concat(fileName, codigo, carnet, extension);
                    FileUp.SaveAs(Server.MapPath(FilePath) + fileName);
                    if (op.updateCarta(codigo,fileName))
                    {
                        Response.Write("<script>window.alert('Carta Cargada Con Exito')</script>");
                        BindData();
                    }
                    else
                    {

                    }
                }
                catch (Exception)
                {
                    Response.Write("<script>window.alert('Error al Cargar la Carta')</script>");
                }
            }
        }
    }
}