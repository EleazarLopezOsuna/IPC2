<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/Tutor.Master" AutoEventWireup="true" CodeBehind="Tutor.aspx.cs" Inherits="ProyectoIPC2.Tutor1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender"></asp:Calendar>
</asp:Content>