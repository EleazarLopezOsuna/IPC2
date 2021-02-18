<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="VerIncidentes.aspx.cs" Inherits="ProyectoIPC2.VerIncidentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None"
        AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
        PageSize="15" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:BoundField DataField="cod_incidente" HeaderText="Codigo Incidente" SortExpression="cod_incidente" />
            <asp:BoundField DataField="estado_incidente" HeaderText="Estado Incidente" SortExpression="estado_incidente" />
            <asp:BoundField DataField="descripcion_incidente" HeaderText="Descripcion Incidente" SortExpression="descripcion_incidente" />
            <asp:BoundField DataField="cod_prestamo" HeaderText="Codigo Prestamo" SortExpression="cod_prestamo" />
            <asp:BoundField DataField="cod_insumo" HeaderText="Codigo Insumo" SortExpression="cod_insumo" />
            <asp:BoundField DataField="carnet_usuario" HeaderText="Carnet" SortExpression="carnet_usuario" />
        </Columns>
    </asp:GridView>
</asp:Content>
