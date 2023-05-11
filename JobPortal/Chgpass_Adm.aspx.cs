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
    public partial class Chgpass_Adm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["aid"] != null && Session["aid"].ToString() != "")
            {
                //code
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }

        protected void Btnchgpass_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Admin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 1);
            cmd.Parameters.AddWithValue("@aid", Session["aid"]);
            cmd.Parameters.AddWithValue("@password", txtoldpass.Text);
            cmd.Parameters.AddWithValue("@newpwd", txtnewpass.Text);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                lblmsg.Text = "Password changed succesfully !!";
            }
            else
            {
                lblmsg.Text = "Old Password is incorrect !!";
            }
            con.Close();
        }
    }
}