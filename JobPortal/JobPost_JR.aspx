<%@ Page Title="" Language="C#" MasterPageFile="~/JR.Master" AutoEventWireup="true" CodeBehind="JobPost_JR.aspx.cs" Inherits="JobPortal.Recruiter_JobPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <table>
        <tr>
            <td>Job Profile :</td>
            <td><asp:DropDownList ID="ddljp" runat="server">
                </asp:DropDownList></td>
        </tr>

        <tr>
            <td>Min Exp Req :</td>
            <td><asp:TextBox ID="txtminexp" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Max Exp Req :</td>
            <td><asp:TextBox ID="txtmaxexp" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Min Salary Offered :</td>
            <td><asp:TextBox ID="txtminsal" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Max Salary Offered :</td>
            <td><asp:TextBox ID="txtmaxsal" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>No of vacancies :</td>
            <td><asp:TextBox ID="txtnoofvac" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Notice Period :</td>
            <td><asp:TextBox ID="txtnotper" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td style="vertical-align:top">Comment :</td>
            <td><asp:TextBox ID="txtcomment" runat="server" TextMode="MultiLine" Columns="28" Rows="4"></asp:TextBox></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Button ID="btnins" runat="server" Text="Submit" OnClick="btnins_Click" />&nbsp&nbsp&nbsp
            <a href="Mng_JP_byJR.aspx">Manage JobPosts</a></td>
        </tr>
    </table>
</asp:Content>
