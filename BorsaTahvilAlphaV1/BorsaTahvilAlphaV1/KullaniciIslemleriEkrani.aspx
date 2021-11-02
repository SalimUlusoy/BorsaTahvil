<%@ Page Title="" Language="C#" MasterPageFile="~/BorsaTahvil.Master" AutoEventWireup="true" CodeBehind="KullaniciIslemleriEkrani.aspx.cs" Inherits="BorsaTahvilAlphaV1.KullaniciIslemleriEkrani" %>
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

<div id="mySidebar" class="sidebar">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
  <a href="YoneticiSupportScreen.aspx" runat="server">Destek Ayarları</a>
  <a href="YoneticiPostUpdate.aspx" runat="server">Post Ayarları</a>
  <a href="YoneticiEmployeePage.aspx" runat="server">Personel Ayarları</a>
  <a href="YoneticiEditorMakale.aspx" runat="server">Editör Makale Ayarları</a>
</div>

<div id="main">
  <span class="openbtn" onclick="openNav()">☰</span>  
</div>

  <img src="image/logo.png" style="height:5%; width:5%; margin-right:1%">
  <a class="navbar-brand" href="YoneticiPaneli.aspx">Yönetici Paneli</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="KullaniciIslemleriEkrani.aspx">Kullanıcı İşlemleri<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="YoneticiFormGoruntuleme.aspx" runat="server">Formları Görüntüle</a>
      </li>
    </ul>
  </div>

          <div class="nav-item dropdown" style="margin-right:7%">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img src="https://miro.medium.com/fit/c/1360/1360/1*8gojFT_z-VkkZfMH8uOmuA.jpeg" width="40" height="40" class="rounded-circle">
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="LoginPage.aspx" runat="server">Çıkış Yap</a>
        </div>
</nav>
</header>
 
        <form>  
            <div>  
                <asp:GridView ID="TaskGridView" OnRowEditing="TaskGridView_RowEditing" CellPadding="6" OnRowCancelingEdit="TaskGridView_RowCancellingEdit" OnRowUpdating="TaskGridView_RowUpdating" runat="server" 
        AutoGenerateEditButton="True"
                    AutoGenerateColumns="False" DataKeyNames="Id"
        AllowPaging="true"
       style=" width:100%">
                <Columns>  
                <asp:TemplateField HeaderText="ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Id" name="lbl_Id" runat="server" Text='<%#Eval("Id") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Adı">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Adi" runat="server" Text='<%#Eval("Adi") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Adi" runat="server" Text='<%#Eval("Adi") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Soyadi">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Soyadi" runat="server" Text='<%#Eval("Soyadi") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Soyadi" runat="server" Text='<%#Eval("Soyadi") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Email" runat="server" Text='<%#Eval("Email") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Email" runat="server" Text='<%#Eval("Email") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="NickName">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_NickName" runat="server" Text='<%#Eval("NickName") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_NickName" runat="server" Text='<%#Eval("NickName") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Yetki">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Yetki" runat="server" Text='<%#Eval("Yetki") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Yetki" runat="server" Text='<%#Eval("Yetki") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                                     <asp:TemplateField HeaderText="Durum">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Durum" runat="server" Text='<%#Eval("Durum") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Durum" runat="server" Text='<%#Eval("Durum") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                    
    
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />  
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />   
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                 
                </asp:GridView>

                                                <br />
                                <asp:Label id="hataMesaji" Font-Names="hataMesaji" runat="server"></asp:Label>

                <asp:Label id="bilgilendirmeMesaji" Font-Names="bilgilendirmeMesaji" runat="server"></asp:Label>
        
            </div>       
        </form>

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
