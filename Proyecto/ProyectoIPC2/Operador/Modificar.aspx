<%@ Page Title="" Language="C#" MasterPageFile="~/Operador/Operador.Master" AutoEventWireup="true" CodeBehind="Modificar.aspx.cs" Inherits="ProyectoIPC2.Modificar1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <table style="width: 100%;">
        <tr>
            <td style="width: 35%;">
                <asp:TextBox ID="Busqueda" runat="server" type="number" class="form-control" placeholder="Codigo" ValidationGroup="Buscar"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="Busqueda" ErrorMessage="Ingrese Codigo" ValidationGroup="Buscar" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
            <td></td>
            <td>
                <asp:Button ID="Button2" Style="margin-top: -7%;" runat="server" Text="Buscar" class="btn btn-theme btn-block" OnClick="Button2_Click" ValidationGroup="Buscar" CausesValidation="true" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Fecha y Hora de Inicio"></asp:Label>
                <asp:TextBox ID="fechaInicio" runat="server" type="date"></asp:TextBox>
                <asp:TextBox ID="horaInicio" runat="server" type="time"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Fecha y Hora de Fin"></asp:Label>
                <asp:TextBox ID="fechaFin" runat="server" type="date"></asp:TextBox>
                <asp:TextBox ID="horaFin" runat="server" type="time"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" class="btn btn-theme btn-block"/>
            </td>
        </tr>
    </table>
</asp:Content>
