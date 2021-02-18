<%@ Page Title="" Language="C#" MasterPageFile="~/Operador/Operador.Master" AutoEventWireup="true" CodeBehind="VerSalones.aspx.cs" Inherits="ProyectoIPC2.VerSalones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None"
         CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" OnRowDeleting="GridView1_RowDeleting">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="cod_salon" HeaderText="Codigo" SortExpression="cod_salon" />
            <asp:BoundField DataField="edificio" HeaderText="Edificio" SortExpression="edificio" />
            <asp:BoundField DataField="numero_salon" HeaderText="Salon" SortExpression="numero_salon" />
            <asp:BoundField DataField="estado_salon" HeaderText="Estado" SortExpression="estado_salon" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
<PagerStyle CssClass="pgr"></PagerStyle>
    </asp:GridView>
</asp:Content>
