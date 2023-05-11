<%@ Page Title="" Language="C#" MasterPageFile="~/JR.Master" AutoEventWireup="true" CodeBehind="Mng_JP_byJR.aspx.cs" Inherits="ProjectBatch1.Mng_JobPost_byJR" %>
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
            <td>
                <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" OnRowCommand="grd_RowCommand" Width="1200px">
                    <Columns>
                        <asp:TemplateField HeaderText="Company Name">
                            <ItemTemplate>
                                <%#Eval("name") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Job Profile">
                            <ItemTemplate>
                                <%#Eval("jpname") %>
                            </ItemTemplate>
                        </asp:TemplateField>                        
        
                        <asp:TemplateField HeaderText="Required Experience">
                            <ItemTemplate>
                                <%#Eval("minexp") %> year - <%#Eval("maxexp") %> year
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Offered salary">
                            <ItemTemplate>
                                Rs. <%#Eval("minsal") %> - <%#Eval("maxsal") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Number of vacancies">
                            <ItemTemplate>
                                <%#Eval("noofvac") %> vacancies
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Notice Period">
                            <ItemTemplate>
                                <%#Eval("notper") %> days
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Comment">
                            <ItemTemplate>
                                <%#Eval("comment") %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField HeaderText="Inserted Date">
                            <ItemTemplate>
                                <%#Convert.ToDateTime(Eval("inserted_date")).ToShortDateString() %>
                            </ItemTemplate>
                        </asp:TemplateField>
        
                        <asp:TemplateField>
                            <ItemTemplate>                                
                                <asp:LinkButton ID="lnkdel" runat="server" Text="Delete" CommandArgument='<%#Eval("rid") %>' CommandName="D" OnClientClick="return confirm('Are you sure you want to delete ?')"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>                                
                                <asp:LinkButton ID="lnkedit" runat="server" Text="Edit" CommandArgument='<%#Eval("rid") %>' CommandName="E"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
        
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