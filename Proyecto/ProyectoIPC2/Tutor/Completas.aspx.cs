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
    public partial class Completas : System.Web.UI.Page
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
                String fileName = string.Empty;
                String FilePath = ConfigurationManager.AppSettings["presentacion"].ToString();
                try
                {
                    //GridView Row Index
                    int rowIndex = int.Parse(e.CommandArgument.ToString().Trim());
                    FileUpload FileUp = (FileUpload)GridView1.Rows[rowIndex].FindControl("FileUpload1");
                    string codigo = GridView1.Rows[rowIndex].Cells[0].Text;
                    string carnet = Session["carnet"].ToString();
                    string extension = Path.GetExtension(FileUp.FileName);
                    fileName = string.Concat(fileName, codigo, carnet, extension);
                    FileUp.SaveAs(Server.MapPath(FilePath) + fileName);
                    Response.Write("<script>window.alert('Presentacion Cargada Con Exito')</script>");
                }
                catch (Exception)
                {
                    Response.Write("<script>window.alert('Error al Cargar la Presentacion')</script>");
                }
            }
            else if (e.CommandName.Equals("crear"))
            {
                int rowIndex = int.Parse(e.CommandArgument.ToString().Trim());
                string codigo = GridView1.Rows[rowIndex].Cells[0].Text;
                Session["actividad"] = codigo;
                Response.Redirect("/Tutor/CrearCuestionario.aspx");
            }
            else
            {
                int index = int.Parse(e.CommandArgument.ToString().Trim());
                String FilePath = ConfigurationManager.AppSettings["imagenes"].ToString();
                string nombre = string.Concat(GridView1.Rows[index].Cells[0].Text, Session["carnet"].ToString());
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("content-disposition", "attatchment;filename=" + nombre + ".png");
                Response.TransmitFile(FilePath + nombre + ".png");
                Response.End();
            }
        }

        protected void BindData()
        {
            SqlDataAdapter data = op.buscarReservacionesCompletas(Session["carnet"].ToString());
            DataSet ds = new DataSet();
            data.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}