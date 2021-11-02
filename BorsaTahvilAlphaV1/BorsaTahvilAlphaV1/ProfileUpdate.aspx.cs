using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{
    public partial class ProfileUpdate : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            tblKullanici kllnc = db.tblKullanici.Find(int.Parse(Session["KullaniciId"].ToString()));
            KullaniciNickName.Text = Session["KullaniciAdi"].ToString();
            KullaniciEmail.Text = kllnc.KullaniciEmail;
            KullaniciNickName.Enabled = false;
            KullaniciEmail.Enabled = false;

            kayitEt.Enabled = false;
        }

        protected void BilgiCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (BilgiGosterCheckBox.Checked)
            {
                kayitEt.Enabled = true;
                SqlConnection baglanti = new SqlConnection(@"data source=DESKTOP-0JITI74\SQLEXPRESS;initial catalog=DbBorsaTahvil;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework");
                baglanti.Open();
                SqlCommand komut = new SqlCommand("select KullaniciAdi,KullaniciSoyadi,KullaniciEmail,KullaniciParola,KullaniciNickName from tblKullanici where KullaniciNickName =@kullaniciNickName ", baglanti);
                komut.Parameters.AddWithValue("@kullaniciNickName", KullaniciNickName.Text);
                SqlDataReader da = komut.ExecuteReader();

                while (da.Read())
                {
                    KullaniciAd.Text = da.GetValue(0).ToString();
                    KullaniciSoyad.Text = da.GetValue(1).ToString();
                    KullaniciEmail.Text = da.GetValue(2).ToString();
                    KullaniciParola.Text = da.GetValue(3).ToString();
                }
                baglanti.Close();
            }
            else
            {
                KullaniciAd.Text = "";
                KullaniciSoyad.Text = "";
                KullaniciEmail.Text = "";
                KullaniciParola.Text = "";
                kayitEt.Enabled = false;
            }
        }

        protected void buttonSave_Click(object sender, EventArgs e)
        {
            if (KullaniciAd.Text == "" || KullaniciSoyad.Text == "" || KullaniciParola.Text == "")
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Boş Alanları Doldurunuz!";
            }
            else
            {
                DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
                tblKullanici kullaniciguncelle = db.tblKullanici.Where(x => x.KullaniciNickName == KullaniciNickName.Text).FirstOrDefault();
                tblKullanici kullanici = db.tblKullanici.Find(kullaniciguncelle.Id);
                kullanici.KullaniciAdi = KullaniciAd.Text;
                kullanici.KullaniciSoyadi = KullaniciSoyad.Text;
                kullanici.KullaniciParola = KullaniciParola.Text;

                db.SaveChanges();

                hataMesaji.ForeColor = Color.Green;
                hataMesaji.Text = "Kullanıcı Başarı İle Güncellendi";
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
        protected void geriDon_Click(object sender, EventArgs e)
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
    }
}
