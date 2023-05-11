<%@ Page Title="" Language="C#" MasterPageFile="~/Adm.Master" AutoEventWireup="true" CodeBehind="Mng_JR.aspx.cs" Inherits="JobPortal.Mng_Rec" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td></td>
            <td><asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>  <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click"></asp:Button></td>
        </tr>
        
        <tr>
            <td></td>
            <td><asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>

        <tr>
            <td></td>
            <td colspan="3"><asp:GridView ID="grd" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="Company Category">
                        <ItemTemplate>
                            <%#Eval("ctname") %>
                        </ItemTemplate>
                    </asp:TemplateField>
        
                    <asp:TemplateField HeaderText="Company Name">
                        <ItemTemplate>
                            <%#Eval("name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
        
                    <asp:TemplateField HeaderText="Company Email">
                        <ItemTemplate>
                            <%#Eval("email") %>
                        </ItemTemplate>
                    </asp:TemplateField>
        
                    <asp:TemplateField HeaderText="Comment">
                        <ItemTemplate>
                            <%#Eval("comment") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
