using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;
using Librerias;

namespace ProyectoIPC2
{
    public partial class Crear : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            TextBox1.Attributes["max"] = "2018-12-31";
            TextBox1.Attributes["value"] = DateTime.Now.ToString("yyyy-MM-dd");
            TextBox2.Attributes["min"] = "07:10";
            TextBox2.Attributes["max"] = "23:00";
            TextBox2.Attributes["value"] = DateTime.Now.ToString("HH:mm");
            TextBox3.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            TextBox3.Attributes["max"] = "2018-12-31";
            TextBox3.Attributes["value"] = DateTime.Now.ToString("yyyy-MM-dd");
            TextBox4.Attributes["min"] = "07:10";
            TextBox4.Attributes["max"] = "23:00";
            TextBox4.Attributes["value"] = DateTime.Now.ToString("HH:mm");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Operaciones op = new Operaciones();
            DateTime fechaInicio = Convert.ToDateTime(TextBox1.Text).Date;
            DateTime fechaFin = Convert.ToDateTime(TextBox3.Text).Date;
            DateTime horaInicio = DateTime.ParseExact(TextBox2.Text, "HH:mm", System.Globalization.CultureInfo.CurrentCulture);
            DateTime horaFin = DateTime.ParseExact(TextBox4.Text, "HH:mm", System.Globalization.CultureInfo.CurrentCulture);
            if (!string.IsNullOrEmpty(carnet.Text))
            {
                if (op.buscarUsuario(carnet.Text,"carnet"))
                {
                    if (fechaFin > fechaInicio)
                    {
                        BindData();
                    }
                    else if (fechaFin == fechaInicio)
                    {
                        var minutes = (horaFin - horaInicio).TotalMinutes;
                        if (minutes >= 45)
                        {
                            BindData();
                        }
                        else
                        {
                            Response.Write("<script>window.alert('La reservacion debe tener 45 minutos como minimo')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>window.alert('La fecha de Fin debe ser mayor a la de Inicio')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>window.alert('Carnet Incorrecto')</script>");
                }
            }
            else
            {
                Response.Write("<script>window.alert('Ingresar Carnet')</script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Operaciones op = new Operaciones();
            DateTime fechaInicio = Convert.ToDateTime(TextBox1.Text);
            DateTime fechaFin = Convert.ToDateTime(TextBox3.Text);
            DateTime horaInicio = DateTime.ParseExact(TextBox2.Text, "HH:mm", System.Globalization.CultureInfo.CurrentCulture);
            DateTime horaFin = DateTime.ParseExact(TextBox4.Text, "HH:mm", System.Globalization.CultureInfo.CurrentCulture);
            int codigo = int.Parse(GridView1.SelectedRow.Cells[0].Text);
            String cadena = string.Concat(codigo.ToString(), carnet.Text);
            crearQR(cadena);
            String path = cadena+".png";
            if (op.agregarReservacion(fechaInicio.ToString("yyyy-MM-dd"), fechaFin.ToString("yyyy-MM-dd"), horaInicio.ToString("HH:mm"), horaFin.ToString("HH:mm"), codigo, carnet.Text, cadena, path))
            {

            }
            else
            {
                
            }
            BindData();
        }

        void BindData()
        {
            Operaciones op = new Operaciones();
            DateTime fechaInicio = Convert.ToDateTime(TextBox1.Text).Date;
            DateTime fechaFin = Convert.ToDateTime(TextBox3.Text).Date;
            DateTime horaInicio = DateTime.ParseExact(TextBox2.Text, "HH:mm", System.Globalization.CultureInfo.CurrentCulture);
            DateTime horaFin = DateTime.ParseExact(TextBox4.Text, "HH:mm", System.Globalization.CultureInfo.CurrentCulture);
            ArrayList salones = op.buscarSalonDisponible(fechaInicio.ToString("yyyy-MM-dd"), fechaFin.ToString("yyyy-MM-dd"), horaInicio.ToString("HH:mm"), horaFin.ToString("HH:mm"));
            SqlDataAdapter datos = op.buscarSalon(salones, true);
            DataTable dt = new DataTable();
            datos.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void crearQR(string codigo)
        {
            string resultado = string.Empty;
            QrEncoder qrEncoder = new QrEncoder(ErrorCorrectionLevel.H);
            QrCode qrCode = new QrCode();
            qrEncoder.TryEncode(codigo, out qrCode);
            GraphicsRenderer renderer = new GraphicsRenderer(new FixedCodeSize(400, QuietZoneModules.Zero), Brushes.DarkOrange, Brushes.White);
            MemoryStream ms = new MemoryStream();
            renderer.WriteToStream(qrCode.Matrix, ImageFormat.Png, ms);
            var imagenTemporal = new Bitmap(ms);
            var imagen = new Bitmap(imagenTemporal, new Size(new Point(300, 300)));
            imagen.Save(Server.MapPath("~/Archivos/Imagenes/" + codigo + ".png"), ImageFormat.Png);
        }
    }
}