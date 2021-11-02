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
    public partial class Deposit : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void buttonSave_Click(object sender, EventArgs e)
        {
            DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(Session["KullaniciId"].ToString()));
            //int paraMiktarii = kullanici.KullaniciCuzdanPara + int.Parse(paraMiktari.Text);

            if (String.IsNullOrEmpty(paraMiktari.Text))
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Para Miktarı Alanı Boş Olamaz!";
            }
            else
                if (int.Parse(paraMiktari.Text) == 0.00 || int.Parse(paraMiktari.Text) < 0.00)
                {
                    hataMesaji.ForeColor = Color.Red;
                    hataMesaji.Text = "Para Miktarı - Değer veya 0 Olamaz!";
                }
                else { 
                if (kullanici.KullaniciCuzdanPara == null)
                {
                    kullanici.KullaniciCuzdanPara = decimal.Parse(paraMiktari.Text);
                }
                else
                {
                    kullanici.KullaniciCuzdanPara += decimal.Parse(paraMiktari.Text);
                }
                tblManuelIslem ıslemKaydi = new tblManuelIslem();
                ıslemKaydi.IslemIsim = "Para Yatırma";
                ıslemKaydi.AlinanMiktar = int.Parse(paraMiktari.Text);
                ıslemKaydi.KullaniciId = int.Parse(Session["KullaniciId"].ToString());

                db.tblManuelIslem.Add(ıslemKaydi);
                db.SaveChanges();

                hataMesaji.ForeColor = Color.Green;
                hataMesaji.Text = "Para Yatırma İşlemi Başarılı.";
            }
        }
    }
}