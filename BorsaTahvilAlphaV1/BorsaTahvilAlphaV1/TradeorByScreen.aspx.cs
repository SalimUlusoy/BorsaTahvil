using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{
    public partial class TradeorByScreen : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {

            int ID = int.Parse(Session["KullaniciId"].ToString());

            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(Session["KullaniciId"].ToString()));
            labelCuzdan.Text = kullanici.KullaniciCuzdanPara.ToString();


            var alinanlar = (from a in db.KriptoSatimİslem where a.KullaniciId == ID && a.Durum == true select new { a.Id, a.KriptoParaAdi, a.KriptoParaId, a.KullaniciId, a.Miktar }).ToList();

            GridView1.DataSource = alinanlar;
            GridView1.DataBind();
        }

        protected void CheckBoxSatinAl_Clicked(object sender, EventArgs e)
        {
            if (checkbox2.Checked == false)
            {
                checkbox1.Enabled = true;
                cekilecekTutarSatinAl.Visible = false;
                satinAlButton.Visible = false;
                satButton.Visible = false;
                cekilecekTutarText.Visible = false;
                cekilecekTutarSat.Visible = false;
            }
            else
            {
                checkbox1.Enabled = false;
                cekilecekTutarSatinAl.Visible = true;
                cekilecekTutarSat.Visible = false;
                cekilecekTutarText.Visible = true;
                satinAlButton.Visible = true;
                satButton.Visible = false;
            }
        }
        protected void CheckBoxSat_Clicked(object sender, EventArgs e)
        {
            if (checkbox1.Checked == false)
            {
                checkbox2.Enabled = true;
                satinAlButton.Visible = false;
                satButton.Visible = false;
                cekilecekTutarSatinAl.Visible = false;
                cekilecekTutarText.Visible = false;
                cekilecekTutarSat.Visible = false;
                
            }
            else
            {
                checkbox2.Enabled = false;
                satinAlButton.Visible = false;
                satButton.Visible = true;
                cekilecekTutarText.Visible = true;
                cekilecekTutarSatinAl.Visible = false;
                cekilecekTutarSat.Visible = true;
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if(checkbox1.Checked == true)
            {
                if (DropDownList1.SelectedItem == null)
                {
                    hataMesaji.ForeColor = Color.Red;
                    hataMesaji.Text = "Dropdown Boş Lütfen Listele Butonuna Tıklayınız.";
                }
                else
                {
                    CryptoPara kriptopara = db.CryptoPara.Find(int.Parse(DropDownList1.SelectedValue));
                    cekilecekTutarSat.Text = kriptopara.SatisFiyati.Value.ToString();
                }
            }
            else 
            if(checkbox2.Checked == true)
            {
                if (DropDownList1.SelectedItem == null)
                {
                    hataMesaji.ForeColor = Color.Red;
                    hataMesaji.Text = "Dropdown Boş Lütfen Listele Butonuna Tıklayınız.";
                }
                else
                {
                    CryptoPara kriptopara = db.CryptoPara.Find(int.Parse(DropDownList1.SelectedValue));
                    cekilecekTutarSatinAl.Text = kriptopara.AlisFiyati.Value.ToString();

                }
            }
           
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {

            DropDownList1.DataSource = (from c in db.CryptoPara
                                        select new { c.Id, c.KriptoParaAdi }).ToList();

            DropDownList1.DataValueField = "Id";
            DropDownList1.DataTextField = "KriptoParaAdi";
            DropDownList1.DataBind();

            hataMesaji.Text = "";
        }

        protected void SatinAl_Click(object sender, EventArgs e)
        {
            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(Session["KullaniciId"].ToString()));

            if (String.IsNullOrEmpty(islemMiktari.Text))
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "İşlem Miktarı Alanı Gereklidir.";

            }
            else if (String.IsNullOrEmpty(cekilecekTutarSatinAl.Text))
            {
                hataMesaji2.ForeColor = Color.Red;
                hataMesaji2.Text = "Çekilecek Tutar Alanı Gereklidir.";

            }
            else
            {

                decimal ParaMiktari = (decimal)(int.Parse(islemMiktari.Text) * float.Parse(cekilecekTutarSatinAl.Text));
                if (kullanici.KullaniciCuzdanPara == null)
                {
                    hataMesaji2.Visible = false;
                    hataMesaji.ForeColor = Color.Red;
                    hataMesaji.Text = "Cüzdanınızda Yeterli Para Bulunmamaktadır";
                }
                else
                if (kullanici.KullaniciCuzdanPara < ParaMiktari)
                {
                    hataMesaji2.Visible = false;
                    hataMesaji.ForeColor = Color.Red;
                    hataMesaji.Text = "Cüzdanınızda Yeterli Para Bulunmamaktadır";
                }
                else
                {

                    KriptoSatimİslem kriptoparasatim = new KriptoSatimİslem();
                    kriptoparasatim.KriptoParaAdi = DropDownList1.SelectedItem.Text;
                    kriptoparasatim.KullaniciId = int.Parse(Session["KullaniciId"].ToString());
                    kriptoparasatim.Miktar = int.Parse(islemMiktari.Text);
                    kriptoparasatim.KriptoParaId = int.Parse(DropDownList1.SelectedValue);
                    kriptoparasatim.Durum = true;
                    db.KriptoSatimİslem.Add(kriptoparasatim);

                    kullanici.KullaniciCuzdanPara -= ParaMiktari;

                    hataMesaji.ForeColor = Color.Green;
                    hataMesaji.Text = "Sanal Para Başarı İle Alınmıştır";

                    db.SaveChanges();

                    labelCuzdan.Text = kullanici.KullaniciCuzdanPara.ToString();
                    GridView1.DataBind();
                }
            }
        }

        protected void Sat_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(Session["KullaniciId"].ToString());
            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(Session["KullaniciId"].ToString()));

            if (String.IsNullOrEmpty(islemMiktari.Text))
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "İşlem Miktarı Alanı Gereklidir.";

            }
            else if (String.IsNullOrEmpty(cekilecekTutarSat.Text))
            {
                hataMesaji2.ForeColor = Color.Red;
                hataMesaji2.Text = "Çekilecek Tutar Alanı Gereklidir.";

            }
            else
            {
                decimal ParaMiktari = (decimal)(int.Parse(islemMiktari.Text) * float.Parse(cekilecekTutarSat.Text));

                if (kullanici.KullaniciCuzdanPara == null)
                {
                    kullanici.KullaniciCuzdanPara = ParaMiktari;
                }
                else
                {
                    kullanici.KullaniciCuzdanPara += ParaMiktari;
                }
                int kriptoPara = int.Parse(DropDownList1.SelectedValue);
                KriptoSatimİslem kriptoparasatim = db.KriptoSatimİslem.FirstOrDefault(k => k.KriptoParaId == kriptoPara && k.tblKullanici.Id == ID && k.Durum == true);
                if (kriptoparasatim == null)
                {
                    hataMesaji.ForeColor = Color.Red;
                    hataMesaji.Text = "Bu tipte bir sanal paranız bulunmamakta.";
                }
                else
                {


                    if (kullanici.KullaniciCuzdanPara == null)
                    {
                        kullanici.KullaniciCuzdanPara = ParaMiktari;
                    }
                    else
                    {
                        kullanici.KullaniciCuzdanPara += ParaMiktari;
                    }
                    kriptoparasatim.Miktar -= int.Parse(islemMiktari.Text);

                    hataMesaji.ForeColor = Color.Green;
                    hataMesaji.Text = "Sanal Para Başarı İle Satılmıştır";

                    db.SaveChanges();

                    labelCuzdan.Text = kullanici.KullaniciCuzdanPara.ToString();
                    GridView1.DataBind();
                }
            }
        }

        protected void Logo_onClick(object sender, EventArgs e)
        {
            Response.Redirect("MainScreen.aspx");
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
    }
}