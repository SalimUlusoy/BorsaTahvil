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
    public partial class MainScreen : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            Id.Text = Session["KullaniciId"].ToString();

            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(Id.Text));
            labelCuzdan.Text = kullanici.KullaniciCuzdanPara.ToString();



        }

        protected void Logo_onClick(object sender, EventArgs e)
        {
            Response.Redirect("MainScreen.aspx");
        }

        protected void profilePage_Click(object sender, EventArgs e)
        {
            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(Id.Text));

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
        protected void destekGonder_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txt_DestekNot.Text))
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Destek Notu Boş Olamaz.";
            }
            else
            {
                DateTime date = DateTime.Now;
                tblDestek destek = new tblDestek();
                destek.DestekNotu = txt_DestekNot.Text;
                destek.DestekTipi = destekList.Value;
                destek.Tarih = date;
                destek.Durum = true;
                destek.KullaniciId = int.Parse(Session["KullaniciId"].ToString());

                db.tblDestek.Add(destek);
                db.SaveChanges();
                hataMesaji.ForeColor = Color.Green;
                hataMesaji.Text = "Destek Talebiniz Alınmıştır.";

            }
        }
    }
}