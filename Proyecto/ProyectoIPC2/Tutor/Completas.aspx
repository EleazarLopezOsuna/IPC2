<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/Tutor.Master" AutoEventWireup="true" EnableEventValidation="true" CodeBehind="Completas.aspx.cs" Inherits="ProyectoIPC2.Completas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None"
        AllowPaging="True" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
        PageSize="15" OnRowCommand="GridView1_RowCommand">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="cod_reservacion" HeaderText="Codigo Reservacion" SortExpression="cod_reservacion" />
            <asp:BoundField DataField="fecha_inicio_reservacion" HeaderText="Fecha Inicio" SortExpression="fecha_inicio_reservacion" />
            <asp:BoundField DataField="hora_inicio_reservacion" HeaderText="Hora Inicio" SortExpression="hora_inicio_reservacion" />
            <asp:BoundField DataField="fecha_fin_reservacion" HeaderText="Fecha Fin" SortExpression="fecha_fin_reservacion" />
            <asp:BoundField DataField="hora_fin_reservacion" HeaderText="Hora Fin" SortExpression="hora_fin_reservacion" />
            <asp:BoundField DataField="numero_salon" HeaderText="Salon" SortExpression="numero_salon" />
            <asp:BoundField DataField="edificio" HeaderText="Edificio" SortExpression="edificio" />
            <asp:CommandField SelectText="Descargar QR" ShowSelectButton="True"></asp:CommandField>
            <asp:TemplateField HeaderText="Upload">
                <ItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" EnableViewState="true" widht="20%" Font-Size="Smaller" />
                    <asp:Button ID="saveBtn" runat="server"
                        CommandArgument="<%# Container.DataItemIndex%>" CommandName="save"
                        Text="OK" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Upload">
                <ItemTemplate>
                    <asp:Button ID="saveBtn1" runat="server"
                        CommandArgument="<%# Container.DataItemIndex%>" CommandName="crear"
                        Text="Crear Cuestionario" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>
    </asp:GridView>
</asp:Content>
