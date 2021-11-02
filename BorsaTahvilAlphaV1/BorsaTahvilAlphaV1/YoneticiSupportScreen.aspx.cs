using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{

    public partial class YoneticiSupportScreen : System.Web.UI.Page
    {
        DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1();
        protected static string Id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KullanicilariListele();
            }
        }

        private void KullanicilariListele()
        {
            var kullanicilar = db.tblDestek.Where(p => p.Durum == true).Select(s => new
            {
                Id = s.Id,
                DestekNotu = s.DestekNotu,
                Tarih = s.Tarih,
                DestekTipi = s.DestekTipi,
                KullaniciId = s.KullaniciId,
                Durum = s.Durum == true

            }).ToList();
            TaskGridView.DataSource = kullanicilar;
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
            TextBox DestekNotu = TaskGridView.Rows[e.RowIndex].FindControl("txt_DestekNotu") as TextBox;
            TextBox Tarih = TaskGridView.Rows[e.RowIndex].FindControl("txt_Tarih") as TextBox;
            TextBox DestekTipi = TaskGridView.Rows[e.RowIndex].FindControl("txt_DestekTipi") as TextBox;
            TextBox KullaniciId = TaskGridView.Rows[e.RowIndex].FindControl("txt_KullaniciId") as TextBox;
            TextBox Durum = TaskGridView.Rows[e.RowIndex].FindControl("txt_Durum") as TextBox;


            tblDestek destekkk = db.tblDestek.Find(int.Parse(id.Text));
            destekkk.DestekNotu = DestekNotu.Text;
            destekkk.Tarih = DateTime.Parse(Tarih.Text);
            destekkk.DestekTipi = DestekTipi.Text;
            destekkk.KullaniciId = int.Parse(KullaniciId.Text);
            destekkk.Durum = bool.Parse(Durum.Text);
            db.SaveChanges();
            Response.Write("Destek Kaydı Başarı İle Güncellendi.");

            TaskGridView.EditIndex = -1;
            KullanicilariListele();

        }

        protected void TaskGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TaskGridView.EditIndex = e.NewEditIndex;
            KullanicilariListele();
        }
        protected void epostaGonder_Click(object sender, EventArgs e)
        {

            using (DbBorsaTahvilEntities1 db = new DbBorsaTahvilEntities1())
            {
                var user = db.tblKullanici.SingleOrDefault(x => x.KullaniciEmail == EPosta.Text);

                if (user == null || user.KullaniciEmail != EPosta.Text)
                {
                    hataMesaji.Text = "<br> Girmiş olduğunuz Email adresi bulunamadı.";
                }
                else
                if(yorumtxt.Text == "")
                {
                    hataMesaji.ForeColor = Color.Red;
                    hataMesaji.Text = "Yorum Bölümü Boş Olamaz!";
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

                        MailMessage mailMessage = new MailMessage();

                        StringBuilder sbEmailBody = new StringBuilder();
                        sbEmailBody.Append("Sayın " + user.KullaniciAdi + ",<br/><br/>");
                        sbEmailBody.Append("Bu Bir Destek E-Postasıdır Lütfen E-Posta Adresimiz Üzerinden Yanıtlamaktan Çekinme");
                        sbEmailBody.Append("<br/>"); sbEmailBody.Append("Cevabımız: " + yorumtxt.Text);
                        sbEmailBody.Append("<br/><br/>");
                        sbEmailBody.Append("<b>Borsa Tahvil</b>");

                        mailMessage.IsBodyHtml = true;

                        mailMessage.Body = sbEmailBody.ToString();
                        mailMessage.Subject = "Destek Talebiniz Hakkında";
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

                        hataMesaji.ForeColor = System.Drawing.Color.LimeGreen;
                        hataMesaji.Text = "Destek Notu Geçerli Email Adresine Gönderildi.";
                    }
                    catch (Exception hata)
                    {

                        hataMesaji.Text = hata.Message;
                    }
                }
            }
        }
        protected void btnAra_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(IdText.Text);
            var user = db.tblKullanici.SingleOrDefault(x => x.Id == ID);

            if (user == null || user.Id != int.Parse(IdText.Text))
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Bu Id'ye Sahip Bir Kullanıcı Bulunamadı.";
            }
            else
            if (String.IsNullOrEmpty(IdText.Text))
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Alanlar Boş Bırakılamaz.";
            }
            else
            {
                tblKullanici kullanici = db.tblKullanici.Find(int.Parse(IdText.Text));
                EPosta.Text = kullanici.KullaniciEmail;

                hataMesaji.ForeColor = Color.Green;
                hataMesaji.Text = "Email Adresi Başarılı Bir Şekilde Getirildi.";
            }
        }
    }
}