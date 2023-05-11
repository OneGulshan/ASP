<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="JS.aspx.cs" Inherits="JobPortal.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            function JSval() {
                var msg = "";
                msg = chkname();
                msg += chkgender();
                msg += chkcourse();
                msg += chkemail();
                msg += chkpassword();
                msg += chkmobno();
                msg += chkage();
                msg += chkcountry();
                msg += chkstate();
                msg += chkcity();
                msg += chkprofile();
                msg += chkcomment();

                if (msg == "") {
                    return true;
                }
                else {
                    alert(msg);
                    return false;
                }
            }

            function chkname() {
                var a = document.getElementById('<%=txtname.ClientID%>');
                var exp = /^[A-Za-z ]+$/;
                if (a.value == "") {
                    return 'Please enter your name !!\n';
                }
                else if (exp.test(a.value)) {
                    return "";
                }
                else {
                    return 'Name should be only alphabets !!\n';
                }
            }

            function chkgender() {
                var a = document.getElementById('<%=rblgender.ClientID%>');
                var ipt = a.getElementsByTagName('input');
                var count = 0;

                for (var i = 0; i < ipt.length; i++) {
                    if (ipt[i].checked == true) {
                        count = 1;
                    }
                }

                if (count == 0) {
                    return 'Please select your gender !!\n';
                }
                else {
                    return "";
                }
            }

            function chkcourse() {                
                if (document.getElementById('<%=ddljp.ClientID%>').value == "0") {
                    return 'Please select your job profile !!\n';
                }                
                else {
                    return "";
                }
            }

            function chkname() {
                var a = document.getElementById('<%=txtname.ClientID%>');
                var exp = /^[A-Za-z ]+$/;
                if (a.value == "") {
                    return 'Please enter your name !!\n';
                }
                else if (exp.test(a.value)) {
                    return "";
                }
                else {
                    return 'Name should be only alphabets !!\n';
                }
            }

            function chkemail() {
                var a = document.getElementById('<%=txtemail.ClientID%>');
                var exp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                if (a.value == "") {
                    return 'Please enter your email !!\n';
                }
                else if (exp.test(a.value)) {
                    return "";
                }
                else {
                    return 'Please enter correct email id !!\n';
                }
            }

            function chkpassword() {
                if (document.getElementById('<%=txtpassword.ClientID%>').value == "") {
                    return 'Please enter your password !!\n';
                }
                else {
                    return "";
                }
            }

            function chkmobno() {
                if (document.getElementById('<%=txtmobno.ClientID%>').value == "") {
                    return 'Please enter your mobile number !!\n';
                }
                else {
                    return "";
                }
            }

            function chkage() {
                if (document.getElementById('<%=txtage.ClientID%>').value == "") {
                    return 'Please enter your age !!\n';
                }
                else {
                    return "";
                }
            }

            function chkcountry() {
                if (document.getElementById('<%=ddlcountry.ClientID%>').value == "0") {
                    return 'Please select your country !!\n';
                }
                else {
                    return "";
                }
            }

            function chkstate() {
                if (document.getElementById('<%=ddlstate.ClientID%>').value == "0") {
                    return 'Please select your state !!\n';
                }
                else {
                    return "";
                }
            }

            function chkcity() {
                if (document.getElementById('<%=ddlcity.ClientID%>').value == "0") {
                    return 'Please select your city !!\n';
                }
                else {
                    return "";
                }
            }

            function chkprofile() {
                if (document.getElementById('<%=fup.ClientID%>').value == "") {
                    return 'Please select your file !!\n';
                }
                else {
                    return "";
                }
            }            

            function chkcomment() {                
                if (document.getElementById('<%=txtcomment.ClientID%>').value == "") {
                    return 'Please enter your comment !!';
                }
                else {
                    return "";
                }
            }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Name :</td>
            <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td>Gender :</td>
            <td><asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        
        <tr>
            <td>Job Profile :</td>
            <td><asp:DropDownList ID="ddljp" runat="server" OnSelectedIndexChanged="ddljp_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList></td>
        </tr>
        
        <tr id="skl" runat="server" visible="false">
            <td>Skills :</td>
            <td><asp:CheckBoxList ID="cblskl" runat="server" RepeatColumns="3"></asp:CheckBoxList></td>
        </tr>
        
        <tr>
            <td>Email :</td>
            <td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td>Password :</td>
            <td><asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td>Mobile :</td>
            <td><asp:TextBox ID="txtmobno" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td>Age :</td>
            <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td>Country :</td>
            <td><asp:DropDownList ID="ddlcountry" runat="server" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        
        <tr>
            <td>State :</td>            
            <td><asp:DropDownList ID="ddlstate" runat="server" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        
        <tr>
            <td>City :</td>           
            <td><asp:DropDownList ID="ddlcity" runat="server"></asp:DropDownList></td>
        </tr>
        
        <tr>
            <td>Profile :</td>
            <td><asp:FileUpload ID="fup" runat="server" />
            <asp:Image ID="img1" runat="server" Width="35px" Height="35px" /></td>
        </tr>
        
        <tr>
            <td style="vertical-align:top">Comment :</td>
            <td><asp:TextBox ID="txtcomment" runat="server" TextMode="MultiLine" Columns="37" Rows="6"></asp:TextBox></td>
        </tr>
        
        <tr>
            <td></td>
            <td><asp:Button ID="Btninsert" runat="server" Text="Register" OnClick="Btninsert_Click" OnClientClick="return JSval()" />&nbsp
                <a href="Login.aspx">Sign In</a></td>
        </tr>
        
        <tr>
            <td></td>
            <td><asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>               
    </table>        
</asp:Content>