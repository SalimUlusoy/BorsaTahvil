using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{
    public partial class PostlarSayfas : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                KullanicilariListele();
            }
        }
        protected void profilePage_Click(object sender, EventArgs e)
        {
            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(Session["KullaniciId"].ToString()));

            if (kullanici.Yetki == 1)
            {
                Response.Redirect("UserProfilePage.aspx");
            }
            else if (kullanici.Yetki == 2)
            {
                Response.Redirect("DanismanProfilePage.aspx");
            }
            else if (kullanici.Yetki == 3)
            {
                Response.Redirect("EditorProfilePage.aspx");
            }
        }

        private void KullanicilariListele()
        {

            var kullanicilar = db.tblPost.Where(p => p.Durum == true).Select(s => new
            {
                Id = s.Id,
                Post_isim = s.Post_isim,
                Post_aciklama = s.Post_aciklama,
                KullaniciId = s.KullaniciId

            }).ToList();
            TaskGridView.DataSource = kullanicilar;
            TaskGridView.DataBind();

            if (kullanicilar.Count == 0)
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Henüz Bir Post Bulunmamaktadır İlk Ekleyen Siz Olun.";
            }

        }
    }
}