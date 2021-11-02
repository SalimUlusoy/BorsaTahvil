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
    public partial class EditorMakaleYazma : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void makaleEkle_Click(object sender, EventArgs e)
        {
            if (baslik.Text == "" || makaleGovde.Text == "")
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Alanlar Boş Bırakılamaz!";
            }
            else 
            if(baslik.Text.Length > 30)
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Başlık 30 Karakterden Fazla Olamaz!";
            }
            else 
            if (makaleGovde.Text.Length < 15 || makaleGovde.Text.Length > 250)
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Makale 15 ila 250 Karakter Arasında Olmalı!";
            }
            else
            {
                DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
                tblMakale makale = new tblMakale();
                makale.Baslik = baslik.Text;
                makale.MakaleGovde = makaleGovde.Text;
                makale.Durum = true;

                db.tblMakale.Add(makale);
                db.SaveChanges();

                hataMesaji.ForeColor = Color.Green;
                hataMesaji.Text = "Makale Başarı İle Eklendi.";
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
    }
}