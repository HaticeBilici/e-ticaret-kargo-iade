using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace kargo
{
    public partial class iade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (!IsPostBack)
            {
                // Sayfa ilk yüklendiğinde, yeni bir iade kodu oluşturulacak.
             
            }
        }
        protected void btnGetir_Click(object sender, EventArgs e)
        {
            string iadeKodu = txtIadeKodu.Text.Trim();

            string connString = ConfigurationManager.ConnectionStrings["kargo_takipConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT iade_tarihi, iade_firma, iade_kisi, musteri_lokasyon, magaza_lokasyon, iade_durumuu FROM iade WHERE iade_kodu = @iadeKodu";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@iadeKodu", iadeKodu);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtIadeTarihi.Text = reader["iade_tarihi"].ToString();
                        txtIadeFirma.Text = reader["iade_firma"].ToString();
                        txtIadeKisi.Text = reader["iade_kisi"].ToString();
                        txtMusteriLokasyon.Text = reader["musteri_lokasyon"].ToString();
                        txtMagazaLokasyon.Text = reader["magaza_lokasyon"].ToString();
                        ddlIadeDurumu.SelectedValue = reader["iade_durumuu"].ToString();

                        iadeBilgileri.Style["display"] = "block";
                    }
                    else
                    {
                        lblMessage.Text = "İade kodu bulunamadı.";
                        iadeBilgileri.Style["display"] = "none";
                    }
                    reader.Close();
                }
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            string iadeKodu = txtIadeKodu.Text.Trim();
            string iadeDurumu = ddlIadeDurumu.SelectedValue;
            string iadeTarihi = txtIadeTarihi.Text.Trim();
            string iadeFirma = txtIadeFirma.Text.Trim();
            string iadeKisi = txtIadeKisi.Text.Trim();
            string musteriLokasyon = txtMusteriLokasyon.Text.Trim();
            string magazaLokasyon = txtMagazaLokasyon.Text.Trim();

            string connString = ConfigurationManager.ConnectionStrings["kargo_takipConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "IF EXISTS (SELECT 1 FROM iade WHERE iade_kodu = @iadeKodu) " +
                               "UPDATE iade SET iade_durumuu = @iadeDurumu, iade_tarihi = @iadeTarihi, iade_firma = @iadeFirma, iade_kisi = @iadeKisi, musteri_lokasyon = @musteriLokasyon, magaza_lokasyon = @magazaLokasyon WHERE iade_kodu = @iadeKodu " +
                               "ELSE " +
                               "INSERT INTO iade (iade_kodu, iade_durumuu, iade_tarihi, iade_firma, iade_kisi, musteri_lokasyon, magaza_lokasyon) VALUES (@iadeKodu, @iadeDurumu, @iadeTarihi, @iadeFirma, @iadeKisi, @musteriLokasyon, @magazaLokasyon)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@iadeKodu", iadeKodu);
                    cmd.Parameters.AddWithValue("@iadeDurumu", iadeDurumu);
                    cmd.Parameters.AddWithValue("@iadeTarihi", iadeTarihi);
                    cmd.Parameters.AddWithValue("@iadeFirma", iadeFirma);
                    cmd.Parameters.AddWithValue("@iadeKisi", iadeKisi);
                    cmd.Parameters.AddWithValue("@musteriLokasyon", musteriLokasyon);
                    cmd.Parameters.AddWithValue("@magazaLokasyon", magazaLokasyon);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "İade durumu güncellendi.";
                }
            }
        }
    } 
}
