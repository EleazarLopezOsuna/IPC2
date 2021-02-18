<%@ Page Title="" Language="C#" MasterPageFile="~/Operador/Operador.Master" AutoEventWireup="true" CodeBehind="CrearReservacion.aspx.cs" Inherits="ProyectoIPC2.Crear" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Fecha y Hora de Inicio"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" type="date"></asp:TextBox>
                <asp:TextBox ID="TextBox2" runat="server" type="time"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Fecha y Hora de Fin"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" type="date"></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server" type="time"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="carnet" runat="server" type="number" placeholder="Carnet"></asp:TextBox>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" PostBackMode = "Conditional">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None"
        AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
        PageSize="15" OnPageIndexChanging="GridView1_PageIndexChanging"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="cod_salon" HeaderText="Codigo" SortExpression="cod_salon" />
                    <asp:BoundField DataField="edificio" HeaderText="Edificio" SortExpression="edificio" />
                    <asp:BoundField DataField="numero_salon" HeaderText="Numero de Salon" SortExpression="numero_salon" />
                    <asp:CommandField ShowSelectButton="True" SelectText="Reservar" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
