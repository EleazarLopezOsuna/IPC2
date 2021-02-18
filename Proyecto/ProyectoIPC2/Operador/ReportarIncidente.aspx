<%@ Page Title="" Language="C#" MasterPageFile="~/Operador/Operador.Master" AutoEventWireup="true" CodeBehind="ReportarIncidente.aspx.cs" Inherits="ProyectoIPC2.ReportarIncidente1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None"
        AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
        PageSize="15" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:BoundField DataField="cod_prestamo" HeaderText="Codigo Prestamo" SortExpression="cod_prestamo" />
            <asp:BoundField DataField="cod_insumo" HeaderText="Codigo Insumo" SortExpression="cod_insumo" />
            <asp:BoundField DataField="nombre_insumo" HeaderText="Nombre Insumo" SortExpression="nombre_insumo" />
            <asp:BoundField DataField="carnet_usuario" HeaderText="Carnet Usuario" SortExpression="carnet_usuario" />
            <asp:BoundField DataField="nombre_usuario" HeaderText="Nombre Usuario" SortExpression="nombre_usuario" />
            <asp:BoundField DataField="entregado" HeaderText="Entregado" SortExpression="entregado" />
            <asp:TemplateField HeaderText="Upload">
                <ItemTemplate>
                    <asp:TextBox ID="FileUpload1" runat="server" EnableViewState="true"></asp:TextBox>
                    <asp:Button ID="saveBtn" runat="server"
                        CommandArgument="<%# Container.DataItemIndex%>" CommandName="save"
                        Text="Reportar Incidente" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
