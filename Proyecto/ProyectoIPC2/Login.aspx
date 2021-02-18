<%@ Page Title="Login - ECYS" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoIPC2.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <div id="login-page">
        <div class="form-login">
            <!-- INGRESO -->
            <h2 class="form-login-heading">Inicia Sesión Ahora</h2>
            <div class="login-wrap">
                <asp:TextBox ID="loginEmail" runat="server" type="email" class="form-control" placeholder="Correo" ValidationGroup="login"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="loginEmail" ErrorMessage="Ingrese Correo" ValidationGroup="login" runat="Server">
                </asp:RequiredFieldValidator>
                <br>
                <asp:TextBox ID="loginPassword" runat="server" type="password" class="form-control" placeholder="Password" ValidationGroup="login"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="loginPassword" ErrorMessage="Ingrese Correo" ValidationGroup="login" runat="Server">
                </asp:RequiredFieldValidator>
                <br>
                <asp:Button ID="Button1" runat="server" Text="Ingresar" class="btn btn-theme btn-block" OnClick="Button1_Click" ValidationGroup="login" CausesValidation="true" />
                <label class="checkbox">
                    <span class="pull-right">
                        <a data-toggle="modal" href="#myModal">¿Olvidaste tu contraseña?</a>

                    </span>
                    <br />
                </label>
                <hr>


                <div class="registration">
                    ¿Aún no tienes una cuenta?<br />
                    <a data-toggle="modal" href="#myModal2">Crear cuenta
                    </a>
                </div>

            </div>
            <!-- RECUPERAR -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">¿Olvidaste tu contraseña?</h4>
                        </div>
                        <div class="modal-body">
                            <p>Ingresa tu correo y palabra clave para ver tu contraseña</p>
                            <asp:TextBox ID="recuperarCorreo" runat="server" type="email" class="form-control" placeholder="Correo" ValidationGroup="recuperar"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="recuperarCorreo" ErrorMessage="Ingrese Correo" ValidationGroup="recuperar" runat="Server">
                            </asp:RequiredFieldValidator>
                            <asp:TextBox ID="recuperarPalabra" runat="server" type="text" class="form-control" placeholder="Palabra Clave" ValidationGroup="recuperar"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="recuperarPalabra" ErrorMessage="Ingrese Palabra Clave" ValidationGroup="recuperar" runat="Server">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancelar</button>
                            <asp:Button ID="Button3" runat="server" Text="Recuperar" class="btn btn-theme" OnClick="Button3_Click" ValidationGroup="recuperar" CausesValidation="true" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- REGISTRO -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal2" class="modal fade" style="margin-top: -70px;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">¡Registrate ahora!</h4>
                        </div>
                        <div class="login-wrap">
                            <asp:TextBox ID="crearCarnet" runat="server" type="number" class="form-control" placeholder="Carnet" ValidationGroup="registro"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="crearCarnet" ErrorMessage="Ingrese Carnet" ValidationGroup="registro" runat="Server">
                            </asp:RequiredFieldValidator>
                            <br>
                            <asp:TextBox ID="crearNombre" runat="server" type="text" class="form-control" placeholder="Nombre" ValidationGroup="registro"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="crearNombre" ErrorMessage="Ingrese Nombre" ValidationGroup="registro" runat="Server">
                            </asp:RequiredFieldValidator>
                            <br>

                            <asp:TextBox ID="crearNacimiento" runat="server" type="date" class="form-control" ValidationGroup="registro"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="crearNacimiento" ErrorMessage="Ingrese Nacimiento" ValidationGroup="registro" runat="Server">
                            </asp:RequiredFieldValidator>
                            <br>
                            <asp:TextBox ID="crearEmail" runat="server" type="email" class="form-control" placeholder="Email" ValidationGroup="registro"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="crearEmail" ErrorMessage="Ingrese Email" ValidationGroup="registro" runat="Server">
                            </asp:RequiredFieldValidator>
                            <br>
                            <asp:TextBox ID="crearTelefono" runat="server" type="number" class="form-control" placeholder="Telefono" ValidationGroup="registro"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="crearTelefono" ErrorMessage="Ingrese Telefono" ValidationGroup="registro" runat="Server">
                            </asp:RequiredFieldValidator>
                            <br>
                            <asp:TextBox ID="crearUsuario" runat="server" type="text" class="form-control" placeholder="Usuario" ValidationGroup="registro"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="crearCarnet" ErrorMessage="Ingrese Usuario" ValidationGroup="registro" runat="Server">
                            </asp:RequiredFieldValidator>
                            <br>
                            <asp:TextBox ID="crearPassword" runat="server" type="password" class="form-control" placeholder="Password" ValidationGroup="registro"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="crearPassword" ErrorMessage="Ingrese Password" ValidationGroup="registro" runat="Server">
                            </asp:RequiredFieldValidator>
                            <br>
                            <asp:TextBox ID="crearPassword2" runat="server" type="password" class="form-control" placeholder="Repetir Password" ValidationGroup="registro"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="crearPassword2" ErrorMessage="Ingrese Password" ValidationGroup="registro" runat="Server">
                            </asp:RequiredFieldValidator>
                            <br>
                            <asp:TextBox ID="crearPalabra" runat="server" type="text" class="form-control" placeholder="Palabra Clave" ValidationGroup="registro"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="crearPalabra" ErrorMessage="Ingrese Palabra Clave" ValidationGroup="registro" runat="Server">
                            </asp:RequiredFieldValidator>
                            <br>
                            <asp:Button ID="Button2" runat="server" Text="Ingresar" class="btn btn-theme btn-block" ValidationGroup="registro" OnClick="Button2_Click" CausesValidation="true"/>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/login-bg.png", { speed: 500 });
    </script>
</asp:Content>
