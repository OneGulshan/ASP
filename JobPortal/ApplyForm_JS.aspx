<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyForm_JS.aspx.cs" Inherits="ProjectBatch1.ApplyForm_JS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>From :</td>
                    <td><asp:TextBox ID="txtfromemail" runat="server" Width="250px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Password :</td>
                    <td><asp:TextBox ID="txtpassword" runat="server" Width="250px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>To :</td>
                    <td><asp:TextBox ID="txttoemail" runat="server" Width="250px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Subject :</td>
                    <td><asp:TextBox ID="txtsubject" runat="server" Width="250px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Body :</td>
                    <td><asp:TextBox ID="txtbody" runat="server" TextMode="MultiLine" Rows="8" Columns="5" Width="250px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td></td>
                    <td><asp:Button ID="btn_sendemail" runat="server" Text="Mail Send" OnClick="Btn_sendemail_Click"></asp:Button></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
