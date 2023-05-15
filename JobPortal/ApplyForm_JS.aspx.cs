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

        public void Clear()
        {
            txtbody.Text = "";
            txtfromemail.Text = "";
            txtpassword.Text = "";
            txtsubject.Text = "";
            txttoemail.Text = "";
        }

        protected void Btn_sendemail_Click(object sender, EventArgs e)
        {
            MailMessage message = new MailMessage();
            SmtpClient smtpClientsmtp = new SmtpClient();
            message.From = new MailAddress("gulshankumar.mailid01@gmail.com");
            message.To.Add(txttoemail.Text);
            message.Subject = "Test Mail";


            string MailBody = "<!DOCTYPE html>" +
            "<body style=\"display:flex; justify-content:center;\">" +
            "<div style=\"min-height: 10rem; width: 40rem; background-color: aqua; padding: 1rem; border-radius: 10px;\">" +
            "<table style=\"width:100%; color:white; border: 1px solid black; text-align: center;\">" +
             "<thead style=\"color:black;\">" +
                "<tr>" +
                   " <th style=\"border: 1px solid black;\"> Name </th>" +
                   " <th style=\"border: 1px solid black;\"> Email </th>" +
                   " <th style=\"border: 1px solid black;\"> Message </th>" +
                "</tr>" +
             "</thead>" +
            "<tbody>" +
                "<tr>" +
                   $" <td style=\"border: 1px solid black;\"> {txtbody.Text} </td>" +
                    $"<td style=\"border: 1px solid black;\"> {txtfromemail.Text} </td>" +
                   $" <td style=\"border: 1px solid black;\"> {txtsubject.Text} </td>" +
                "</tr>" +
            "</tbody>" +
        "</table>" +
        "</body>" +
        "</html>";
            message.Body = MailBody;
            message.IsBodyHtml = true;
            smtpClientsmtp.Port = 587;
            smtpClientsmtp.Host = "smtp.gmail.com";
            smtpClientsmtp.EnableSsl = true;
            smtpClientsmtp.UseDefaultCredentials = false;
            smtpClientsmtp.Credentials = new NetworkCredential("gulshankumar.mailid01@gmail.com", "aeljomqrgsaqgtkv");
            smtpClientsmtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClientsmtp.Send(message);
            Clear();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Mail Send successfully');", true);
        }
    }
}