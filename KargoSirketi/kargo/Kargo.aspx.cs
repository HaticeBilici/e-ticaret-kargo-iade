using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using kargo.models;
using System.Configuration;
using System.Data.SqlClient;

namespace kargo
{
    public partial class Kargo : System.Web.UI.Page
    {
        // Tanımlı kontroller
        protected Label lblMessage;
        protected TextBox txtTakipNumarasi;
        protected TextBox txtGonderen;
        protected TextBox txtAlici;
        protected TextBox txtDurum;
        protected TextBox txtLokasyon;
        protected TextBox txtTarih;
        protected TextBox txtTeslimAlan;
        protected TextBox txtGonderiNumarasi;
        protected Button btnEkle;
        protected DropDownList ddlSiparisNumaralari;
        protected Button btnGetir;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadSiparisNumaralari();

                if (ddlSiparisNumaralari.Items.Count > 0)
                {
                    string selectedSiparisNo = ddlSiparisNumaralari.SelectedValue;
                    if (!string.IsNullOrEmpty(selectedSiparisNo))
                    {
                        LoadKargoDetails(selectedSiparisNo);
                    }
                }

            }
        }
        private void LoadSiparisNumaralari()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["kargo_takipConnectionString"].ConnectionString;
            string query = "SELECT DISTINCT siparis_no FROM kargoBilgi";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlSiparisNumaralari.DataSource = reader;
                ddlSiparisNumaralari.DataTextField = "siparis_no";
                ddlSiparisNumaralari.DataValueField = "siparis_no";
                ddlSiparisNumaralari.DataBind();
                reader.Close();
            }
        }

        private void LoadKargoDetails(string selectedSiparisNo)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["kargo_takipConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 1 gonderen, alici, lokasyon, takip_no FROM kargoBilgi WHERE siparis_no = @siparis_no";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@siparis_no", selectedSiparisNo);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtGonderen.Text = reader["gonderen"].ToString();
                        txtAlici.Text = reader["alici"].ToString();
                        txtLokasyon.Text = reader["lokasyon"].ToString();
                        txtTakipNumarasi.Text = reader["takip_no"].ToString();
                    }
                    reader.Close();
                }
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["kargo_takipConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string siparisNo = ddlSiparisNumaralari.SelectedValue;
                string takipNo = txtTakipNumarasi.Text;

                string query = "IF EXISTS (SELECT 1 FROM kargoBilgi WHERE siparis_no = @siparis_no) " +
                               "UPDATE kargoBilgi SET gonderen = @gonderen, alici = @alici, durum = @durum, lokasyon = @lokasyon, tarih = @tarih, teslim_alan = @teslim_alan, takip_no = @takip_no WHERE siparis_no = @siparis_no " +
                               "ELSE " +
                               "INSERT INTO kargoBilgi (takip_no, gonderen, alici, durum, lokasyon, tarih, teslim_alan, siparis_no) VALUES (@takip_no, @gonderen, @alici, @durum, @lokasyon, @tarih, @teslim_alan, @siparis_no)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@takip_no", takipNo);
                    cmd.Parameters.AddWithValue("@gonderen", txtGonderen.Text);
                    cmd.Parameters.AddWithValue("@alici", txtAlici.Text);
                    cmd.Parameters.AddWithValue("@durum", txtDurum.Text);
                    cmd.Parameters.AddWithValue("@lokasyon", txtLokasyon.Text);
                    cmd.Parameters.AddWithValue("@tarih", txtTarih.Text);
                    cmd.Parameters.AddWithValue("@teslim_alan", txtTeslimAlan.Text);
                    cmd.Parameters.AddWithValue("@siparis_no", siparisNo);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Kargo bilgileri başarıyla eklendi.";
                }
            }
        }

        protected void btnGetir_Click(object sender, EventArgs e)
        {
            string selectedSiparisNo = ddlSiparisNumaralari.SelectedValue;

            LoadKargoDetails(selectedSiparisNo);

            if (string.IsNullOrEmpty(txtTakipNumarasi.Text))
            {
                txtTakipNumarasi.Text = GenerateUniqueIdentifier();
            }
        }

        private string GenerateUniqueIdentifier()
        {
            return Guid.NewGuid().ToString("N").Substring(0, 10).ToUpper();
        }
    }
}

