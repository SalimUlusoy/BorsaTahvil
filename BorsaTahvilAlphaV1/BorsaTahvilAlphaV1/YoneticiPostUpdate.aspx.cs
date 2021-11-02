using BorsaTahvilAlphaV1.Model.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BorsaTahvilAlphaV1
{
    public partial class YoneticiPostUpdate : System.Web.UI.Page
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

                    var kullanicilar = db.tblPost.Select(s => new
                    {
                        Id = s.Id,
                        Post_isim = s.Post_isim,
                        Post_aciklama = s.Post_aciklama,
                        KullaniciId = s.KullaniciId,
                        Durum = s.Durum

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
            TextBox PostIsim = TaskGridView.Rows[e.RowIndex].FindControl("txt_Post_isim") as TextBox;
            TextBox PostAciklama = TaskGridView.Rows[e.RowIndex].FindControl("txt_Post_aciklama") as TextBox;
            TextBox KullaniciId = TaskGridView.Rows[e.RowIndex].FindControl("txt_KullaniciId") as TextBox;
            TextBox Durum = TaskGridView.Rows[e.RowIndex].FindControl("txt_Durum") as TextBox;

            tblPost post = db.tblPost.Find(int.Parse(id.Text));
            post.Post_isim = PostIsim.Text;
            post.Post_aciklama = PostAciklama.Text;
            post.KullaniciId = int.Parse(KullaniciId.Text);
            post.Durum = bool.Parse(Durum.Text);

            db.SaveChanges();
            Response.Write("Post Başarı İle Güncellendi.");

            TaskGridView.EditIndex = -1;
            KullanicilariListele();

        }

            protected void TaskGridView_RowEditing(object sender, GridViewEditEventArgs e)
            {
                TaskGridView.EditIndex = e.NewEditIndex;
                KullanicilariListele();
            }
    }
}