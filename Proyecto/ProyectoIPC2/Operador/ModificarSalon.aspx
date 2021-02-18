<%@ Page Title="" Language="C#" MasterPageFile="~/Operador/Operador.Master" AutoEventWireup="true" CodeBehind="ModificarSalon.aspx.cs" Inherits="ProyectoIPC2.ModificarSalon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:DropDownList ID="Edificios" runat="server" OnSelectedIndexChanged="Edificios_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="Salones" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Salones_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    
                </asp:DropDownList>
                <asp:TextBox ID="TextBox1" runat="server" class="form-control" Visible ="false"></asp:TextBox>
                <asp:TextBox ID="TextBox2" runat="server" class="form-control" Visible ="false"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Button"  class="btn btn-theme btn-block" OnClick="Button1_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>
