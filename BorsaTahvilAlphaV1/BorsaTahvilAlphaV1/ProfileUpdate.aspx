<%@ Page Title="" Language="C#" MasterPageFile="~/BorsaTahvil.Master" AutoEventWireup="true" CodeBehind="ProfileUpdate.aspx.cs" Inherits="BorsaTahvilAlphaV1.ProfileUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <link href="css/ProfilePage.css" rel="stylesheet" />

    <style>
    body {
            margin: 0;
            padding: 0;
            background-image:url(image/ProfileUpdateBG.jpg);
            background-repeat: no-repeat;
            background-size:100%;
            height: 100vh;
    }

    .form-control:focus {
        box-shadow: none;
        border-color: #BA68C8
    }

    .profile-button {
        background: rgb(99, 39, 120);
        box-shadow: none;
        border: none
    }

    .profile-button:hover {
        background: #682773
    }

    .profile-button:focus {
        background: #682773;
        box-shadow: none
    }

    .profile-button:active {
        background: #682773;
        box-shadow: none
    }

    .back:hover {
        color: #682773;
        cursor: pointer
    }

    .labels {
        font-size: 11px
    }

    .add-experience:hover {
        background: #BA68C8;
        color: #fff;
        cursor: pointer;
        border: solid 1px #BA68C8
    }

    .sidebar {
      height: 100%;
      width: 0;
      position: fixed;
      z-index: 1;
      top: 0;
      left: 0;
      background-color: #111;
      overflow-x: hidden;
      transition: 0.5s;
      padding-top: 60px;
    }

    .sidebar a {
      padding: 8px 8px 8px 32px;
      text-decoration: none;
      font-size: 25px;
      color: #818181;
      display: block;
      transition: 0.3s;
    }

    .sidebar a:hover {
      color: #f1f1f1;
    }

    .sidebar .closebtn {
      position: absolute;
      top: 0;
      right: 25px;
      font-size: 36px;
      margin-left: 50px;
    }

    .openbtn {
      font-size: 20px;
      cursor: pointer;
      background-color: ##383c44;
      color: white;
      padding: 10px 15px;
      border: none;
    }

    .openbtn:hover {
      background-color: #444;
    }

    #main {
      transition: margin-left .5s;
      padding: 16px;
    }

    /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
    @media screen and (max-height: 450px) {
      .sidebar {padding-top: 15px;}
      .sidebar a {font-size: 18px;}
    }

    footer {
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
            <header>
<nav class="navbar navbar-expand-lg navbar-dark">

  <img src="image/logo.png" style="height:5%; width:5%; margin-right:1%">
  <a class="navbar-brand" href="MainScreen.aspx" runat="server">Borsa Tahvil</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="FormEkrani.aspx" runat="server">Bizimle Çalışın<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="TradeOrByScreen.aspx" runat="server">Kripto Para Satın Al</a>
      </li>
    </ul>
  </div>
      <asp:TextBox type="text" class="form-control" id="Id" visible="false" runat="server"></asp:TextBox>

          <div class="nav-item dropdown" style="margin-right:7%">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="https://miro.medium.com/fit/c/1360/1360/1*8gojFT_z-VkkZfMH8uOmuA.jpeg" width="40" height="40" class="rounded-circle">
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <asp:Button Id="ProfilePage" class="dropdown-item" OnClick="profilePage_Click" Text="Profil Sayfası" runat="server"/>
          <a class="dropdown-item" href="ProfileUpdate.aspx" runat="server">Profili Düzenle</a>
          <a class="dropdown-item" href="Deposit.aspx" runat="server">Para Yatırma</a>
          <a class="dropdown-item" href="LoginPage.aspx" runat="server">Çıkış Yap</a>
        </div>
      </div>
</nav>
</header>

    <div class="container rounded bg-white mt-5 mb-5">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="https://miro.medium.com/fit/c/1360/1360/1*8gojFT_z-VkkZfMH8uOmuA.jpeg" style="width:50%;height:125px"><span class="font-weight-bold">Salim Emirhan Ulusoy</span><span class="text-black-50">salimulusoy25@gmail.com</span><span> </span></div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                       
                    </div>
                    <asp:CheckBox ID="BilgiGosterCheckBox" runat="server" AutoPostBack="True" oncheckedchanged="BilgiCheckBox_CheckedChanged" Text="Bilgileri Doldur" />
                    <div class="row mt-2">
                        <asp:Label id="kullaniciAd" style="color:black">Kullanıcı Adı: </asp:Label> 
                        <asp:TextBox type="text" name="KullaniciAd" id="KullaniciAd" class="form-control" style="width:100%" runat="server"></asp:TextBox>
                        <asp:Label id="kullaniciSoyad" style="color:black">Kullanıcı Soyadı: </asp:Label>
                        <asp:TextBox type="text" name="KullaniciSoyad" id="KullaniciSoyad" class="form-control" style="width:100%" runat="server"></asp:TextBox>
                    </div>
                    <div class="row mt-3">
                        <asp:Label id="kullaniciEmail" style="color:black">Email: </asp:Label>
                        <asp:TextBox type="text" name="KullaniciEmail" id="KullaniciEmail" class="form-control" style="width:100%" runat="server"></asp:TextBox>
                        <asp:Label id="kullaniciNickName" style="color:black">Nick Name: </asp:Label>
                        <asp:TextBox type="text" name="KullaniciNickName" id="KullaniciNickName" class="form-control" style="width:100%" runat="server"></asp:TextBox>
                    </div>
                    <div class="row mt-3">
                        <asp:Label id="kullaniciParola" style="color:black">Parola: </asp:Label>
                        <asp:TextBox type="text" name="KullaniciParola" id="KullaniciParola" class="form-control" style="width:100%;" runat="server"></asp:TextBox>
                    </div>
                    <br />
                        <asp:Button Id="GeriDon" class="btn btn-secondary" data-dismiss="modal" OnClick="geriDon_Click" Text="Geri Dön" runat="server"/>
                        <asp:Button id="kayitEt" name="kayitEt" Text="Değişiklikleri Kaydet" onclick="buttonSave_Click" class="btn btn-info btn-md" value="Değişiklikleri Kaydet" runat="server" />
                                                    <br />
                                <asp:Label id="hataMesaji" Font-Names="hataMesaji" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>

        <footer class="footer mt-auto py-3">
         <div class="container">
            <p style="text-align:center; color:white; text-decoration:underline;">Borsa Tahvil Sitesinin Bütün Hakları Saklıdır.</p>
        </div>
    </footer>

</body>
</asp:Content>
