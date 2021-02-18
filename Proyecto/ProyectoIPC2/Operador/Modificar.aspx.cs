using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Librerias;

namespace ProyectoIPC2
{
    public partial class Modificar1 : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        SqlDataReader reader = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Bloquear();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string busqueda = (string)(Busqueda.Text);
            if (busqueda.Equals(""))
            {
                Response.Write("<script>window.alert('Ingrese todos los campos')</script>");
            }
            else
            {
                reader = op.buscarReservacion(busqueda);
                if (reader != null)
                {
                    Desbloquear();
                    DateTime fI = Convert.ToDateTime(reader["fecha_inicio_reservacion"].ToString());
                    fechaInicio.Attributes["value"] = fI.ToString("yyyy-MM-dd");
                    DateTime fF = Convert.ToDateTime(reader["fecha_fin_reservacion"].ToString());
                    fechaFin.Attributes["value"] = fF.ToString("yyyy-MM-dd");
                    DateTime hI = Convert.ToDateTime(reader["hora_inicio_reservacion"].ToString());
                    horaInicio.Attributes["value"] = hI.ToString("HH:mm");
                    DateTime hF = Convert.ToDateTime(reader["hora_fin_reservacion"].ToString());
                    horaFin.Attributes["value"] = hF.ToString("HH:mm");
                }
                else
                {
                    Response.Write("<script>window.alert('No se encontraron los datos')</script>");
                }
            }
        }

        void Bloquear()
        {
            fechaInicio.Enabled = false;
            fechaFin.Enabled = false;
            horaInicio.Enabled = false;
            horaFin.Enabled = false;
            Button1.Enabled = false;
            fechaInicio.CssClass = "form-control";
            fechaFin.CssClass = "form-control";
            horaInicio.CssClass = "form-control";
            horaFin.CssClass = "form-control";
            Button1.CssClass = "btn btn-theme btn-block";
        }

        void Desbloquear()
        {
            fechaInicio.Enabled = true;
            fechaFin.Enabled = true;
            horaInicio.Enabled = true;
            horaFin.Enabled = true;
            Button1.Enabled = true;
            fechaInicio.CssClass = "form-control";
            fechaFin.CssClass = "form-control";
            horaInicio.CssClass = "form-control";
            horaFin.CssClass = "form-control";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime fI = Convert.ToDateTime(fechaInicio.Text).Date;
            DateTime fF = Convert.ToDateTime(fechaFin.Text).Date;
            DateTime hI = DateTime.ParseExact(horaInicio.Text, "HH:mm", System.Globalization.CultureInfo.CurrentCulture);
            DateTime hF = DateTime.ParseExact(horaFin.Text, "HH:mm", System.Globalization.CultureInfo.CurrentCulture);
            if (op.updateReserva(reader["cod_reservacion"].ToString(), fI.ToString("yyyy-MM-dd"), fF.ToString("yyyy-MM-dd"), hI.ToString("HH:mm"), hF.ToString("HH:mm")))
            {
                Response.Write("<script>window.alert('Reserva Modificada')</script>");
            }
            else
            {
                Response.Write("<script>window.alert('Error al modificar')</script>");
            }
        }
    }
}