<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario/Usuario.Master" AutoEventWireup="true" CodeBehind="VerActividades.aspx.cs" Inherits="ProyectoIPC2.VerActividades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None"
        AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
        PageSize="15" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:BoundField DataField="cod_reservacion" HeaderText="Codigo Reservacion" SortExpression="cod_reservacion" />
            <asp:BoundField DataField="fecha_inicio_reservacion" HeaderText="Fecha Inicio" SortExpression="fecha_inicio_reservacion" />
            <asp:BoundField DataField="hora_inicio_reservacion" HeaderText="Hora Inicio" SortExpression="hora_inicio_reservacion" />
            <asp:BoundField DataField="fecha_fin_reservacion" HeaderText="Fecha Fin" SortExpression="fecha_fin_reservacion" />
            <asp:BoundField DataField="hora_fin_reservacion" HeaderText="Hora Fin" SortExpression="hora_fin_reservacion" />
            <asp:BoundField DataField="numero_salon" HeaderText="Salon" SortExpression="numero_salon" />
            <asp:BoundField DataField="edificio" HeaderText="Edificio" SortExpression="edificio" />
            <asp:CommandField SelectText="Matricularme" ShowSelectButton="True"></asp:CommandField>
        </Columns>
    </asp:GridView>
</asp:Content>
