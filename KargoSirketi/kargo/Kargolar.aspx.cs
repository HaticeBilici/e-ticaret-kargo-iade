using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace kargo
{
    public partial class Kargolar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadKargoDetails();
            }
        }
        private void LoadKargoDetails()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["kargo_takipConnectionString"].ConnectionString;
            string query = "SELECT TOP 1 takip_no, gonderen, alici, durum, lokasyon, tarih, teslim_alan, siparis_no FROM kargoBilgi ORDER BY id DESC";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblDurum.Text = reader["durum"] != DBNull.Value ? reader["durum"].ToString() : "Durum bilgisi yok";
                        lblTeslimAlan.Text = reader["teslim_alan"] != DBNull.Value ? reader["teslim_alan"].ToString() : "Teslim alan bilgisi yok";
                        lblTakipNo.Text = reader["takip_no"] != DBNull.Value ? reader["takip_no"].ToString() : "Takip numarası bilgisi yok";
                        lblGonderiNo.Text = reader["siparis_no"] != DBNull.Value ? reader["siparis_no"].ToString() : "Sipariş numara bilgisi yok";

                        if (reader["tarih"] != DBNull.Value)
                        {
                            lblTarih.Text = Convert.ToDateTime(reader["tarih"]).ToString("dd.MM.yyyy HH:mm");
                        }
                        else
                        {
                            lblTarih.Text = "Tarih bilgisi yok";
                        }
                    }
                }
            }
        }
    }
}