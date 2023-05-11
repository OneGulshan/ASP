<%@ Page Title="" Language="C#" MasterPageFile="~/JS.Master" AutoEventWireup="true" CodeBehind="Home_JS.aspx.cs" Inherits="JobPortal.Home_Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td><h1>Hello <asp:Label ID="lblname" runat="server"></asp:Label></h1></td>
        </tr>        
    </table>
</asp:Content>