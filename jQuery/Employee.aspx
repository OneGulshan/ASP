<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="jQuery.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery.js"></script>    
    <script type="text/javascript">
        function JS() {
            var msgs = "";
            msgs = chkname();
            msgs += chkaddress();
            msgs += chkage();

            if (msgs != "") {
                alert(msgs);
                return false;
            }
            else {
                SaveData();
            }
        }

        function chkname() {
            var a = $("#txtname").val();
            if (a == "") {
                return 'Please enter your name !!\n';
            }
            else {
                return "";
            }
        }

        function chkaddress() {
            var a = $("#txtaddress").val();
            if (a == "") {
                return 'Please enter your address !!\n';
            }
            else {
                return "";
            }
        }

        function chkage() {
            var a = $("#txtage").val();
            if (a == "") {
                return 'Please enter your age !!';
            }
            else {
                return "";
            }
        }

        var ID = 0;
        $(document).ready(function () {
            BindData();
            BindCountry();
            $("#ddlstate").prop("disabled", true);
        });

        function Clear() {
            $("#txtname").val("");
            $("#txtaddress").val("");
            $("#txtage").val("");
            $("#ddlcountry").val("0");
            $("#ddlstate").val("0");
            $("#ddlstate").prop("disabled", true)
            $("#btnins").val("Submit");
            ID = 0;
        }

        function BindCountry() {
            $.ajax({
                url: 'Employee.aspx/GetALLCountry',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{}",
                async: false,
                success: function (Data) {
                    Data = JSON.parse(Data.d);
                    for (var i = 0; i < Data.length; i++) {
                        $("#ddlcountry").append($('<option/>').attr("value", Data[i].cid).text(Data[i].cname));
                    }
                },
                error: function () {
                    alert('Country not Found!!');
                }
            });
        }

        function BindState() {
            $.ajax({
                url: 'Employee.aspx/GetALLState',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{A : '" + $("#ddlcountry").val() + "'}",
                async: false,
                success: function (Data) {
                    Data = JSON.parse(Data.d);
                    $("#ddlstate").prop("disabled", false);
                    $("#ddlstate").empty();
                    $("#ddlstate").append($('<option/>').attr("value", 0).text("--Select--"));
                    for (var i = 0; i < Data.length; i++) {
                        $("#ddlstate").append($('<option/>').attr("value", Data[i].sid).text(Data[i].sname));
                    }
                },
                error: function () {
                    alert('State not Found!!');
                }
            });
        }

        function SaveData() {
            if ($("#btnins").val() == "Submit") {
                $.ajax({
                    url: 'Employee.aspx/Insert',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: "{A:'" + $("#txtname").val() + "', B:'" + $("#txtaddress").val() + "',C:'" + $("#txtage").val() + "',D:'" + $("#ddlcountry").val() + "',E:'" + $("#ddlstate").val() + "'}",
                    success: function () {
                        BindData();
                        Clear();
                    },
                    error: function () {
                        alert('Record Not Inserted !!');
                    }
                });
            }
            else if ($("#btnins").val() == "Update") {
                $.ajax({
                    url: 'Employee.aspx/Update',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: "{ID:'" + ID + "',A:'" + $("#txtname").val() + "', B:'" + $("#txtaddress").val() + "',C:'" + $("#txtage").val() + "',D:'" + $("#ddlcountry").val() + "',E:'" + $("#ddlstate").val() + "'}",
                    success: function () {
                        BindData();
                        Clear();
                    },
                    error: function () {
                        alert('Record Not Updated !!');
                    }
                });
            }
        }

        function BindData() {
            $.ajax({
                url: 'Employee.aspx/GetALLData',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "",
                async: false,
                success: function (Data) {
                    Data = JSON.parse(Data.d);
                    $("#tbl").find("tr:gt(0)").remove();
                    if (Data.length > 0) {
                        for (var i = 0; i < Data.length; i++) {
                            $("#tbl").append('<tr><td>' + Data[i].id + '</td><td>' + Data[i].name + '</td><td>' + Data[i].address + '</td><td>' + Data[i].age + '</td><td>' + Data[i].cname + '</td><td>' + Data[i].sname + '</td><td><input type="button" value="Delete" id="btndel" onclick="DeleteData(' + Data[i].id + ')" /></td><td><input type="button" value="Edit" id="btnedit" onclick="EditData(' + Data[i].id + ')" /></td></tr>');
                        }
                    }
                    else {
                        $("#tbl").empty();
                    }
                },
                error: function () {
                    alert('Data Not Found !!');
                }
            });
        }
        debugger;
        function DeleteData(id) {
            $.ajax({
                url: 'Employee.aspx/Delete',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{A:'" + id + "'}",
                success: function () {
                    BindData();
                },
                error: function () {
                    alert('Record Not Deleted !!');
                }
            });
        }

        function EditData(id) {
            $.ajax({
                url: 'Employee.aspx/Edit',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{ID:'" + id + "'}",
                success: function (Data) {
                    Data = JSON.parse(Data.d);
                    $("#txtname").val(Data[0].name);
                    $("#txtaddress").val(Data[0].address);
                    $("#txtage").val(Data[0].age);
                    $("#ddlcountry").val(Data[0].country);                    
                    BindState();
                    $("#ddlstate").val(Data[0].state);
                    $("#btnins").val("Update");
                    ID = id;
                },
                error: function () {
                    alert('Record Not Edited !!');
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
                <table>
                    <tr>
                        <td>Name :</td>
                        <td>
                            <input type="text" id="txtname" /></td>
                    </tr>

                    <tr>
                        <td>Address :</td>
                        <td>
                            <input type="text" id="txtaddress" /></td>
                    </tr>

                    <tr>
                        <td>Age :</td>
                        <td>
                            <input type="text" id="txtage" /></td>
                    </tr>

                    <tr>
                        <td>Country :</td>
                        <td>
                            <select id="ddlcountry" onchange="BindState()">                                
                                <option value="0">--Select--</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>State :</td>
                        <td>
                            <select id="ddlstate">
                                <option value="0">--Select--</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <input type="button" value="Submit" id="btnins" onclick="return JS()" /></td>                        
                    </tr>
                </table>
                <br />

                <table id="tbl" border="1" style="background-color: gray; color: white">                    
                    <tr style="background-color: maroon">                        
                        <th>Employee ID</th>                        
                        <th>Employee Name</th>
                        <th>Employee Address</th>
                        <th>Employee Age</th>
                        <th>Employee Country</th>
                        <th>Employee State</th>
                        <th></th>
                        <th></th>
                    </tr>
                </table>
            </div>
        </center>
    </form>
</body>
</html>
