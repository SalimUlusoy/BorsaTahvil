<%@ Page Title="" Language="C#" MasterPageFile="~/BorsaTahvil.Master" AutoEventWireup="true" CodeBehind="ForgotPasswordPage.aspx.cs" Inherits="BorsaTahvilAlphaV1.ForgotPasswordPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <style>
        body {
            margin: 0;
            padding: 0;
            background-image:url(image/ForgotPasswordBG.jpg);
            background-repeat: no-repeat;
            background-size:100%;
            height: 100%;
        }
        #login .container #login-row #login-column #login-box {
            margin-top: 120px;
            max-width: 600px;
            height: 320px;
            border: 1px solid #9C9C9C;
            background-color: #EAEAEA;
        }
        #login .container #login-row #login-column #login-box #login-form {
            padding: 20px;
        }
        #login .container #login-row #login-column #login-box #login-form #register-link {
            margin-top: -85px;
        }
        .footer {
        position: fixed;
        bottom: 0px;
        left: 0px;
        width: 100%;
        height: 50px;
        padding:15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<body>

              <nav class="navbar navbar-expand-lg navbar-dark">
      <img src="image/logo.png" style="height:5%; width:5%; margin-left:5%">
      <p class="navbar-brand" style="margin-top:15px">Borsa Tahvil</p>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
          </nav>
    <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" method="post">
                            <div class="form-group">
                                <br />
                                <asp:TextBox TextMode="Email" name="EPosta" id="EPosta" class="form-control" placeholder="E-Posta Giriniz" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Button id="epostaGonder" name="epostaGonder" Text="E-Posta Gönder" OnClick="epostaGonder_Click" class="btn btn-info btn-md" value="E-Posta Gönder" runat="server" />
                                Veya
                                <asp:Button type="submit" name="giris_Ekranina_Don" Text="Giriş Ekranına Dön" OnClick="giris_Ekranina_Don_Click" class="btn btn-info btn-md" value="Giriş Ekranına Dön" runat="server"/>
                                <br />
                                <asp:Label id="hataMesaji" Font-Names="hataMesaji" runat="server"></asp:Label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
            <div class="footer mt-auto py-3">
        <div class="container">
            <p style="text-align:center; color:white; text-decoration:underline;">Borsa Tahvil Sitesinin Bütün Hakları Saklıdır.</p>
        </div>
</body>
</asp:Content>
