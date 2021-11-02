<%@ Page Title="" Language="C#" MasterPageFile="~/BorsaTahvil.Master" AutoEventWireup="true" CodeBehind="MainScreen.aspx.cs" Inherits="BorsaTahvilAlphaV1.MainScreen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"  crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/selectivizr/1.0.2/selectivizr-min.js"  crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Slab|Comfortaa" crossorigin="anonymous">

    <link rel="stylesheet" href="css/MainScreen.css" crossorigin="anonymous">
    
    <style>
    body {
      font-family: "Lato", sans-serif;
        height: 100%;
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

.parallax {
  /* The image used */
  background-image: url(image/Hakkımızda.jpeg);

  /* Full height */
  height: 500px; 

  /* Create the parallax scrolling effect */
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: 100%;
}

/* Turn off parallax scrolling for tablets and phones. Increase the pixels if needed */
@media only screen and (max-device-width: 1366px) {
  .parallax {
    background-attachment: scroll;
  }
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
	<div class="BackGround" style="background-image:url(image/borsa.png); height:800px" >

<header>
<nav class="navbar navbar-expand-lg navbar-dark">

<div id="mySidebar" class="sidebar">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
  <a href="#hakkimizda" runat="server">Hakkımızda</a>
  <a href="#iletisim" runat="server">İletişim</a>
  <a href="PostlarSayfas.aspx" runat="server">Postlar</a>
  <a href="MakaleOku.aspx" runat="server">Makaleler</a>

    <br />
    <br />
  <h2 style="color :white;">Destek Bölümü</h2> 
      <label style="color:white;">Destek Türü:</label>
        <select name="destekList" id="destekList" runat="server">
          <option value="Satın Alım Hatası">Satın Alım Hatası</option>
          <option value="Para Ekleme Sorunu">Para Ekleme Sorunu</option>
          <option value="Profil Hatası">Profil Hatası</option>
        </select> 
          <label style="color:white;">Destek Notu:</label>
      <asp:TextBox type="text" class="form-control" id="txt_DestekNot" runat="server"></asp:TextBox>
    <asp:Button id="destekGonder" name="destekGonder" Text="Gönder" OnClick="destekGonder_Click" class="btn btn-info btn-md" value="Gönder" runat="server" />
    <br />
    <asp:Label id="hataMesaji" Font-Names="hataMesaji" runat="server"></asp:Label>

  <asp:TextBox type="text" class="form-control" id="Id" visible="false" runat="server"></asp:TextBox>
</div>

<div id="main">
  <span class="openbtn" onclick="openNav()">☰</span>  
</div>

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

          <div class="nav-item dropdown" style="margin-right:7%">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="https://miro.medium.com/fit/c/1360/1360/1*8gojFT_z-VkkZfMH8uOmuA.jpeg" width="40" height="40" class="rounded-circle">
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <asp:Button Id="ProfilePage" class="dropdown-item" OnClick="profilePage_Click" Text="Profil Sayfası" runat="server"/>
          <a class="dropdown-item" href="ProfileUpdate.aspx" runat="server">Profil Düzenle</a>
          <a class="dropdown-item" href="Deposit.aspx" runat="server">Para Yatırma</a>
          <a class="dropdown-item" href="LoginPage.aspx" runat="server">Çıkış Yap</a>
        </div>
      </div>
        <img src="icons/wallet_48px.png" width="40" height="40" style="" class="cuzdanLogo">
        <asp:Label ID="labelCuzdan" style="color:white" runat="server"></asp:Label>
        <asp:Label ID="labelTl" style="color:white" runat="server">TL</asp:Label>
</nav>
</header>

    <div class="ortaKisim" style="position:relative!important; display:flex;">
        <div class="sagKisim" style="margin-top:8%; margin-left:5%">
            <h1 style="color :white;">Borsa Tahvil Sitesi Nedir?</h1> 
            <p class="altBilgiYazi" style="color: #8193b2!important; font-size: 1.5rem!important; display:block;">Borsada bulunan birçok kripto paranın satın alınıp takip edilebildiği bir web sitesidir.</p>
        </div>

        <div class="solKisim" style="margin-right:3%; margin-left:10%; margin-top:3%">

            <div class="tradingview-widget-container">
              <div class="tradingview-widget-container__widget"></div>
              <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-screener.js" async>
              {
              "width": "750",
              "height": "490",
              "defaultColumn": "overview",
              "screener_type": "crypto_mkt",
              "displayCurrency": "USD",
              "colorTheme": "dark",
              "locale": "tr",
              "isTransparent": true
            }
              </script>
            </div>

        </div>
     </div>
	</div>

<div class="parallax">
    <a name="hakkimizda"></a><h1 style="text-align:center; color:#ffffff;padding:10px;"> Hakkımızda </h1>
    <h3 style="text-align:center; color:#ffffff;padding:10px;">Kripto Para Piyasasının En Güvenilir Sitelerinden Biri Olmaya Oynuyoruz En Yakın Zamanda Misyonumuz Ve Vizyonumuz Burayı Alacak.</h3>
</div>

<div class="mouse"></div>
<p class="mouseText">Scroll</p>

<div class="parallax">
        <a name="iletisim"></a><h1 style="text-align:center; color:#ffffff;padding:10px;"> İletişim Bilgilerimiz </h1>
        <h3 style="margin-left:10%; color:#ffffff;padding:10px;">Telefon Numaramız: 05304435851</h3>
        <h3 style="margin-left:10%; color:#ffffff;padding:10px;">Adres Bilgimiz: İstanbul Sarıyer Reşitpaşa Tuncay Artun Caddesi No:1</h3>
        <h3 style="margin-left:10%; color:#ffffff;padding:10px;">Email Adresimiz: borsatahvil@gmail.com</h3>
</div>

    <footer class="footer mt-auto py-3">
         <div class="container">
            <p style="text-align:center; color:white; text-decoration:underline;">Borsa Tahvil Sitesinin Bütün Hakları Saklıdır.</p>
        </div>
    </footer>

<script>


    function openNav() {
        document.getElementById("mySidebar").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
    }

    function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("main").style.marginLeft = "0";
    }
</script>
    </body>

</asp:Content>
