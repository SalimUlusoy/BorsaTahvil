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
    public partial class LoginPage : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == false)
            {
                string parola = password.Text;
                password.TextMode = TextBoxMode.Password;
                password.Attributes.Add("value", parola);

            }
            else
            {
                password.TextMode = TextBoxMode.SingleLine;
            }
        }
        protected void girisYap_Click(object sender, EventArgs e)
        {
            if (username.Text == "" && password.Text == "")
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Alanlar Boş Bırakılamaz.";
            }else
            if (String.IsNullOrEmpty(username.Text))
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Kullanıcı Adı Alanı Boş Bırakılamaz.";
            }
            else
            if (String.IsNullOrEmpty(password.Text))
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Şifre Alanı Boş Bırakılamaz.";
            }
            else
                using (DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1())
                {
                    var user = db.tblKullanici.SingleOrDefault(x => x.KullaniciNickName == username.Text);

                    if (user == null || user.KullaniciNickName != username.Text)
                    {
                        hataMesaji.ForeColor = Color.Red;
                        hataMesaji.Text = "Kullanıcı Adı Yanlış Girilmiş Durumda.";
                    }
                    else 
                    if(user.YasakliKullanicilar != true)
                    {
                        hataMesaji.ForeColor = Color.Red;
                        hataMesaji.Text = "Sitemizden Uzaklaştırılmış Durumdasınız.";
                    }
                    else
                    {
                        if (user.KullaniciParola == password.Text && user.Yetki == 1)
                        {
                            Session["KullaniciAdi"] = username.Text;
                            Session["KullaniciId"] = user.Id.ToString();
                            Response.Redirect("MainScreen.aspx");
                        }
                        else if (user.KullaniciParola == password.Text && user.Yetki == 2)
                        {
                            Session["KullaniciAdi"] = username.Text;
                            Session["KullaniciId"] = user.Id.ToString();
                            Response.Redirect("MainScreen.aspx");
                        }
                        else if (user.KullaniciParola == password.Text && user.Yetki == 3)
                        {
                            Session["KullaniciAdi"] = username.Text;
                            Session["KullaniciId"] = user.Id.ToString();
                            Response.Redirect("MainScreen.aspx");
                        }
                        else if (user.KullaniciParola == password.Text && user.Yetki == 4)
                        {
                            Session["KullaniciAdi"] = username.Text;
                            Session["KullaniciId"] = user.Id.ToString();
                            Response.Redirect("YoneticiPaneli.aspx");
                        }
                        else
                        {
                            hataMesaji.ForeColor = Color.Red;
                            hataMesaji.Text = "Parola Yanlış Girilmiş Durumda.";
                        }
                    }
                }
        }

        protected void kayitButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegisterPage.aspx");
        }
        protected void sifremiUnuttum_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPasswordPage.aspx");
        }
    }
}