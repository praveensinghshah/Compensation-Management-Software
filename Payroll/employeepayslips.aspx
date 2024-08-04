<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employeepayslips.aspx.cs" Inherits="employeepayslips" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Payslips</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
        }
        .navbar {
            width: 200px;
            background-color: #282c34;
            padding: 20px;
            box-shadow: 2px 0px 5px rgba(0, 0, 0, 0.2);
            height: 100vh;
            position: fixed;
        }
        .navbar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .navbar ul li {
            margin: 10px 0;
        }
        .navbar ul li a {
            text-decoration: none;
            color: #ffffff;
            display: block;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .navbar ul li a:hover {
            background-color: #007bff;
        }
        .container {
            margin-left: 220px;
            padding: 20px;
            flex: 1;
        }
        .error-message, .info-message {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .grid-container {
            margin-top: 20px;
            width: 100%;
            overflow-x: auto;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            color: #333;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        .gridview th, .gridview td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .gridview th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .gridview tr:nth-child(odd) {
            background-color: #ffffff;
        }
        .gridview tr:hover {
            background-color: #f1f1f1;
        }
        .gridview .pager-style {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 10px;
        }
        .gridview .selected-row-style {
            background-color: #e0e0e0;
            font-weight: bold;
            color: #333;
        }
        .gridview .footer-style {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <ul>
            <li><a href="employeewelcome.aspx">Home</a></li>
            <li><a href="employeepayslips.aspx">Payslips</a></li>
            <li><a href="logout.aspx">Log Out</a></li>
        </ul>
    </div>
    <div class="container">
        <form id="form1" runat="server">
            <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>
            <asp:Label ID="lblMessage" runat="server" CssClass="info-message"></asp:Label>
            <asp:Label ID="lblEmployee" runat="server" Text="Employee:" 
                CssClass="mylabel" Font-Bold="True" Font-Size="14px"></asp:Label>
            <div class="grid-container">
                <asp:GridView ID="gridPayslips" runat="server" CssClass="gridview" CellPadding="4" 
                    Font-Names="Tahoma" GridLines="None" AutoGenerateColumns="False" 
                    OnRowCommand="gridPayslips_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="PayslipID" HeaderText="Payslip ID" />
                        <asp:BoundField DataField="MonthAndYear" HeaderText="Month and Year" />
                        <asp:BoundField DataField="GeneratedOn" HeaderText="Generated On" />
                        <asp:BoundField DataField="BasicSalary" HeaderText="Basic Salary" />
                        <asp:BoundField DataField="NoofLeaves" HeaderText="No. of Leaves" />
                        <asp:BoundField DataField="SalaryPerDay" HeaderText="Salary Per Day" />
                        <asp:BoundField DataField="DeductionForLeaves" HeaderText="Deduction For Leaves" />
                        <asp:BoundField DataField="NetSalary" HeaderText="Net Salary" />
                        <asp:ButtonField CommandName="Print" Text="Print" />
                    </Columns>
                    <FooterStyle CssClass="footer-style" />
                    <RowStyle CssClass="gridview-row-style" />
                    <PagerStyle CssClass="pager-style" />
                    <SelectedRowStyle CssClass="selected-row-style" />
                    <HeaderStyle CssClass="gridview-header-style" />
                    <AlternatingRowStyle CssClass="gridview-alternating-row-style" />
                </asp:GridView>
            </div>
        </form>
    </div>
</body>
</html>
