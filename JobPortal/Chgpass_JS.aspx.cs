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
    public partial class Chgpass_Emp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["empid"] != null && Session["empid"].ToString() != "")
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
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 13);
            cmd.Parameters.AddWithValue("@id", Session["empid"]);
            cmd.Parameters.AddWithValue("@password", txtoldpass.Text);
            cmd.Parameters.AddWithValue("@newpwd", txtnewpass.Text);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                lblmsg.Text = "Password changed succesfully !!";
            }
            else
            {
                lblmsg.Text = "Password not changed !!";
            }
            con.Close();
        }
    }
}