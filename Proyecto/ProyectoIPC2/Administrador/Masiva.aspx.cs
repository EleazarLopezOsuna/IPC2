using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Configuration;
using System.Data.OleDb;
using System.IO;
using System.Data;
using ExcelDataReader;
using Librerias;

namespace ProyectoIPC2
{
    public partial class Masiva : System.Web.UI.Page
    {
        DataSet ExcelDataSet = new DataSet();
        String filexName = string.Empty;
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                BindData();
            }
            else
            {

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int contador = 0;
            for (int i = 0; i < GridView1.Rows.Count - 1; i++)
            {
                String[] datos = new string[9];
                for (int j = 0; j < 9; j++)
                {
                    datos[j] = GridView1.Rows[i].Cells[j].Text;
                }
                try
                {
                    double carnet = double.Parse(datos[1]);
                    double telefono = double.Parse(datos[5]);
                    if (op.insertarUsuario(datos[0], carnet, datos[2], datos[3], datos[4], telefono, datos[6], datos[7], datos[8]))
                    {
                        contador++;
                    }
                    else
                    {
                        
                    }
                }
                catch (Exception)
                {
                    
                }
                
            }
            int total = GridView1.Rows.Count;
            Response.Write("<script>window.alert('Datos Leidos: "+total+" \\nDatos Ingresados: "+contador+"')</script>");
        }

    void BindData()
        {
            if (FileUpload1.HasFile)
            {
                String fileName = string.Empty;
                String FilePath = ConfigurationManager.AppSettings["fichero"].ToString();
                try
                {
                    String[] permitidos = { ".xls", ".xlsx" };
                    string FileExt = System.IO.Path.GetExtension(FileUpload1.FileName);
                    bool isValidFile = permitidos.Contains(FileExt);
                    if (!isValidFile)
                    {
                        Response.Write("<script>window.alert('Seleccione Archivo Correcto')</script>");
                    }
                    else
                    {
                        fileName = Path.GetFileName(Server.MapPath(FileUpload1.FileName));
                        FileUpload1.SaveAs(Server.MapPath(FilePath) + fileName);
                        string filePath = Server.MapPath(FilePath) + fileName;
                        OleDbConnection con = null;
                        if (FileExt == ".xls")
                        {
                            con = new OleDbConnection(@"Provider = Microsoft.Jet.OLEDB.4.0; Data Source = " + filePath + "; Extended Properties =\"Excel 8.0;HDR=Yes;IMEX=1\"");
                        }
                        con.Open();
                        DataTable dt = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                        string getExcelSheetName = dt.Rows[0]["Table_Name"].ToString();
                        OleDbCommand ExcelCommand = new OleDbCommand(@"Select * from [" + getExcelSheetName + @"]", con);
                        OleDbDataAdapter ExcelAdapter = new OleDbDataAdapter(ExcelCommand);
                        ExcelAdapter.Fill(ExcelDataSet);
                        con.Close();
                        GridView1.DataSource = ExcelDataSet;
                        GridView1.DataBind();

                    }
                }
                catch (Exception)
                {

                }
            }
            else
            {
                Response.Write("<script>window.alert('Seleccione Archivo')</script>");
            }
        }
    }
}