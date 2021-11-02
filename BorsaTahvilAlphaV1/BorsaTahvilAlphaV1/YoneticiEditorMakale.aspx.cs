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
    public partial class YoneticiEditorMakale : System.Web.UI.Page
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
                var kullanicilar = db.tblMakale.Select(s => new
                {
                    Id = s.Id,
                    Baslik = s.Baslik,
                    MakaleGovde = s.MakaleGovde,
                    Durum = s.Durum

                }).ToList();
                TaskGridView.DataSource = kullanicilar;
                TaskGridView.DataBind();

            if (kullanicilar.Count == 0 )
            {
                hataMesaji.ForeColor = Color.Red;
                hataMesaji.Text = "Editörler Şu Ana Kadar Makale Eklemediler.";
            }

        }

        protected void TaskGridView_RowCancellingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TaskGridView.EditIndex = -1;
            KullanicilariListele();
        }
        protected void TaskGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = TaskGridView.Rows[e.RowIndex].FindControl("lbl_Id") as Label;
            TextBox Baslik = TaskGridView.Rows[e.RowIndex].FindControl("txt_Baslik") as TextBox;
            TextBox MakaleGovde = TaskGridView.Rows[e.RowIndex].FindControl("txt_MakaleGovde") as TextBox;
            TextBox Durum = TaskGridView.Rows[e.RowIndex].FindControl("txt_Durum") as TextBox;


            tblMakale post = db.tblMakale.Find(int.Parse(id.Text));
            post.Baslik = Baslik.Text;
            post.MakaleGovde = MakaleGovde.Text;
            post.Durum = bool.Parse( Durum.Text);

            db.SaveChanges();
            Response.Write("Makale Başarı İle Güncellendi.");

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