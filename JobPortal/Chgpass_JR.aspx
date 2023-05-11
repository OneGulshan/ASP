<%@ Page Title="" Language="C#" MasterPageFile="~/JR.Master" AutoEventWireup="true" CodeBehind="Chgpass_JR.aspx.cs" Inherits="JobPortal.Chgpass_Rec" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function JSval() {
            var msg = "";
            msg = chkoldpass();
            msg += chknewpass();
            msg += chkconpass();

            if (msg == "") {
                return true;
            }
            else {
                alert(msg);
                return false;
            }
        }

        function chkoldpass() {            
            if (document.getElementById('<%=txtoldpass.ClientID%>').value == "") {
                return 'Please enter your old password !!\n';
            }            
            else {
                return "";
            }
        }

        function chknewpass() {
            if (document.getElementById('<%=txtnewpass.ClientID%>').value == "") {
                return 'Please enter your new password !!\n';
            }
            else {
                return "";
            }
        }

        function chkconpass() {
            var npass = document.getElementById('<%=txtnewpass.ClientID%>');
            if (document.getElementById('<%=txtconpass.ClientID%>').value == "") {
                return 'Please enter your confirm password !!\n';
            }
            else if (document.getElementById('<%=txtconpass.ClientID%>').value == npass.value) {
                return "";
            }
            else {
                return 'Password do not match !!';
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Old Password :</td>
            <td><asp:TextBox ID="txtoldpass" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td>New Password :</td>
            <td><asp:TextBox ID="txtnewpass" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Confirm Password :</td>
            <td><asp:TextBox ID="txtconpass" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Button ID="Btnchgpass" runat="server" Text="Change Password" OnClick="Btnchgpass_Click" OnClientClick="return JSval()" />
        </tr>
    </table>
</asp:Content>
