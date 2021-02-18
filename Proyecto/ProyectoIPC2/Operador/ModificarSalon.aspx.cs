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
    public partial class ModificarSalon : System.Web.UI.Page
    {
        Operaciones op = new Operaciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEdificios();
                DropDownList1.Items.Add("Sin Mantenimiento");
                DropDownList1.Items.Add("Con Mantenimiento");
            }
        }

        protected void CargarEdificios()
        {
            ArrayList ed = op.buscarEdificio();
            if (ed[0] != null)
            {
                for (int i = 0; i < ed.Count; i++)
                {
                    Edificios.Items.Add(ed[i].ToString());
                }
                Edificios.SelectedIndex = 0;
                CargarSalones();
            }
        }

        protected void CargarSalones()
        {
            ArrayList sa = op.buscarSalones(Edificios.SelectedItem.Text);
            if (sa[0] != null)
            {
                for (int i = 0; i < sa.Count; i++)
                {
                    Salones.Items.Add(sa[i].ToString());
                }
                Salones.SelectedIndex = 0;
                BindData(Edificios.SelectedItem.Text, Salones.SelectedItem.Text);
            }
        }

        protected void Edificios_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarSalones();
        }

        protected void BindData(string edificio, string salon)
        {
            ArrayList reader = op.buscarEdificio(edificio, salon);
            DropDownList1.SelectedValue = reader[0].ToString();
            TextBox1.Text = reader[1].ToString();
            TextBox2.Text = reader[2].ToString();
        }

        protected void Salones_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData(Edificios.SelectedItem.Text, Salones.SelectedItem.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (op.updateSalon(TextBox1.Text, TextBox2.Text, DropDownList1.SelectedValue))
            {
                Response.Write("<script>window.alert('Salon Modificado')</script>");
            }
            else
            {
                Response.Write("<script>window.alert('Error al Modificar')</script>");
            }
        }
    }
}