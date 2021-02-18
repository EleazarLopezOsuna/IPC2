<%@ Page Title="" Language="C#" MasterPageFile="~/Operador/Operador.Master" EnableEventValidation="true"  AutoEventWireup="true" CodeBehind="VerReservaciones.aspx.cs" Inherits="ProyectoIPC2.Ver1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None"
        AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
        PageSize="15" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting" OnRowCommand= "GridView1_RowCommand">
        <Columns>
            <asp:BoundField DataField="cod_reservacion" HeaderText="Codigo Reservacion" SortExpression="cod_reservacion" />
            <asp:BoundField DataField="fecha_inicio_reservacion" HeaderText="Fecha Inicio" SortExpression="fecha_inicio_reservacion" />
            <asp:BoundField DataField="hora_inicio_reservacion" HeaderText="Hora Inicio" SortExpression="hora_inicio_reservacion" />
            <asp:BoundField DataField="fecha_fin_reservacion" HeaderText="Fecha Fin" SortExpression="fecha_fin_reservacion" />
            <asp:BoundField DataField="hora_fin_reservacion" HeaderText="Hora Fin" SortExpression="hora_fin_reservacion" />
            <asp:BoundField DataField="estado_reservacion" HeaderText="Estado" SortExpression="estado_reservacion" />
            <asp:BoundField DataField="urlCarta" HeaderText="Carta" SortExpression="urlCarta" />
            <asp:BoundField DataField="carnet_usuario" HeaderText="Carnet Reservador" SortExpression="carnet_usuario" />
            <asp:CommandField ShowDeleteButton="True" SelectText="Eliminar" />
            <asp:TemplateField HeaderText="Upload">
                    <ItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" EnableViewState="true" widht="20%" Font-Size="Smaller" />
                        <asp:Button ID="saveBtn" runat="server"
                            CommandArgument="<%# Container.DataItemIndex%>" CommandName="save"
                            Text="OK"/>
                    </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
</asp:Content>
