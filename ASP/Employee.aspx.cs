using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace ASP
{
    public partial class Employee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JP();
                Grd();
            }
        }

        public void Clear()
        {
            txtname.Text = "";
            txtmob.Text = "";
            rblgender.ClearSelection();
            ddljp.SelectedValue = "0";
            skl.Visible = false;
            cblskl.ClearSelection();
            img.ImageUrl = null;
            img.Visible = false;
            ViewState["prof"] = null;
            ViewState["id"] = null;
            btnins.Text = "Submit";
        }

        public void JP()
        {
            SqlCommand cmd = new SqlCommand("sp_JP", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddljp.DataValueField = "jpid";
            ddljp.DataTextField = "jpname";
            ddljp.DataSource = dt;
            ddljp.DataBind();
            ddljp.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void SKL()
        {
            SqlCommand cmd = new SqlCommand("sp_Skl", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@jpid", ddljp.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cblskl.DataValueField = "sid";
            cblskl.DataTextField = "sname";
            cblskl.DataSource = dt;
            cblskl.DataBind();
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
                SKL();
            }
        }

        protected void btnins_Click(object sender, EventArgs e)
        {
            string fn = "";

            string skl = "";
            for (int i = 0; i < cblskl.Items.Count; i++)
            {
                if (cblskl.Items[i].Selected == true)
                {
                    skl += cblskl.Items[i].Text + ",";
                }
            }
            skl = skl.TrimEnd(',');

            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Emp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@mobno", txtmob.Text);
            cmd.Parameters.AddWithValue("@gender", rblgender.SelectedValue);
            cmd.Parameters.AddWithValue("@jp", ddljp.SelectedValue);
            cmd.Parameters.AddWithValue("@skl", skl);
            if (btnins.Text == "Submit")
            {
                fn = Path.GetFileName(fuimg.PostedFile.FileName);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@mode", 1);
                if (fn != "")
                {
                    fn = DateTime.Now.Ticks.ToString() + fn;
                    fuimg.SaveAs(Server.MapPath("IMG" + "\\" + fn));
                    cmd.Parameters.AddWithValue("@prof", fn);
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    string profile = "Please Select Your Profile Image !!";
                    ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('" + profile + "');", true);
                }
            }
            else if (btnins.Text == "Update")
            {
                fn = Path.GetFileName(fuimg.PostedFile.FileName);
                cmd.Parameters.AddWithValue("@mode", 5);
                cmd.Parameters.AddWithValue("@id", ViewState["id"]);
                if (fn == "")
                {
                    cmd.Parameters.AddWithValue("@prof", ViewState["prof"]);
                }
                else
                {
                    fn = DateTime.Now.Ticks.ToString() + fn;
                    File.Delete(Server.MapPath("IMG" + "\\" + ViewState["prof"]));
                    fuimg.SaveAs(Server.MapPath("IMG" + "\\" + fn));
                    cmd.Parameters.AddWithValue("@prof", fn);
                }
                cmd.ExecuteNonQuery();
            }
            con.Close();
            Grd();
            Clear();
        }

        public void Grd()
        {
            SqlCommand cmd = new SqlCommand("sp_Emp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@mode", 2);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grd.DataSource = dt;
            grd.DataBind();
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "D")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Emp", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@mode", 3);
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                File.Delete(Server.MapPath("IMG" + "\\" + "@prof"));
                cmd.ExecuteNonQuery();
                con.Close();
                Grd();
                Clear();
            }

            else if (e.CommandName == "E")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Emp", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@mode", 4);
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtmob.Text = dt.Rows[0]["mobno"].ToString();
                rblgender.SelectedValue = dt.Rows[0]["gender"].ToString();
                ddljp.SelectedValue = dt.Rows[0]["jp"].ToString();
                skl.Visible = true;
                SKL();
                string[] arr = dt.Rows[0]["skl"].ToString().Split(',');
                for (int i = 0; i < cblskl.Items.Count; i++)
                {
                    for (int j = 0; j < arr.Length; j++)
                    {
                        if (cblskl.Items[i].Text == arr[j])
                        {
                            cblskl.Items[i].Selected = true;
                        }
                    }
                }
                img.Visible = true;
                img.ImageUrl = "~/IMG" + "\\" + dt.Rows[0]["prof"].ToString();
                ViewState["prof"] = dt.Rows[0]["prof"].ToString();
                ViewState["id"] = e.CommandArgument;
                btnins.Text = "Update";
            }
        }
    }
}
