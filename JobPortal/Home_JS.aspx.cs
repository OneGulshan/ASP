using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal
{
    public partial class Home_Employee : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["empid"] != null && Session["empid"].ToString() != "")
            {
                lblname.Text = Request.QueryString["pp"];
            }
            else
            {
                Response.Redirect("Logout.aspx");
            }
        }
    }
}