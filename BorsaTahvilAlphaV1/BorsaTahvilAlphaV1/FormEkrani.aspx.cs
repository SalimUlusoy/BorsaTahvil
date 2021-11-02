using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{
    public partial class FormEkrani : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {

            tblKullanici kullanici = db.tblKullanici.Find(int.Parse(Session["KullaniciId"].ToString()));
            labelCuzdan.Text = kullanici.KullaniciCuzdanPara.ToString();

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