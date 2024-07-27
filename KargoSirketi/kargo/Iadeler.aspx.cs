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
    public partial class Iadeler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadIadeBilgileri();
            }
        }

        private void LoadIadeBilgileri()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["kargo_takipConnectionString"].ConnectionString;
            string query = "SELECT TOP 1 iade_durumuu, iade_kodu, iade_tarihi, iade_firma, iade_kisi, magaza_lokasyon, musteri_lokasyon FROM iade ORDER BY id DESC";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        string iadeDurumu = reader["iade_durumuu"].ToString();
                        lblDurum.Text = iadeDurumu;
                        
                        lblIadeKodu.Text = reader["iade_kodu"].ToString();
                        lblIadeTarihi.Text = reader["iade_tarihi"].ToString();
                        lblIadeFirma.Text = reader["iade_firma"].ToString();
                        lblIadeKisi.Text = reader["iade_kisi"].ToString();
                        lblMagazaLokasyon.Text = reader["magaza_lokasyon"].ToString();
                        lblMusteriLokasyon.Text = reader["musteri_lokasyon"].ToString();
                    }
                }
            }
        }
    }
}