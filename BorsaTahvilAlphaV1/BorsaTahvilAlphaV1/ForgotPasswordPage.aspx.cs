using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{
    public partial class ForgotPasswordPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void epostaGonder_Click(object sender, EventArgs e)
        {

            string pattern = @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
            bool IsNotMatch = Regex.IsMatch(EPosta.Text, pattern);

            using (DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1())
            {
                var user = db.tblKullanici.SingleOrDefault(x => x.KullaniciEmail == EPosta.Text);
                if (String.IsNullOrEmpty(EPosta.Text))
                {
                    hataMesaji.ForeColor = Color.Red;
                    hataMesaji.Text = "Email Kısmı Boş Bırakılamaz.";
                }
                else
                if (IsNotMatch == false)
                {
                    hataMesaji.ForeColor = Color.Red;
                    hataMesaji.Text = "Email Formatı Hatalı.";
                }
                else
                if (user == null || user.KullaniciEmail != EPosta.Text) 
                {
                    hataMesaji.ForeColor = Color.Red;
                    hataMesaji.Text = "<br> Girmiş olduğunuz Email adresi bulunamadı.";
                }
                else
                {
                    try
                    {
                        /* SmtpClient kaynak = new SmtpClient("");  
                         MailAddress gonderen = new MailAddress("milasrec@gmail.com", "Bors Tahvil Web Sitesi");  
                         MailAddress giden = new MailAddress(user.KullaniciEmail.ToString(), "Site Üyesi");  
                         MailMessage mesaj = new MailMessage(gonderen, giden);
                         mesaj.Subject = "Şifreniz";   
                         mesaj.Body = "Borsa Tahvil Web Sitesinden şifremi unuttum talebinde bulundunuz.<br>Şifreniz: " + user.KullaniciParola.ToString();  
                         kaynak.Send(mesaj);  
                         hataMesaji.Text = "Gönderildi";
                         */

                        hataMesaji.ForeColor = System.Drawing.Color.LimeGreen;
                        MailMessage mailMessage = new MailMessage();

                        StringBuilder sbEmailBody = new StringBuilder();
                        sbEmailBody.Append("Sayın " + user.KullaniciAdi + ",<br/><br/>");
                        sbEmailBody.Append("Bu bir şifre hatırlatma E-Postasıdır Lütfen Şifrenizi Kimseyle Paylaşmayınız");
                        sbEmailBody.Append("<br/>"); sbEmailBody.Append("Şifreniz: " + user.KullaniciParola);
                        sbEmailBody.Append("<br/><br/>");
                        sbEmailBody.Append("<b>Borsa Tahvil</b>");

                        mailMessage.IsBodyHtml = true;

                        mailMessage.Body = sbEmailBody.ToString();
                        mailMessage.Subject = "Şifreniz";
                        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

                        smtpClient.Credentials = new System.Net.NetworkCredential()
                        {
                            UserName = "salimulusoy25@gmail.com",
                            Password = "salimkral2E"
                        };
                        string to = user.KullaniciEmail;
                        string from = "salimulusoy25@gmail.com";

                        smtpClient.EnableSsl = true;

                        mailMessage.From = new MailAddress(from);
                        mailMessage.To.Add(to);
                        smtpClient.Send(mailMessage);
                        smtpClient.UseDefaultCredentials = false;

                        hataMesaji.ForeColor = Color.Green;
                        hataMesaji.Text = "Şifre Başarı İle Gönderildi.";
                    }
                    catch(Exception hata)
                    {

                        hataMesaji.Text = hata.Message;
                    }
                }
            }
        }

        protected void giris_Ekranina_Don_Click(object sender, EventArgs e)
        {
                Response.Redirect("LoginPage.aspx");
        }
    }
}