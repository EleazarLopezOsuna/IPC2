<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Modificar.aspx.cs" Inherits="ProyectoIPC2.Modificar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <table style="width: 100%;">
        <tr>
            <td style ="width: 35%;">
                <asp:TextBox ID="Busqueda" runat="server" type="email" class="form-control" placeholder="Email" ValidationGroup="Buscar" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="Busqueda" ErrorMessage="Ingrese Email" ValidationGroup="Buscar" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
            <td></td>
            <td>
                <asp:Button ID="Button2" style ="margin-top: -7%;" runat="server" Text="Buscar" class="btn btn-theme btn-block" OnClick="Button2_Click" ValidationGroup="Buscar" CausesValidation="true" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="crearCarnet" runat="server" type="number" class="form-control" placeholder="Carnet" ValidationGroup="registro" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="crearCarnet" ErrorMessage="Ingrese Carnet" ValidationGroup="registro" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
            <td></td>
            <td>
                <asp:TextBox ID="crearNombre" runat="server" type="text" class="form-control" placeholder="Nombre"  ValidationGroup="registro"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="crearNombre" ErrorMessage="Ingrese Nombre" ValidationGroup="registro" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="crearNacimiento" runat="server" type="date" class="form-control"  ValidationGroup="registro"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="crearNacimiento" ErrorMessage="Ingrese Nacimiento" ValidationGroup="registro" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
            <td></td>
            <td>
                <asp:TextBox ID="crearEmail" runat="server" type="email" class="form-control" placeholder="Email"  ValidationGroup="registro"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="crearEmail" ErrorMessage="Ingrese Email" ValidationGroup="registro" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="crearTelefono" runat="server" type="number" class="form-control" placeholder="Telefono"  ValidationGroup="registro"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="crearTelefono" ErrorMessage="Ingrese Telefono" ValidationGroup="registro" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
            <td></td>
            <td>
                <asp:TextBox ID="crearUsuario" runat="server" type="text" class="form-control" placeholder="Usuario"  ValidationGroup="registro"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="crearCarnet" ErrorMessage="Ingrese Usuario" ValidationGroup="registro" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="crearPassword" runat="server" type="password" class="form-control" placeholder="Password"  ValidationGroup="registro"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="crearPassword" ErrorMessage="Ingrese Password" ValidationGroup="registro" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
            <td></td>
            <td>
                <asp:TextBox ID="crearPassword2" runat="server" type="password" class="form-control" placeholder="Repetir Password"  ValidationGroup="registro"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="crearPassword2" ErrorMessage="Ingrese Password" ValidationGroup="registro" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="crearPalabra" runat="server" type="text" class="form-control" placeholder="Palabra Clave"  ValidationGroup="registro"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="crearPalabra" ErrorMessage="Ingrese Palabra Clave" ValidationGroup="registro" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
            <td></td>
            <td>
                <asp:DropDownList ID="crearRol" runat="server" class="form-control"  ValidationGroup="registro">
                    <asp:ListItem>Usuario</asp:ListItem>
                    <asp:ListItem>Administrador</asp:ListItem>
                    <asp:ListItem>Tutor</asp:ListItem>
                    <asp:ListItem>Operador</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="crearRol" ErrorMessage="Ingrese Rol" ValidationGroup="registro" runat="Server">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Modificar" class="btn btn-theme btn-block" OnClick="Button1_Click" ValidationGroup="registro" CausesValidation="true" />
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>
