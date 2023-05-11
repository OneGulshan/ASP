using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace JobPortal
{
    public partial class Recruiter_Serverstateide : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
            }
        }

        public void ClearControl()
        {
            ddlcc.SelectedValue = "0";
            txtname.Text = "";
            txtemail.Text = "";
            txtpass.Text = "";
            txtcomment.Text = "";
            btninsert.Text = "Submit";            
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Recruiter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 1);
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@category", ddlcc.SelectedValue);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@password", txtpass.Text);
            cmd.Parameters.AddWithValue("@comment", txtcomment.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ClearControl();
        }

        public void BindCategory()
        {
            SqlCommand cmd = new SqlCommand("sp_Recruiter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 6);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlcc.DataValueField = "ctid";
            ddlcc.DataTextField = "ctname";
            ddlcc.DataSource = dt;
            ddlcc.DataBind();
            ddlcc.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }
}