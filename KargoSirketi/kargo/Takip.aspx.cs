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
    public partial class Takip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateTakipNumaralari();
            }
        }

        private void PopulateTakipNumaralari()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["kargo_takipConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT DISTINCT takip_no FROM kargoBilgi";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlTakipNumaralari.DataSource = reader;
                    ddlTakipNumaralari.DataTextField = "takip_no";
                    ddlTakipNumaralari.DataValueField = "takip_no";
                    ddlTakipNumaralari.DataBind();
                }
            }
        }
        protected void btnSorgula_Click(object sender, EventArgs e)
        {
            string selectedTakipNo = ddlTakipNumaralari.SelectedValue;
            string connectionString = ConfigurationManager.ConnectionStrings["kargo_takipConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT gonderen AS 'Gönderen', alici AS 'Alıcı', lokasyon AS 'Lokasyon', tarih AS 'Tarih', teslim_alan AS 'Teslim Alan', siparis_no AS 'Siparis Numarası' FROM kargoBilgi WHERE takip_no = @takip_no";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@takip_no", selectedTakipNo);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvKargo.DataSource = dt;
                    gvKargo.CssClass = "custom-gridview"; // GridView'e özel CSS sınıfını atayalım
                    gvKargo.DataBind();
                }
            }
        }
    }
}