<%@ Page Title="Administrador" Language="C#" MasterPageFile="~/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="ProyectoIPC2.Administrador1" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender"></asp:Calendar>
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Fecha de Inicio"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" type="date"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Fecha de Fin"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" type="date"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>