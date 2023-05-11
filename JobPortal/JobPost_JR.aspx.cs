using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace JobPortal
{
    public partial class Recruiter_JobPost : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["rid"] != null && Session["rid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    BindJobProfile();

                }

                if (Request.QueryString["pp"] != null && Request.QueryString["pp"].ToString() != "") //No Null and No Blank jab hamare pp query string me value aegi tabhi edit ka func call hoga or tabhi edit hoga otherwise nahi
                {
                    if (!IsPostBack)
                    {
                        FillDataOnEdit();

                    }
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        public void ClearControl()
        {
            ddljp.SelectedValue = "0";
            txtminexp.Text = "";
            txtmaxexp.Text = "";
            txtminsal.Text = "";
            txtmaxsal.Text = "";
            txtnoofvac.Text = "";
            txtnotper.Text = "";
            txtcomment.Text = "";
            btnins.Text = "Submit";
        }

        public void FillDataOnEdit() // Display page diff and insert diff so in case this edit func req'd 
        {

            SqlCommand cmd = new SqlCommand("sp_JobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 7);
            cmd.Parameters.AddWithValue("@rid", Request.QueryString["pp"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddljp.SelectedValue = dt.Rows[0]["jobprofile"].ToString();
            txtminexp.Text = dt.Rows[0]["minexp"].ToString();
            txtmaxexp.Text = dt.Rows[0]["maxexp"].ToString();
            txtminsal.Text = dt.Rows[0]["minsal"].ToString();
            txtmaxsal.Text = dt.Rows[0]["maxsal"].ToString();
            txtnoofvac.Text = dt.Rows[0]["noofvac"].ToString();
            txtnotper.Text = dt.Rows[0]["notper"].ToString();
            txtcomment.Text = dt.Rows[0]["comment"].ToString();
        }

        public void BindJobProfile()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 6);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddljp.DataValueField = "jpid"; // primary key column hamesha bind hoga DataValueField se
            ddljp.DataTextField = "jpname"; // or DataTextField me koi sa bhi column bind kar sakte ho kai col ho sakte hai table me abhi chahe ek hai
            ddljp.DataSource = dt;
            ddljp.DataBind();
            ddljp.Items.Insert(0, new ListItem("--Select--", "0")); // <- is line ka means ddljp me ek item insert kana hai 0 means<-top par, new ListItem<-ek naya list item, ListItem ki do properties hoti hai 1st text(--Select--", "0") and 2nd value 
        }

        protected void btnins_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_JobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 1);
            cmd.Parameters.AddWithValue("@rid", Session["rid"]);
            cmd.Parameters.AddWithValue("@jobprofile", ddljp.SelectedValue);
            cmd.Parameters.AddWithValue("@minexp", txtminexp.Text);
            cmd.Parameters.AddWithValue("@maxexp", txtmaxexp.Text);
            cmd.Parameters.AddWithValue("@minsal", txtminsal.Text);
            cmd.Parameters.AddWithValue("@maxsal", txtmaxsal.Text);
            cmd.Parameters.AddWithValue("@noofvac", txtnoofvac.Text);
            cmd.Parameters.AddWithValue("@notper", txtnotper.Text);
            cmd.Parameters.AddWithValue("@comment", txtcomment.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ClearControl();
        }
    }
}