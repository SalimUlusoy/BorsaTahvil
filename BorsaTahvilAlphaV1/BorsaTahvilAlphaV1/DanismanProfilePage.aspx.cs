using BorsaTahvilAlphaV1.CsharpClasses;
using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{
    public partial class DanismanProfilePage : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {

            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(Session["KullaniciId"].ToString()));
            kullaniciAdi.InnerText = kullanici.KullaniciAdi + " " + kullanici.KullaniciSoyadi;
            postKullaniciAdi.InnerText = kullanici.KullaniciAdi + " " + kullanici.KullaniciSoyadi;
            postKullaniciAdi2.InnerText = kullanici.KullaniciAdi + " " + kullanici.KullaniciSoyadi;

            int Derece = Convert.ToInt32(kullanici.Derece);
            String deger = Convert.ToString(Derece / kullanici.DereceKisiSayisi);
            starText.InnerText = deger;

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
        protected void oyVerButton_Click(object sender, EventArgs e)
        {
            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(Session["KullaniciId"].ToString()));
            if(kullanici.Derece == null)
            {
                kullanici.Derece = double.Parse(ddlVoting.SelectedValue);
            }
            else
            if(kullanici.DereceKisiSayisi == null)
            {
                kullanici.DereceKisiSayisi = int.Parse("1");
            }
            else
            {
                kullanici.Derece += double.Parse(ddlVoting.SelectedValue);
                kullanici.DereceKisiSayisi += int.Parse("1");
            }
            db.SaveChanges();
            Response.Write("Kullanıcı Başarı İle Değerlendirildi.");
        }

        private void KullanicilariListele()
        {
            int ID = int.Parse(Session["KullaniciId"].ToString());

            var kullanicilar = db.tblPost.Where(p => p.KullaniciId == ID).Select(s => new
            {
                Id = s.Id,
                Post_isim = s.Post_isim,
                Post_aciklama = s.Post_aciklama,
                KullaniciId = s.KullaniciId

            }).ToList();
            TaskGridView.DataSource = kullanicilar;
            TaskGridView.DataBind();

        }
        protected void yorumEkle_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(yorumtxt.Text))
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Yorum Kısmı Boş Olmamalıdır.";
            }
            else
            {
                tblPost post = new tblPost();
                post.Post_isim = postKullaniciAdi2.InnerText;
                post.Post_aciklama = yorumtxt.Text;
                post.KullaniciId = int.Parse(Session["KullaniciId"].ToString());
                db.tblPost.Add(post);
                db.SaveChanges();
                hataMesaji.ForeColor = Color.Green;
                hataMesaji.Text = "Yorumunuz Başarı ile Eklenmiştir.";
                KullanicilariListele();
            }
        }

        protected void TaskGridView_RowCancellingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TaskGridView.EditIndex = -1;
            KullanicilariListele();
        }
        protected void TaskGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = TaskGridView.Rows[e.RowIndex].FindControl("lbl_Id") as Label;
            TextBox postisim = TaskGridView.Rows[e.RowIndex].FindControl("txt_Post_isim") as TextBox;
            TextBox postaciklama = TaskGridView.Rows[e.RowIndex].FindControl("txt_Post_aciklama") as TextBox;
            TextBox KullaniciId = TaskGridView.Rows[e.RowIndex].FindControl("txt_KullaniciId") as TextBox;


            tblPost post = db.tblPost.Find(int.Parse(id.Text));
            post.Post_isim = postisim.Text;
            post.Post_aciklama = postaciklama.Text;

            db.SaveChanges();
            Response.Write("Postunuz Başarı İle Güncellendi.");

            TaskGridView.EditIndex = -1;
            KullanicilariListele();

        }

        protected void TaskGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TaskGridView.EditIndex = e.NewEditIndex;
            KullanicilariListele();
        }
    }
}