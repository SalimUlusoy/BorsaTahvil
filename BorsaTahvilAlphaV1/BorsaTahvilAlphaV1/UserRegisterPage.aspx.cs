using BorsaTahvilAlphaV1.CsharpClasses;
using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{
    public partial class UserRegisterPage : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DbBorsaTahvilConnectionString"].ConnectionString;
        }

        private void ExecuteInsert(Kullanici kullanici)
        {
            using (SqlConnection sqlConn = new SqlConnection(GetConnectionString()))
            {
                string sql = @"INSERT INTO tblKullanici (KullaniciAdi,KullaniciSoyadi,KullaniciEmail,KullaniciNickName,KullaniciParola,Yetki) 
                VALUES (@KullaniciAdi,@KullaniciSoyadi,@KullaniciEmail,@KullaniciNickName,@KullaniciParola,@Yetki)";

                using (SqlCommand sqlCmd = new SqlCommand(sql, sqlConn))
                {
                    sqlCmd.Parameters.AddWithValue("@KullaniciAdi", kullanici.Name);
                    sqlCmd.Parameters.AddWithValue("@KullaniciSoyadi", kullanici.Surname);
                    sqlCmd.Parameters.AddWithValue("@KullaniciEmail", kullanici.Email);
                    sqlCmd.Parameters.AddWithValue("@KullaniciNickName", kullanici.Username);
                    sqlCmd.Parameters.AddWithValue("@KullaniciParola", kullanici.Password);
                    sqlCmd.Parameters.AddWithValue("@Yetki", kullanici.Yetki);

                    sqlConn.Open();
                    sqlCmd.CommandType = CommandType.Text;
                    sqlCmd.ExecuteNonQuery();
                }
            }
        }
        protected void girisButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }
        protected void sifremiUnuttum_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPasswordPage.aspx");
        }

        protected void kayitOl_Click(object sender, EventArgs e)
        {
            string pattern = @"^([0-9a-zA-Z]([-\.\w][0-9a-zA-Z])@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$";
            var user = db.tblKullanici.Any(x => x.KullaniciNickName == username.Text || x.KullaniciEmail == email.Text);
            if (user == true)
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Bu Kullanıcı Adı Veya Email'i Sistemde Mevcuttur.";
            }
            else

            if (name.Text == "" || surname.Text == "" || email.Text == "" || username.Text == "" || password.Text == "")
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Alanlar Boş Bırakılamaz!";
            }
            else
            if (Regex.IsMatch(email.Text, pattern))
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Email Formatı Hatalı.";
            }
            else
            if (password.Text.Length < 6 || password.Text.Length > 12)
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Parola 12 haneden küçük veya 6 haneden büyük olamaz.";
            }
            else
            {
                tblKullanici kullanici = new tblKullanici();
                kullanici.KullaniciAdi = name.Text;
                kullanici.KullaniciSoyadi = surname.Text;
                kullanici.KullaniciEmail = email.Text;
                kullanici.KullaniciNickName = username.Text;
                kullanici.KullaniciParola = password.Text;
                kullanici.Yetki = 1;
                kullanici.YasakliKullanicilar = true;

                db.tblKullanici.Add(kullanici);
                db.SaveChanges();

                hataMesaji.ForeColor = Color.Green;
                hataMesaji.Text = "Kullanıcı Başarı İle Eklendi.";
            }
        }

    }

}