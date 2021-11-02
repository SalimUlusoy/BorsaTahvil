<%@ Page Title="" Language="C#" MasterPageFile="~/BorsaTahvil.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="BorsaTahvilAlphaV1.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image:url(image/LoginandRegisterBG.jpg);
            background-repeat: no-repeat;
            background-size:100%;
            height: 100vh;
        }
        #login .container #login-row #login-column #login-box {
            margin-top: 120px;
            max-width: 600px;
            height: 320px;
            margin-left:400px;
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
                                <asp:TextBox type="text" name="username" id="username" class="form-control" placeholder="Kullanıcı Adını Giriniz" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox name="password" id="password" class="form-control" TextMode="Password" placeholder="Parola Giriniz" runat="server"></asp:TextBox><asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Göster" style="float:right" />
                            </div>
                            <div class="form-group">
                                <asp:Button id="girisYap" name="girisYap" Text="Giriş Yap" OnClick="girisYap_Click" class="btn btn-info btn-md" value="Giriş Yap" runat="server" />
                                Veya
                                <asp:Button type="submit" name="kayitOl" Text="Kayıt Ol" OnClick="kayitButton_Click" class="btn btn-info btn-md" value="Kayıt Ol" runat="server"/>
                                <br />
                                <br />
                                <asp:Button type="submit" name="sifreUnuttum" Text="Şifremi Unuttum" OnClick="sifremiUnuttum_Click" class="btn btn-info btn-md" value="Şifremi Unuttum!" runat="server" />
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
    </div>
</body>

</asp:Content>
