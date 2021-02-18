using Librerias;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoIPC2
{
    public partial class Tutor1 : System.Web.UI.Page
    {
        private Hashtable _sheduleData;
        Operaciones op = new Operaciones();

        protected void Page_Load(object sender, EventArgs e)
        {
            _sheduleData = GetSchedule();
            Calendar1.Caption = "Agenda";
            Calendar1.FirstDayOfWeek = FirstDayOfWeek.Sunday;
            Calendar1.NextPrevFormat = NextPrevFormat.ShortMonth;
            Calendar1.TitleFormat = TitleFormat.MonthYear;
            Calendar1.ShowGridLines = true;
            Calendar1.DayStyle.HorizontalAlign = HorizontalAlign.Left;
            Calendar1.DayStyle.VerticalAlign = VerticalAlign.Top;
            Calendar1.DayStyle.Height = new Unit(75);
            Calendar1.DayStyle.Width = new Unit(100);
            Calendar1.OtherMonthDayStyle.BackColor = System.Drawing.Color.Cornsilk;
        }

        private Hashtable GetSchedule()
        {
            Hashtable schedule = new Hashtable();
            ArrayList fechas = op.agendaTutor(Session["carnet"].ToString());
            foreach (String v in fechas)
            {
                int contador = 1;
                schedule["" + v + ""] = "Actividad"+ contador;
                contador++;
            }
            return schedule;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (_sheduleData[e.Day.Date.ToShortDateString()] != null)
            {
                Literal lit = new Literal();
                lit.Text = "<br/>";
                e.Cell.Controls.Add(lit);
                Label lbl = new Label();
                lbl.Text = (string)_sheduleData[e.Day.Date.ToShortDateString()];
                lbl.Font.Size = new FontUnit(FontSize.Small);
                lbl.ForeColor = System.Drawing.Color.Blue;
                e.Cell.Controls.Add(lbl);
            }
        }
    }
}