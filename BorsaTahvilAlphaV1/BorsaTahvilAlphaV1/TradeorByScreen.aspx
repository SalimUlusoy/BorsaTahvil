<%@ Page Title="" Language="C#" MasterPageFile="~/BorsaTahvil.Master" AutoEventWireup="true" CodeBehind="TradeorByScreen.aspx.cs" Inherits="BorsaTahvilAlphaV1.TradeorByScreen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <style>
    body {
      font-family: "Lato", sans-serif;
      background-color:#666666;
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
    height: 25px;
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
           <asp:Button Id="ProfilePage" class="dropdown-item" OnClick="profilePage_Click" Text="Profil Sayfası" runat="server"/>
           <a class="dropdown-item" href="ProfileUpdate.aspx" runat="server">Profili Düzenle</a>
           <a class="dropdown-item" href="Deposit.aspx" runat="server">Para Yatırma</a>
          <a class="dropdown-item" href="LoginPage.aspx" runat="server">Çıkış Yap</a>
        </div>
      </div>
        <img src="icons/wallet_48px.png" width="40" height="40" style="" class="cuzdanLogo">
        <asp:Label ID="labelCuzdan" style="color:white" runat="server"></asp:Label>
        <asp:Label ID="labelTl" style="color:white" runat="server">TL</asp:Label>
</nav>
</header>

    <!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container" style="margin-top:1%; float:left; margin-left:1%">
  <div id="tradingview_d753e"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
      new TradingView.widget(
          {
              "width": 1000,
              "height": 640,
              "symbol": "BITBAY:BTCUSDT",
              "interval": "D",
              "timezone": "Etc/UTC",
              "theme": "dark",
              "style": "1",
              "locale": "tr",
              "toolbar_bg": "#f1f3f6",
              "enable_publishing": false,
              "allow_symbol_change": true,
              "container_id": "tradingview_d753e"
          }
      );
  </script>
</div>
            <div class="AlimSatim" style="background-color:#181424; float:right; margin-right:140px; margin-top:1%; height:640px; width:300px">
                <div class="satınAlUstKisim" style="background-color:#181424; top:0px; margin-top:1%; width:300px; border-bottom:solid; border-color:grey; color:white; text-align:center" >Satın Al - Satım Yap</div>
                    <asp:CheckBox id="checkbox1" runat="server"
                    AutoPostBack="True"
                    Text="Coin Sat"
                    TextAlign="Right"
                    style="color:white"
                    OnCheckedChanged="CheckBoxSat_Clicked"/>
                    <asp:CheckBox id="checkbox2" runat="server"
                    AutoPostBack="True"
                    Text="Coin Satın Al"
                    style="color:white"
                    TextAlign="Right"
                    OnCheckedChanged="CheckBoxSatinAl_Clicked"/>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server">  
                </asp:DropDownList>  
                <br />
                <asp:Button ID="Button1" runat="server" Text="Veri Çek" OnClick="Button1_Click1" Style="height: 26px" />
                <asp:Button ID="Button2" runat="server" Text="Listele" OnClick="Button2_Click1" Style="height: 26px" />
                <br />
                <br />
                <span style="color:white">İşlem Miktarı: </span>
                <asp:TextBox type="text" name="islemMiktari" id="islemMiktari" class="form-control" placeholder="İşlem Miktarını Giriniz" runat="server"></asp:TextBox>
                <asp:Label id="varOlanMiktarText" Font-Names="Miktar">Elinizde Var Olan Miktar:</asp:Label> 
                <asp:Label id="miktar" Font-Names="Miktar" runat="server"></asp:Label> 
                <asp:Label id="Label1" Font-Names="hataMesaji" runat="server"></asp:Label>
                <br />
                <br />
                <p id="cekilecekTutarText" Visible="false" style="color:white" runat="server">Çekilecek Tutar: </p>
                <asp:TextBox type="text" Visible="false" name="cekilecekTutarSatinAl" id="cekilecekTutarSatinAl" ReadOnly="true" class="form-control" placeholder="Çekilecek Tutar" runat="server"></asp:TextBox>
                <asp:TextBox type="text" Visible="false" name="cekilecekTutarSat" id="cekilecekTutarSat" ReadOnly="true" class="form-control" placeholder="Çekilecek Tutar" runat="server"></asp:TextBox>
                <asp:Label id="hataMesaji2" Font-Names="hataMesaji" runat="server"></asp:Label>
                <br />
                <asp:Button ID="satinAlButton" Visible="false" runat="server" OnClick="SatinAl_Click" Text="Satın Al" Style="height: 26px" />
                <asp:Button ID="satButton" Visible="false" runat="server" OnClick="Sat_Click" Text="Sat" Style="height: 26px" />
                <br />
                <asp:Label id="hataMesaji" Font-Names="hataMesaji" runat="server"></asp:Label>
                <div class="container">


  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Satın Alınanlar</button>

  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Spot Cüzdanı </h4>
        </div>
        <div class="modal-body">
                  <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" CellPadding="6"  
            ForeColor="#333333" GridLines="None">  
            <AlternatingRowStyle BackColor="White" />  
            <EditRowStyle BackColor="#7C6F57" />  
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />  
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />  
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />  
            <RowStyle BackColor="#E3EAEB" />  
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />  
            <SortedAscendingCellStyle BackColor="#F8FAFA" />  
            <SortedAscendingHeaderStyle BackColor="#246B61" />  
            <SortedDescendingCellStyle BackColor="#D4DFE1" />  
            <SortedDescendingHeaderStyle BackColor="#15524A" />  
            <Columns>  
                <asp:BoundField DataField="KriptoParaAdi" HeaderText="KriptoParaAdi" />  
                <asp:BoundField DataField="Miktar" HeaderText="Miktar" />  
            </Columns>  
        </asp:GridView> 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

            </div>


    <div class="footer mt-auto py-3 bg-dark" style="    position: fixed;
    bottom: 0px;
    left: 0px;
    width: 100%;
    height: 50px;
    padding:15px;
    background-color: #000;">
         <div class="container">
            <p class="text-muted" style="text-align:center">Borsa Tahvil Sitesinin Bütün Hakları Saklıdır.</p>
        </div>
    </div>

    </body>

</asp:Content>
