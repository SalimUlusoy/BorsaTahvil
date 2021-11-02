<%@ Page Title="" Language="C#" MasterPageFile="~/BorsaTahvil.Master" AutoEventWireup="true" CodeBehind="PostlarSayfas.aspx.cs" Inherits="BorsaTahvilAlphaV1.PostlarSayfas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <link href="css/ProfilePage.css" rel="stylesheet" />

    <style>
    body {
      font-family: "Lato", sans-serif;
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
          <a class="dropdown-item" href="ProfileUpdate.aspx" runat="server">Profil Düzenle</a>
          <a class="dropdown-item" href="Deposit.aspx" runat="server">Para Yatırma</a>
          <a class="dropdown-item" href="LoginPage.aspx" runat="server">Çıkış Yap</a>
        </div>
      </div>
</nav>
</header>

                <asp:GridView ID="TaskGridView" CellPadding="6" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="Id"
        AllowPaging="true"
       style=" width:100%">
                <Columns>  
                <asp:TemplateField HeaderText="ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Id" name="lbl_Id" runat="server" Text='<%#Eval("Id") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="PostIsim">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Post_isim" runat="server" Text='<%#Eval("Post_isim") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Post_isim" ReadOnly="true" runat="server" Text='<%#Eval("Post_isim") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="PostAciklama">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Post_aciklama" runat="server" Text='<%#Eval("Post_aciklama") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Post_aciklama" runat="server" Text='<%#Eval("Post_aciklama") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="KullaniciId">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_KullaniciId" runat="server" Text='<%#Eval("KullaniciId") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_KullaniciId" ReadOnly="true" runat="server" Text='<%#Eval("KullaniciId") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                    
    
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />  
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />   
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                 
                </asp:GridView>
                                                    <br />
                                <asp:Label id="hataMesaji" Font-Names="hataMesaji" runat="server"></asp:Label>
       

    <footer class="footer mt-auto py-3">
         <div class="container">
            <p style="text-align:center; color:white; text-decoration:underline;">Borsa Tahvil Sitesinin Bütün Hakları Saklıdır.</p>
        </div>
    </footer>

</body>
</asp:Content>
