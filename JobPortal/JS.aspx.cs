using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace JobPortal
{
    public partial class Student : Page
    {
        //SqlConnection con = new SqlConnection("data source=DESKTOP-G5RT3KT\\SQLEXPRESS;initial catalog=db_JobPortal;integrated security=true");
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobProfile();
                BindCountry();
                cblskl.Enabled = true;
                ddlstate.Enabled = false;
                ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));
                ddlcity.Enabled = false;
                ddlcity.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        public void ClearControl()
        {
            txtname.Text = "";
            txtemail.Text = "";
            rblgender.ClearSelection();
            txtmobno.Text = "";
            txtage.Text = "";
            ddljp.SelectedValue = "0";
            cblskl.ClearSelection();
            skl.Visible = false;
            ddlcountry.SelectedValue = "0";
            ddlstate.SelectedValue = "0";
            ddlstate.Enabled = false;
            ddlcity.SelectedValue = "0";
            ddlcity.Enabled = false;
            txtcomment.Text = "";
            lblmsg.Text = "";
        }

        public void BindJobProfile()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 6);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddljp.DataValueField = "jpid";
            ddljp.DataTextField = "jpname";
            ddljp.DataSource = dt;
            ddljp.DataBind();
            ddljp.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindSkills()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 10);
            cmd.Parameters.AddWithValue("@jpid", ddljp.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cblskl.DataValueField = "sid";
            cblskl.DataTextField = "sname";
            cblskl.DataSource = dt;
            cblskl.DataBind();
        }

        public void BindCountry()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 7);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlcountry.DataValueField = "cntid";
            ddlcountry.DataTextField = "cntname";
            ddlcountry.DataSource = dt;
            ddlcountry.DataBind();
            ddlcountry.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindState()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 8);
            cmd.Parameters.AddWithValue("@cntid", ddlcountry.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlstate.DataValueField = "sttid";
            ddlstate.DataTextField = "sttname";
            ddlstate.DataSource = dt;
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindCity()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 9);
            cmd.Parameters.AddWithValue("@sttid", ddlstate.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlcity.DataValueField = "ctyid";
            ddlcity.DataTextField = "ctyname";
            ddlcity.DataSource = dt;
            ddlcity.DataBind();
            ddlcity.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void Btninsert_Click(object sender, EventArgs e)
        {
            if (Btninsert.Text == "Register")
            {
                string fn = Path.GetFileName(fup.PostedFile.FileName);
                string fe = Path.GetExtension(fup.PostedFile.FileName);
                fup.SaveAs(Server.MapPath("Profile") + "\\" + fn);

                string skl = "";
                for (int i = 0; i < cblskl.Items.Count; i++)
                {
                    if (cblskl.Items[i].Selected == true)
                    {
                        skl += cblskl.Items[i].Text + ",";
                    }
                }
                skl = skl.TrimEnd(',');

                if (fe.ToString().ToLower() == ".jpg" || fe.ToString().ToLower() == ".jpeg" || fe.ToString().ToLower() == ".png")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_Employee", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@mode", 1);
                    cmd.Parameters.AddWithValue("@name", txtname.Text);
                    cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
                    cmd.Parameters.AddWithValue("@age", txtage.Text);
                    cmd.Parameters.AddWithValue("@mobno", txtmobno.Text);
                    cmd.Parameters.AddWithValue("@email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@password", txtpassword.Text);
                    cmd.Parameters.AddWithValue("@jobprofile", ddljp.SelectedValue);
                    cmd.Parameters.AddWithValue("@country", ddlcountry.SelectedValue);
                    cmd.Parameters.AddWithValue("@state", ddlstate.SelectedValue);
                    cmd.Parameters.AddWithValue("@city", ddlcity.SelectedValue);
                    cmd.Parameters.AddWithValue("@photo", fn);
                    cmd.Parameters.AddWithValue("@skills", skl);
                    cmd.Parameters.AddWithValue("@comment", txtcomment.Text);
                    cmd.ExecuteNonQuery();
                    lblmsg.Text = "Your record has been saved sucessfully !!";
                    con.Close();
                    ClearControl();
                }
                else
                {
                    lblmsg.Text = "Please upload only jpg,jpeg or png files !!";
                }
            }
        }

        protected void ddljp_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddljp.SelectedValue == "0")
            {
                skl.Visible = false;
            }
            else
            {
                skl.Visible = true;
                cblskl.Enabled = true;
                BindSkills();
            }
        }

        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcountry.SelectedValue == "0")
            {
                ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));
                ddlstate.Enabled = false;
            }
            else
            {
                ddlstate.Enabled = true;
            }
            BindState();
        }

        protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlstate.SelectedValue == "0")
            {
                ddlcity.Items.Insert(0, new ListItem("--Select--", "0"));
                ddlcity.Enabled = false;
            }
            else
            {
                ddlcity.Enabled = true;
            }                        
            BindCity();
        }
    }
}