<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="DevolverInsumos.aspx.cs" Inherits="ProyectoIPC2.DevolverInsumos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br>
    <asp:TextBox ID="codInsumo" runat="server" type="text" class="form-control" placeholder="Codigo" ValidationGroup="registro" Style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="codInsumo" ErrorMessage="Ingrese Codigo" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:TextBox ID="carnetUsuario" runat="server" type="text" class="form-control" placeholder="Nombre" Style="height: 29px;"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="carnetUsuario" ErrorMessage="Ingrese Carnet" ValidationGroup="registro" runat="Server">
    </asp:RequiredFieldValidator>
    <asp:Button ID="Button1" runat="server" Text="Ingresar" class="btn btn-theme btn-block" OnClick="Button1_Click" ValidationGroup="registro" CausesValidation="true" />
</asp:Content>
