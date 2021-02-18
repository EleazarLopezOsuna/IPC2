<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Ver.aspx.cs" Inherits="ProyectoIPC2.Ver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <table style="width: 100%;">
        <tr>
            <td style="width: 35%;">
                <asp:TextBox ID="Busqueda" runat="server" type="text" class="form-control" placeholder="Datos"></asp:TextBox>
            </td>
            <td>
                <asp:DropDownList ID="Tipo" runat="server" class="form-control">
                    <asp:ListItem>Nombre</asp:ListItem>
                    <asp:ListItem>Rol</asp:ListItem>
                    <asp:ListItem>Carnet</asp:ListItem>
                    <asp:ListItem>Email</asp:ListItem>
                    <asp:ListItem>Usuario</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Buscar" class="btn btn-theme btn-block" OnClick="Button2_Click" ValidationGroup="Buscar" CausesValidation="true" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" GridLines="None"
        AllowPaging="true" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
        PageSize="15" OnPageIndexChanging="GridView1_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="rol_usuario" HeaderText="Rol" SortExpression="rol_usuario" />
            <asp:BoundField DataField="carnet_usuario" HeaderText="Carnet" SortExpression="carnet_usuario" />
            <asp:BoundField DataField="nombre_usuario" HeaderText="Nombre" SortExpression="nombre_usuario" />
            <asp:BoundField DataField="email_usuario" HeaderText="Email" SortExpression="email_usuario" />
            <asp:BoundField DataField="telefono_usuario" HeaderText="Telefono" SortExpression="telefono_usuario" />
            <asp:BoundField DataField="usuario_usuario" HeaderText="Usuario" SortExpression="usuario_usuario" />
        </Columns>
    </asp:GridView>
</asp:Content>
