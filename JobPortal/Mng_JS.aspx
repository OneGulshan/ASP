<%@ Page Title="" Language="C#" MasterPageFile="~/Adm.Master" AutoEventWireup="true" CodeBehind="Mng_JS.aspx.cs" Inherits="JobPortal.Mng_Emp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td></td>
            <td><asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>  <asp:Button ID="Btnsearch" runat="server" Text="Search" OnClick="Btnsearch_Click"></asp:Button></td>
        </tr>
        
        <tr>
            <td></td>
            <td><asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:GridView ID="Grd" runat="server" AutoGenerateColumns="False" OnRowCommand="Grd_RowCommand" Width="1100px">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <%#Eval("name") %> <%#Eval("age") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <%#Eval("gender").ToString()=="1" ? "Male" :Eval("gender").ToString()=="2" ? "Female" : "Other"%>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Job Profile">
                            <ItemTemplate>
                                <%#Eval("jpname") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <%#Eval("email") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <%#Eval("password") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Mobile">
                            <ItemTemplate>
                                <%#Eval("mobno") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Age">
                            <ItemTemplate>
                                <%#Eval("age") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <%#Eval("cntname") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="State">
                            <ItemTemplate>
                                <%#Eval("sttname") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <%#Eval("ctyname") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Profile">
                            <ItemTemplate>
                                <asp:Image ID="imgp" runat="server" Width="50px" Height="50px" ImageUrl='<%#Eval("photo","~/Profile/{0}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Skills">
                            <ItemTemplate>
                                <%#Eval("skills") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Comment">
                            <ItemTemplate>
                                <%#Eval("comment") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <%#Eval("status") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgapprove" runat="server" ImageUrl="~/Approve.png" Height="30px" Width="30px" CommandArgument='<%#Eval("id") %>' CommandName="APR" OnClientClick="return confirm('Are you sure you want to approve ?')"/>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--<asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnapprove" runat="server" Text='<%#Eval("status").ToString() == "1" ? "Approved" : "NotApproved" %>' CommandArgument='<%#Eval("id") %>' CommandName="APR"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
        
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />                    
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
