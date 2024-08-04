<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageremployees.aspx.cs" Inherits="manageremployees" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager Employees</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        .navbar {
            height: 100%;
            width: 220px; 
            background-color: #282c34;
            color: #ffffff;
            position: fixed;
            top: 0;
            left: 0;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
        }
        .navbar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .navbar ul li {
            margin-bottom: 10px;
        }
        .navbar ul li a {
            color: #ffffff;
            text-decoration: none;
            font-size: 16px;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .navbar ul li a:hover {
            background-color: #61dafb;
        }
        .container {
            margin-left: 220px; 
            padding: 20px;
            width: calc(100% - 220px);
            overflow: auto;
        }
        .header {
            background-color: #282c34;
            color: #ffffff;
            padding: 10px;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .error-label {
            color: red;
            font-weight: bold;
            margin: 20px 0;
        }
        .grid-container {
            width: 100%;
            border-collapse: collapse;
        }
        .grid-container th, .grid-container td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        .grid-container thead {
            background-color: #282c34;
            color: #ffffff;
        }
        .grid-container tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .grid-container tbody tr:hover {
            background-color: #ddd;
        }
        .grid-container tfoot {
            background-color: #282c34;
            color: #ffffff;
            font-weight: bold;
        }
        .pager-style {
            background-color: #61dafb;
            color: #282c34;
            text-align: center;
        }
        .grid-container td {
            color: #333333;
        }
        .mylabel {
            font-weight: bold;
            color: #282c34;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <ul>
                <li><a href="managerwelcome.aspx" class="parent"><span>Home</span></a></li>
                <li><a href="manageremployees.aspx"><span>Employees Detail</span></a></li>
                <li><a href="payslips.aspx"><span>Pay Slips</span></a></li>
                <li><a href="logout.aspx"><span>Log Out</span></a></li>
            </ul>
        </div>
        <div class="container">
            <div class="header">
                Employees
            </div>
            <asp:Label ID="lblPageTitle" runat="server" CssClass="mylabel" Text="Employees:"></asp:Label>
            <asp:GridView ID="gridEmployees" runat="server" CssClass="grid-container" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="EmployeesID" HeaderText="Employee ID" />
                    <asp:BoundField DataField="EmpName" HeaderText="Name" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Designation" HeaderText="Designation" />
                    <asp:BoundField DataField="LevelID" HeaderText="Level" />
                    <asp:BoundField DataField="UserName" HeaderText="Username" />
                    <asp:BoundField DataField="Passwordd" HeaderText="Password" />
                </Columns>
                <FooterStyle CssClass="footer-style" />
                <RowStyle CssClass="row-style" />
                <PagerStyle CssClass="pager-style" />
                <SelectedRowStyle CssClass="selected-row-style" />
                <HeaderStyle CssClass="header-style" />
                <AlternatingRowStyle CssClass="alternating-row-style" />
            </asp:GridView>
            <asp:Label ID="lblError" runat="server" CssClass="error-label"></asp:Label>
        </div>
    </form>
</body>
</html>
