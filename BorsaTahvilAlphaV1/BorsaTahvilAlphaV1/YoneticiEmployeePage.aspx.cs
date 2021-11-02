using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{
    public partial class YoneticiEmployeePage : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KullanicilariListele();
            }
        }

        private void KullanicilariListele()
        {
            try
            {
                var kullanicilar = db.tblKullanici.Where(k => k.YasakliKullanicilar == true && k.Yetki == 4).Select(s => new
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
            catch
            {

            }
        }
    }
}