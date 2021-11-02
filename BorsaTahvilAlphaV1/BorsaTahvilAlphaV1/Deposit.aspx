<%@ Page Title="" Language="C#" MasterPageFile="~/BorsaTahvil.Master" AutoEventWireup="true" CodeBehind="Deposit.aspx.cs" Inherits="BorsaTahvilAlphaV1.Deposit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <style>
    body {
      font-family: "Lato", sans-serif;
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
    background-color: #000;
    }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
<header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">


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
          <a class="dropdown-item" href="ProfileUpdate.aspx" runat="server">Profil Düzenle</a>
          <a class="dropdown-item" href="Deposit.aspx" runat="server">Para Yatırma</a>
          <a class="dropdown-item" href="LoginPage.aspx" runat="server">Çıkış Yap</a>
        </div>
      </div>
</nav>
</header>

        <div class="tradingview-widget-container" style="width:100%; height:50px">
          <div class="tradingview-widget-container__widget"></div>
          <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-ticker-tape.js" async>
          {
          "symbols": [
            {
              "proName": "FX_IDC:EURUSD",
              "title": "EUR/USD"
            },
            {
              "proName": "BITSTAMP:BTCUSD",
              "title": "BTC/USD"
            },
            {
              "proName": "BITSTAMP:ETHUSD",
              "title": "ETH/USD"
            },
            {
              "description": "XRP/USD",
              "proName": "CURRENCYCOM:XRPUSD"
            },
            {
              "description": "USD/TRY",
              "proName": "FX:USDTRY"
            },
            {
              "description": "EUR/TRY",
              "proName": "FX:EURTRY"
            }
          ],
          "showSymbolLogo": true,
          "colorTheme": "light",
          "isTransparent": false,
          "displayMode": "adaptive",
          "locale": "tr"
        }
          </script>
        </div>

        <asp:TextBox type="text" class="form-control" id="Id" visible="false" runat="server"></asp:TextBox>

         <div class="col-md-6 offset-md-3">

                    <!-- form card cc payment -->
                    <div class="card card-outline-secondary" style="margin-top:10px">
                        <div class="card-body">
                            <h3 class="text-center">Banka Kartı İle Ödeme</h3>
                            <hr>
                            <div class="alert alert-info p-2 pb-3">
                                <a class="close font-weight-normal initialism" data-dismiss="alert" href="#"><samp>×</samp></a> 
                                CVC Kodu Gereklidir.
                            </div>
                            <form class="form" role="form" autocomplete="off">
                                <div class="form-group">
                                    <label for="cc_name">Kart Üzerindeki İsim</label>
                                    <asp:TextBox type="text" class="form-control" id="cc_name" pattern="\w+ \w+.*" title="Ad Soyad Formatında Giriş Yapınız" required="required" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Kart Numarası</label>
                                    <asp:TextBox type="text" class="form-control" autocomplete="off" maxlength="20" pattern="\d{16}" title="Kredi Kartı Formatında Giriş Yapınız" required="required" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-12">Kart Bitiş Tarihi</label>
                                    <div class="col-md-4">
                                        <asp:TextBox type="text" class="form-control" autocomplete="off" maxlength="2" pattern="\d{2}" title="Ay Formatında Giriş Yapınız" required="required" placeholder="Ay" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox type="text" class="form-control" id="cardYear" maxlength="4" pattern="\d{4}" title="Yıl Formatında Giriş Yapınız"  placeholder="Yıl" required="required" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox type="text" class="form-control" id="CVC" autocomplete="off" maxlength="3" pattern="\d{3}" title="CVC Formatında Giriş Yapınız" required="required" placeholder="CVC" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="col-md-12">Miktar</label>
                                </div>
                                <div class="form-inline">
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text">₺</span></div>
                                        <asp:TextBox type="text" class="form-control text-right" id="paraMiktari" placeholder="100" runat="server"></asp:TextBox>
                                        <div class="input-group-append"><span class="input-group-text">.00</span></div>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group row">
     
                                    <div class="col-md-6">
                                        <asp:Button type="submit" class="btn btn-success btn-lg btn-block" OnClick="buttonSave_Click" Text="Öde" style="margin-left:100%" runat="server"/>
                                                                        <br />
                                <asp:Label id="hataMesaji" Font-Names="hataMesaji" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


    <footer class="footer mt-auto py-3 bg-dark">
         <div class="container">
            <p class="text-muted" style="text-align:center">Borsa Tahvil Sitesinin Bütün Hakları Saklıdır.</p>
        </div>
    </footer>

    </body>
</asp:Content>
