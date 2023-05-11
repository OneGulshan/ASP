<%@ Page Title="" Language="C#" MasterPageFile="~/JS.Master" AutoEventWireup="true" CodeBehind="JobView_JS.aspx.cs" Inherits="JobPortal.JobView_Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function ApplyForm_JS(rid) {
            document.getElementById('iframe_pop').src = 'ApplyForm_JS.aspx?rid=' + rid; /*Jaise hi ye func call ho iframe_pop nam ke popup me Applyform_JS nam ka page call ho jae or query string me rakh kar rid chali jae ApplyForm_Js par ab ye dekhna hai ki hamara ApplyForm_Js page iframe_pop nam ke popup me kaise khulega*/
            $('#div_overlay').fadeIn(500); $('#div_popup').fadeIn(500);
        }
    </script>

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

                        <asp:TemplateField HeaderText="Job Profile"> <%--GridView ko thic kar lenge--%>
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
                                <%#Convert.ToDateTime(Eval("inserted_date")).ToShortDateString() %> <%--Date ko phele datetime me conv karna padega fir ToShortDateString() func se date nikal lenge short me--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                                
                        <asp:TemplateField HeaderText="Inserted Date">
                            <ItemTemplate>
                                <a href="javascript:void(0);" onclick="ApplyForm_JS('<%#Eval("rid") %>')">Apply</a> <%--Jaise hi Apply ancher tag par click karenge JavaScript ka func call hoga ApplyForm nam ka is func me apne job ki id le kar jaenge--%>
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

    <%------------------Popip apply------------------%>
<div id="div_overlay" style="position: fixed; left: 0px; top: 0px; right: 0px; bottom: 0px; background: black; opacity: 0.2; display: none"></div>

<div id="div_popup" style="position: fixed; left: 0px; top:150px; right: 0px; bottom: 0px; display: none; top: 150px; right: 0px; bottom: 0px">
    
<center>
<div style="overflow:auto;width:500px;height:300px;background:white">
<div style="float:right"><a href="javascript:void(0);" onclick="$('#div_overlay').fadeOut(1000);$('#div_popup').fadeOut(1000);">Close</a></div>
<iframe id="iframe_pop" src="ApplyForm_JS.aspx" style="border:none" width="500px" height="300px"></iframe> <%--isi iframe_pop me hamne apne page ko call kara liya jaise hi ye frame call hoga hamare dono div show ho jaenge fade in ho jaenge hamare div me ye close ke button par dono div fadeout ho jaenge--%>
</div></center>
</div>
</asp:Content>
