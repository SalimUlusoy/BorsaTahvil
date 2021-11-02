<%@ Page Title="" Language="C#" MasterPageFile="~/BorsaTahvil.Master" AutoEventWireup="true" CodeBehind="EditorProfilePage.aspx.cs" Inherits="BorsaTahvilAlphaV1.EditorProfilePage" %>
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

.ratings_wrapper .star-rating-widget .star-rating-button {
    height: 150px;
    width: 150px;
}
.star-rating-button {
    position: relative;
    margin-left:75%;
    margin-top:-8%;

}
.ratings_wrapper .imdbRating+.star-rating-widget .star-rating-button button {
    border-left: 1px solid #6b6b6b;
}
.ratings_wrapper .star-rating-widget .star-rating-button button {
    color: #fff;
    font: normal 11px/13px Verdana, Arial, sans-serif;
    text-align: left;
    white-space: normal;
    padding: 1px 0 1px 1px;
    height: 42px;
    width: 91px;
    border-radius: 0;
}
.star-rating-button button {
    display: inline-block;
    background-color: transparent;
    padding: 0;
    border: 0;
    box-shadow: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    outline: none;
}
button {
    font-weight: bold;
    padding: 0.25em;
    cursor: pointer;
    border-radius: 3px;
}
.ratings_wrapper .star-rating-widget .star-rating-button .star-rating-star {
    background: url(/icons/star_48px.png) no-repeat;
    background-position: -8px -196px;
    float: left;
    width: 48px;
    height: 48px;
    margin-right: 1px;
}
.star-rating-button .star-rating-star {
    background: url(/icons/star_48px.png) 0 0 no-repeat;
    display: inline-block;
    vertical-align: text-bottom;
    width: 48px;
    height: 48px;
}
.star-rating-text{
    color:white;
}
.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}
.dropdown {
    top:-50px;
    left:7%;
    display:block
}
.dropdown-content {
    display: none;
    position:absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}
.dropdown-content a:hover {background-color: #f1f1f1}
.dropdown:hover .dropdown-content {
    display: block;
}
.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
.ddlVoting{
    margin-right:10px;
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
      <li class="nav-item active">
        <a class="nav-link" href="EditorMakaleYazma.aspx" runat="server">Makale Yazma Bölümü</a>
      </li>
    </ul>
  </div>

              <div class="nav-item dropdown" style="margin-right:12%; top:0px">
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

    <div class="container">
   <div class="row">
      <div class="col-md-12">
         <div id="content" class="content content-full-width">

            <div class="profile">
               <div class="profile-header">

                  <div class="profile-header-cover"></div>

                  <div class="profile-header-content">

                     <div class="profile-header-img">
                        <img src="https://miro.medium.com/fit/c/1360/1360/1*8gojFT_z-VkkZfMH8uOmuA.jpeg" alt="">
                     </div>

                     <div class="profile-header-info">
                        <h4 id="kullaniciAdi" class="m-t-10 m-b-5" runat="server">Salim Emirhan Ulusoy</h4>
                        <p class="m-b-10">UXUI + Frontend Developer</p>
                         <a href="ProfileUpdate.aspx" runat="server"><button type="button" class="btn btn-sm btn-info mb-2" runat="server">Profili Düzenle</button></a>
                         <asp:Button type="submit" name="oyVer" Text="Oy Ver" class="btn btn-sm btn-info mb-2" OnClick="oyVerButton_Click" style="margin-left:75%; top:5%;" value="Oy Ver" runat="server"/>
                      </div>
                  </div>
                 

                  <ul class="profile-header-tab nav nav-tabs">
                     <li class="nav-item"><a href="#profile-post" class="nav-link active show" data-toggle="tab">POSTS</a></li>
                  </ul>
                   
               </div>
            </div>

                         <div class="dropdown">
                         <div class="star-rating-button"><span class="star-rating-star no-rating">
                            </span><span name="star-rating" id="star-rating" class="star-rating-text">Rate This</span>
                            <asp:DropDownList ID="ddlVoting" class="ddlVoting" runat="server" AutoPostBack = "true">
                                <asp:ListItem Text="1" Value="1" />
                                <asp:ListItem Text="2" Value="2" />
                                <asp:ListItem Text="3" Value="3" />
                                <asp:ListItem Text="4" Value="4" />
                                <asp:ListItem Text="5" Value="5" />
                            </asp:DropDownList>
                             <span name="starText" id="starText" class="star-rating-text" runat="server">0</span><span name="sayiDerece" style="color:white">/5</span>
                          </div>
        
                         </div>

                          <div class="profile-content" style="margin-top:2%">

               <div class="tab-content p-0">

                  <div class="tab-pane fade active show" id="profile-post">

                     <ul class="timeline">
                        <li>

                             <div class="timeline-body" >
                              <div class="timeline-header">
                                 <span class="userimage"><img src="https://miro.medium.com/fit/c/1360/1360/1*8gojFT_z-VkkZfMH8uOmuA.jpeg" alt=""></span>
                                 <span id="postKullaniciAdi2" class="username" runat="server"><a href="javascript:;">Salim Emirhan Ulusoy</a> <small></small></span>
                              </div>
                              <div class="timeline-content">
                                    <asp:Textbox  type="text" name="yorumtxt" id="yorumtxt" class="form-control" TextMode="MultiLine"  placeholder="Yorumunuzu Ekleyiniz..." runat="server"/>
                              </div>
                              <div class="timeline-likes">
                                 <div class="stats-right">
                                 </div>
                                 <div class="stats">
                                 </div>
                              </div>
                              <div class="timeline-footer">
                              </div>
                              <div class="timeline-comment-box">
                                 <div class="input">
                                    <form action="">
                                       <div class="input-group">
                                          <asp:Button id="yorumbtn" name="yorumbtn" Text="Yorum Ekle" OnClick="yorumEkle_Click" class="btn btn-info btn-md" value="Yorum Ekle" runat="server" />
                                          <br />
                                          <asp:Label id="hataMesaji" Font-Names="hataMesaji" runat="server"></asp:Label>
                                       </div>
                                    </form>
                                 </div>
                              </div>
                           </div>

                </li></ul></div></div></div>

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



             <div class="profile-content" style="margin-top:2%">

               <div class="tab-content p-0">

                  <div class="tab-pane fade active show" id="profile-post">



                     <ul class="timeline">
                        <li>

                           <div class="timeline-time">
                              <span class="date">today</span>
                              <span class="time">04:20</span>
                           </div>

                           <div class="timeline-icon">
                              <a href="javascript:;">&nbsp;</a>
                           </div>

             <% 
                 for (int i = 0; i <5; i++)
                 {

                     %>
                          <div class="timeline-body" >
                              <div class="timeline-header">
                                 <span class="userimage"><img src="https://miro.medium.com/fit/c/1360/1360/1*8gojFT_z-VkkZfMH8uOmuA.jpeg" alt=""></span>
                                 <span id="postKullaniciAdi" class="username" runat="server"><a href="javascript:;">@Request.</a> <small></small></span>
                                 <span class="pull-right text-muted">18 Views</span>
                              </div>
                              <div class="timeline-content">
                                 <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc faucibus turpis quis tincidunt luctus.
                                    Nam sagittis dui in nunc consequat, in imperdiet nunc sagittis.
                                 </p>
                              </div>
                              <div class="timeline-likes">
                                 <div class="stats-right">
                                    <span class="stats-text">259 Shares</span>
                                    <span class="stats-text">21 Comments</span>
                                 </div>
                                 <div class="stats">
                                    <span class="fa-stack fa-fw stats-icon">
                                    <i class="fa fa-circle fa-stack-2x text-danger"></i>
                                    <i class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"></i>
                                    </span>
                                    <span class="fa-stack fa-fw stats-icon">
                                    <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                    <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <span class="stats-total">4.3k</span>
                                 </div>
                              </div>
                              <div class="timeline-footer">
                                 <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
                                 <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
                                 <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
                              </div>
                              <div class="timeline-comment-box">
                                 <div class="user"><img src="https://miro.medium.com/fit/c/1360/1360/1*8gojFT_z-VkkZfMH8uOmuA.jpeg"></div>
                                 <div class="input">
                                    <form action="">
                                       <div class="input-group">
                                          <input type="text" class="form-control rounded-corner" placeholder="Write a comment...">
                                          <span class="input-group-btn p-l-10">
                                          <button class="btn btn-primary f-s-12 rounded-corner" type="button">Comment</button>
                                          </span>
                                       </div>
                                    </form>
                                 </div>
                              </div>
                           </div>
                            <br />
<% } 
%>                      

                        </li>

                        <li>

                        </li>
                     </ul>

                  </div>

               </div>

            </div>

         </div>
      </div>
   </div>
</div>


        <footer class="footer mt-auto py-3 bg-dark">
         <div class="container">
            <p class="text-muted" style="text-align:center">Borsa Tahvil Sitesinin Bütün Hakları Saklıdır.</p>
        </div>
    </footer>



</body>
</asp:Content>
