<%@ Page Title="Carga Individual" Language="C#" MasterPageFile="~/Operador/Operador.Master" AutoEventWireup="true" CodeBehind="Individual.aspx.cs" Inherits="ProyectoIPC2.Individual1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br>
    <asp:TextBox ID="crearCarnet" runat="server" type="number" class="form-control" placeholder="Carnet" ValidationGroup="registro" style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="crearCarnet" ErrorMessage="Ingrese Carnet" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="crearNombre" runat="server" type="text" class="form-control" placeholder="Nombre" style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="crearNombre" ErrorMessage="Ingrese Nombre" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="crearNacimiento" runat="server" type="date" class="form-control" style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="crearNacimiento" ErrorMessage="Ingrese Nacimiento" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="crearEmail" runat="server" type="email" class="form-control" placeholder="Email" style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="crearEmail" ErrorMessage="Ingrese Email" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="crearTelefono" runat="server" type="number" class="form-control" placeholder="Telefono" style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="crearTelefono" ErrorMessage="Ingrese Telefono" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="crearUsuario" runat="server" type="text" class="form-control" placeholder="Usuario" style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="crearCarnet" ErrorMessage="Ingrese Usuario" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="crearPassword" runat="server" type="password" class="form-control" placeholder="Password" style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="crearPassword" ErrorMessage="Ingrese Password" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="crearPassword2" runat="server" type="password" class="form-control" placeholder="Repetir Password" style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="crearPassword2" ErrorMessage="Ingrese Password" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="crearPalabra" runat="server" type="text" class="form-control" placeholder="Palabra Clave" style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="crearPalabra" ErrorMessage="Ingrese Palabra Clave" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:DropDownList ID="crearRol" runat="server" class="form-control" style="height: 29px;">
        <asp:ListItem>Usuario</asp:ListItem>
        <asp:ListItem>Tutor</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="crearRol" ErrorMessage="Ingrese Rol" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:Button ID="Button1" runat="server" Text="Ingresar" class="btn btn-theme btn-block" OnClick="Button1_Click" ValidationGroup="registro" CausesValidation="true" />
</asp:Content>
