<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="ASP.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function JSval() {
            var msg = "";
            msg = chkname();
            msg += chkmob();
            msg += chkgender();
            msg += chkddljp();
            /*msg += chkcblskl();*/

            if (msg == "") {
                return true;
            }
            else {
                alert(msg);
                return false;
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

            function chkmob() {
                var a = document.getElementById('<%=txtmob.ClientID%>');
                var exp = /[0-9]{10}/
                if (a.value == "") {
                    return 'Please enter your mobile number !!\n';
                }
                else if (exp.test(a.value)) {
                    return "";
                }
                else {
                    return 'Mobile number should be only numericle or in 10 digits !!\n';
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

            function chkddljp() {
                if (document.getElementById('<%=ddljp.ClientID%>').value == "0") {
                    return 'Please select your job profile !!\n';
                }
                else {
                    return "";
                }
            }

            <%--function chkcblskl() {
                var a = document.getElementById('<%=cblskl.ClientID%>');
                var ipt = a.getElementsByTagName('input');
                var count = 0;

                for (var i = 0; i < ipt.length; i++) {
                    if (ipt[i].checked == true) {
                        count = 1;
                    }
                }

                if (count == 0) {
                    return 'Please select your skills !!\n';
                }
                else {
                    return "";
                }
            }--%>

            <%--function chkprofile() {
                if (document.getElementById('<%=fuimg.ClientID%>').value == "") {
                    return 'Please select your file !!\n';
                }
                else {
                    return "";
                }
            }            --%>
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name :</td>
                    <td>
                        <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Mobile :</td>
                    <td>
                        <asp:TextBox ID="txtmob" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>Gender :</td>
                    <td>
                        <asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                            <asp:ListItem Value="1">Male</asp:ListItem>
                            <asp:ListItem Value="2">Female</asp:ListItem>
                            <asp:ListItem Value="3">Other</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>

                <tr>
                    <td>JobProfile :</td>
                    <td>
                        <asp:DropDownList ID="ddljp" runat="server" OnSelectedIndexChanged="ddljp_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
                </tr>

                <tr id="skl" runat="server" visible="false">
                    <td>Skills :</td>
                    <td>
                        <asp:CheckBoxList ID="cblskl" runat="server" RepeatColumns="3"></asp:CheckBoxList></td>
                </tr>

                <tr>
                    <td>Profile :</td>
                    <td>
                        <asp:FileUpload ID="fuimg" runat="server" /><asp:Image ID="img" runat="server" Height="25px" Width="25px" Visible="false" /></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnins" runat="server" Text="Submit" OnClick="btnins_Click" OnClientClick="return JSval()" /></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" OnRowCommand="grd_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <%#Eval("name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Mobile">
                                    <ItemTemplate>
                                        <%#Eval("mobno") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <%#Eval("gender").ToString()=="1" ? "Male" : Eval("gender").ToString()=="2" ? "Female" : "Other"%>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="JobProfile">
                                    <ItemTemplate>
                                        <%#Eval("jpname") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Skills">
                                    <ItemTemplate>
                                        <%#Eval("skl") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Profile">
                                    <ItemTemplate>
                                        <asp:Image ID="img" runat="server" Height="40px" Width="25px" ImageUrl='<%#Eval("prof","~/IMG/{0}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btndel" runat="server" Text="Delete" CommandName="D" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="E" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
