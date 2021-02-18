<%@ Page Title="" Language="C#" MasterPageFile="~/Operador/Operador.Master" AutoEventWireup="true" CodeBehind="VerReservacion.aspx.cs" Inherits="ProyectoIPC2.VerReservacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:DropDownList ID="Edificios" runat="server" OnSelectedIndexChanged = "Edificios_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="Salones" runat="server" AutoPostBack="True" OnSelectedIndexChanged = "Salones_SelectedIndexChanged"></asp:DropDownList>
            </td>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None"
        AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
        PageSize="15">
        <Columns>
            <asp:BoundField DataField="fecha_inicio_reservacion" HeaderText="Fecha Inicio" SortExpression="fecha_inicio_reservacion" />
            <asp:BoundField DataField="hora_inicio_reservacion" HeaderText="Hora Inicio" SortExpression="hora_inicio_reservacion" />
            <asp:BoundField DataField="fecha_fin_reservacion" HeaderText="Fecha Fin" SortExpression="fecha_fin_reservacion" />
            <asp:BoundField DataField="hora_fin_reservacion" HeaderText="Hora Fin" SortExpression="hora_fin_reservacion" />
            <asp:BoundField DataField="estado_reservacion" HeaderText="Estado" SortExpression="estado_reservacion" />
            <asp:BoundField DataField="nombre_usuario" HeaderText="Reservador" SortExpression="nombre_usuario" />
        </Columns>
    </asp:GridView>
</asp:Content>
