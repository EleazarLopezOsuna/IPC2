<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="AgregarInsumos.aspx.cs" Inherits="ProyectoIPC2.AgregarInsumos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br>
    <asp:TextBox ID="codInsumo" runat="server" type="text" class="form-control" placeholder="Codigo" ValidationGroup="registro" Style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="codInsumo" ErrorMessage="Ingrese Codigo" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="nombreInsumo" runat="server" type="text" class="form-control" placeholder="Nombre" Style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="nombreInsumo" ErrorMessage="Ingrese Nombre" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="tipoInsumo" runat="server" type="text" class="form-control" Style="height: 29px;" placeholder="Tipo"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tipoInsumo" ErrorMessage="Ingrese Tipo" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="descripcionInsumo" runat="server" type="text" class="form-control" placeholder="Descripcion" Style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="descripcionInsumo" ErrorMessage="Ingrese Descripcion" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:Button ID="Button1" runat="server" Text="Ingresar" class="btn btn-theme btn-block" OnClick="Button1_Click" ValidationGroup="registro" CausesValidation="true" />
</asp:Content>
