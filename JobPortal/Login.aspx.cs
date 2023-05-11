using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace JobPortal
{
    public partial class Login : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (ddllogintype.SelectedValue == "1")
            {                
                SqlCommand cmd = new SqlCommand("sp_Employee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@mode", 12);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@password",txtpass.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["empid"] = dt.Rows[0]["id"].ToString();
                    Response.Redirect("Home_JS.aspx?pp=" + dt.Rows[0]["name"].ToString());
                }
                else
                {
                    lblmsg.Text = "Login Failed !!";
                }
            }
            else if (ddllogintype.SelectedValue == "2")
            {
                SqlCommand cmd = new SqlCommand("sp_Recruiter", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@mode", 8);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@password", txtpass.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["rid"] = dt.Rows[0]["rid"].ToString();
                    Response.Redirect("Home_JR.aspx?pp=" + dt.Rows[0]["name"].ToString());
                }
                else
                {
                    lblmsg.Text = "Login Failed !!";
                }
            }
            else if (ddllogintype.SelectedValue == "3")
            {
                SqlCommand cmd = new SqlCommand("sp_Admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@mode", 2);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@password", txtpass.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["aid"] = dt.Rows[0]["aid"].ToString();
                    Response.Redirect("Home_Adm.aspx?pp=" + dt.Rows[0]["name"].ToString());
                }
                else
                {
                    lblmsg.Text = "Login Failed !!";
                }
            }
        }
    }
}