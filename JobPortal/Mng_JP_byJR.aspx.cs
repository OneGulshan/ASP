using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ProjectBatch1
{
    public partial class Mng_JobPost_byJR : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["rid"] != null && Session["rid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    BindData();
                }
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }            
        }

        public void BindData()
        {
            SqlCommand cmd = new SqlCommand("sp_JobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 5);
            cmd.Parameters.AddWithValue("@rid", Session["rid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grd.DataSource = dt;
            grd.DataBind();
        }
       
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_JobPost", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 9);
            cmd.Parameters.AddWithValue("@search", txtsearch.Text);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                grd.DataSource = dt;
                grd.DataBind();
                lblmsg.Text = "";
            }
            else
            {
                grd.DataSource = null;
                grd.DataBind();
                lblmsg.Text = "No Record Search !!";
            }
        }
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "D")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_JobPost", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@mode", 6);
                cmd.Parameters.AddWithValue("@rid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                BindData();
            }
            else if (e.CommandName == "E")
            {
                Response.Redirect("JobPost_JR.aspx?pp=" + e.CommandArgument);
            }
        }
    }
}