using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{
    public partial class KullaniciIslemleriEkrani : System.Web.UI.Page
    {
        protected static string Id;

        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KullanicilariListele();
            }
            bilgilendirmeMesaji.Text = "Yetki Bölümünde 1 Olanlar Kullanıcı, 2 Olanlar Danışman, 3 Olanlar Editördür Bunu Göze Alarak Değişiklik Uygulayınız! ";
        }

        private void KullanicilariListele()
        {
            var kullanicilar = db.tblKullanici.Where(k => k.Yetki != 4).Select(s => new
                {
                    Id = s.Id,
                    Adi = s.KullaniciAdi,
                    Soyadi = s.KullaniciSoyadi,
                    Email = s.KullaniciEmail,
                    NickName = s.KullaniciNickName,
                    Yetki = s.Yetki,
                    Durum = s.YasakliKullanicilar

                });
                TaskGridView.DataSource = kullanicilar.ToList();
                TaskGridView.DataBind();

        }

        protected void TaskGridView_RowCancellingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TaskGridView.EditIndex = -1;
            KullanicilariListele();
        }
        protected void TaskGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = TaskGridView.Rows[e.RowIndex].FindControl("lbl_Id") as Label;
            TextBox Adi = TaskGridView.Rows[e.RowIndex].FindControl("txt_Adi") as TextBox;
            TextBox Soyadi = TaskGridView.Rows[e.RowIndex].FindControl("txt_Soyadi") as TextBox;
            TextBox Email = TaskGridView.Rows[e.RowIndex].FindControl("txt_Email") as TextBox;
            TextBox NickName = TaskGridView.Rows[e.RowIndex].FindControl("txt_NickName") as TextBox;
            TextBox Yetki = TaskGridView.Rows[e.RowIndex].FindControl("txt_Yetki") as TextBox;
            TextBox Durum = TaskGridView.Rows[e.RowIndex].FindControl("txt_Durum") as TextBox;


            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(id.Text));
            kullanici.KullaniciAdi = Adi.Text;
            kullanici.KullaniciSoyadi = Soyadi.Text;
            kullanici.KullaniciEmail = Email.Text;
            kullanici.KullaniciNickName = NickName.Text;
            kullanici.Yetki = int.Parse(Yetki.Text);
            kullanici.YasakliKullanicilar = bool.Parse(Durum.Text);
            db.SaveChanges();

            hataMesaji.ForeColor = Color.Green;
            hataMesaji.Text = "Kullanıcı Başarı İle Güncellendi.";

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