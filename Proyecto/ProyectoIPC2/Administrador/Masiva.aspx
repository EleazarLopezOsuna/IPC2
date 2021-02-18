<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Masiva.aspx.cs" Inherits="ProyectoIPC2.Masiva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td>
                <asp:Button ID="Button1" style ="margin-top: -7%;" runat="server" Text="Cargar" class="btn btn-theme btn-block" OnClick="Button1_Click" ValidationGroup="Buscar" CausesValidation="true" />
            </td>
            <td>
                <asp:Button ID="Button2" style ="margin-top: -7%;" runat="server" Text="Guardar" class="btn btn-theme btn-block" OnClick="Button2_Click" ValidationGroup="Buscar" CausesValidation="true" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" Width="100%" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"></asp:GridView>
</asp:Content>
