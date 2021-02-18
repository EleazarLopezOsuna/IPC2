<%@ Page Title="" Language="C#" MasterPageFile="~/Operador/Operador.Master" AutoEventWireup="true" CodeBehind="AgregarSalon.aspx.cs" Inherits="ProyectoIPC2.AgregarSalon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:TextBox ID="Edificio" runat="server" class="form-control" placeholder="Edificio" ValidationGroup="guardar"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="Salon" runat="server" class="form-control" placeholder="Salon" type="number" ValidationGroup="guardar"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Guardar" ValidationGroup="guardar" CausesValidation="true" OnClick="Button1_Click" />
            </td>
            <td></td>
        </tr>
    </table>

</asp:Content>
