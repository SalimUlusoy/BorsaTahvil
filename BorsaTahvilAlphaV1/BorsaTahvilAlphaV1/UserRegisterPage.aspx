<%@ Page Title="" Language="C#" MasterPageFile="~/BorsaTahvil.Master" AutoEventWireup="true" CodeBehind="UserRegisterPage.aspx.cs" Inherits="BorsaTahvilAlphaV1.UserRegisterPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image:url(image/LoginandRegisterBG.jpg);
            background-repeat: no-repeat;
            background-size:100%;
            height: 100vh;
        }
        #Register .container #Register-row #Register-column #Register-box {
            margin-top: 110px;
            max-width: 600px;
            margin-left:400px;
            height: 420px;
            border: 1px solid #9C9C9C;
            background-color: #EAEAEA;
        }
        #Register .container #Register-row #Register-column #Register-box #Register-form {
            padding: 20px;
        }
        #Register .container #Register-row #Register-column #Register-box #Register-form #register-link {
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

    <div id="Register">
        <div class="container">
            <div id="Register-row" class="row justify-content-center align-items-center">
                <div id="Register-column" class="col-md-6">
                    <div id="Register-box" class="col-md-12">
                        <form id="form" name="form" class="form" method="post">
                            <div class="form-group">
                                <br />
                                <asp:TextBox type="text" name="name" id="name" class="form-control" placeholder="Adınızı Giriniz" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox type="text" name="surname" id="surname" class="form-control" placeholder="Soyadınızı Giriniz" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox type="email" name="email" id="email" class="form-control" placeholder="Email Giriniz" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox type="text" name="username" id="username" class="form-control" placeholder="Kullanıcı Adını Giriniz" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox type="password" name="password" id="password" class="form-control" placeholder="Şifre Giriniz" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Button id="kayitOl" name="kayitOl" Text="Kayıt Ol" onclick="kayitOl_Click" class="btn btn-info btn-md" value="Kayıt Ol" runat="server" />
                                Veya
                                <asp:Button id="girisYap" name="girisYap" OnClick="girisButton_Click" Text="Giriş Yap" class="btn btn-info btn-md" value="Giriş Yap" runat="server" />
                                <br />
                                <br />
                                <asp:Button type="submit" name="sifreUnuttum" Text="Şifremi Unuttum" OnClick="sifremiUnuttum_Click" class="btn btn-info btn-md" value="Şifremi Unuttum!" runat="server" />
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
    </div>
</body>
</asp:Content>
