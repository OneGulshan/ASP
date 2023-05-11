<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="JR.aspx.cs" Inherits="JobPortal.Recruiter_Serverstateide" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="jquery.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Company Category :</td>
            <td><asp:DropDownList ID="ddlcc" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvcc" runat="server" ControlToValidate="ddlcc" InitialValue="0" ErrorMessage="Please select your course !!" ValidationGroup="First" Display="None"></asp:RequiredFieldValidator></td>
        
            <td>Company Name :</td>
            <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvname" runat="server" ControlToValidate="txtname" ErrorMessage="Please enter your name !!" ForeColor="Red" ValidationGroup="First" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revname" runat="server" ControlToValidate="txtname" ErrorMessage="Please enter valid name !!" ForeColor="Red" ValidationExpression="^[a-zA-Z ]{3,30}$" ValidationGroup="First" Display="None"></asp:RegularExpressionValidator>
        </tr>
        
        <tr>
            <td>Company Email :</td>
            <td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtemail" ErrorMessage="Please enter your email id !!" ForeColor="Red" ValidationGroup="First" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="txtemail" ErrorMessage="Please enter valid email id !!" ForeColor="Maroon" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="First" Display="None"></asp:RegularExpressionValidator></td>
        
            <td>Company Password :</td>
            <td><asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvpass" runat="server" ControlToValidate="txtpass" ErrorMessage="Please enter your Password !!" ForeColor="Red" ValidationGroup="First" Display="None"></asp:RequiredFieldValidator>
                <%--<asp:RegularExpressionValidator ID="revpassword" runat="server" ControlToValidate="txtemail" ErrorMessage="Please enter valid Password !!" ForeColor="Maroon" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$" ValidationGroup="First" Display="None"></asp:RegularExpressionValidator></td>--%></td>            
        </tr>
        
        <tr>
            <td style="vertical-align:top">Comment :</td>
            <td colspan="3"><asp:TextBox ID="txtcomment" runat="server" TextMode="MultiLine" Rows="5" Columns="65"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvcomment" runat="server" ControlToValidate="txtcomment" ErrorMessage="Please enter your Comment !!" ForeColor="Red" ValidationGroup="First" Display="None"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <%--<asp:CompareValidator ID="cvage" runat="server" ControlToValidate="txtage" ValueToCompare="18" Type="Integer" Operator="GreaterThanEqual" ErrorMessage="Please enter valid age !!" ForeColor="Green" ValidationGroup="First" Display="None"></asp:CompareValidator> CompareValidator Use for agar kisi #value se compare karna hai--%> <%--ValueToCompare->for comparing, Type->value ka type batane ke liye,  Operator->value ko operate karne ke liye, Type->jis tarhe ki value se val karna hai like integer,String etc.--%>
        <tr>
            <td></td>
            <td colspan="3"><asp:Button ID="btninsert" runat="server" Text="Submit" OnClick="btninsert_Click" ValidationGroup="First"></asp:Button>&nbsp
                <a href="Login.aspx">Sign In</a></td>            
        </tr>               
    </table>
    <asp:ValidationSummary ID="vs" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="First" />
</asp:Content>
