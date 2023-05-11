using System;
using System.Web.UI;
using System.Net;
using System.Net.Mail;

namespace ProjectBatch1
{
    public partial class ApplyForm_JS : Page
    {
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

        protected void Btn_sendemail_Click(object sender, EventArgs e)
        {
            string username = "gulshankumar.mailid@gmail.com";
            string password = "ndiwqxcoyumiqvjn";
            ICredentialsByHost credentials = new NetworkCredential(username, password);

            SmtpClient smtpClient = new SmtpClient()
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                Credentials = credentials,
                UseDefaultCredentials = true
            };

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(username);
            mail.To.Add(username);
            mail.Subject = "Testing less secure apps new configuration.";
            mail.Body = "Hello stackoveflow!";

            smtpClient.Send(mail);

            //MailAddress bcc = new MailAddress("gulshankumar.mailid01@gmail.com");
            //using (MailMessage mm = new MailMessage(txtfromemail.Text, txttoemail.Text))
            //{
            //    mm.Subject = txtsubject.Text;
            //    mm.Body = txtbody.Text;
            //    mm.CC.Add(bcc);
            //    mm.IsBodyHtml = true;
            //    SmtpClient smtp = new SmtpClient();
            //    smtp.Host = "smtp.google.com";
            //    smtp.EnableSsl = true;
            //    NetworkCredential NetworkCred = new NetworkCredential(txtfromemail.Text, txtpassword.Text);
            //    smtp.UseDefaultCredentials = false;
            //    smtp.Credentials = NetworkCred;
            //    smtp.Port = 587; 
            //    smtp.Send(mm);
            //    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Mail Send successfully');", true);
            //}
        }
    }
}