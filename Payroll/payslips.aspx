<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payslips.aspx.cs" Inherits="payslips" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pay Slips</title>
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
        .header {
            background-color: #282c34;
            color: #ffffff;
            padding: 10px;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            color: #333333;
            margin-bottom: 5px;
        }
        .form-group select, .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .error-label {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
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
            background-color: #f9f9f9;
        }
        .grid-container tbody tr:hover {
            background-color: #e0e0e0;
        }
        .grid-container tfoot {
            background-color: #282c34;
            color: #ffffff;
            font-weight: bold;
        }
        .button-container {
            margin-top: 20px;
            text-align: right;
        }
        .button-container a {
            display: inline-block;
            padding: 10px 20px;
            font-size: 14px;
            color: #ffffff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button-container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <ul>
            <li><a href="managerwelcome.aspx" class="parent"><span>Home</span></a></li>
            <li><a href="manageremployees.aspx"><span>Employees Detail</span></a></li>
            <li><a href="payslips.aspx"><span>Pay Slips</span></a></li>
            <li><a href="logout.aspx"><span>Log Out</span></a></li>
        </ul>
    </div>
    <div class="container">
        <form id="form1" runat="server">
            <div class="header">
                Pay Slips
            </div>
            <div class="form-group">
                <label for="dropEmployee">Employee:</label>
                <asp:DropDownList ID="dropEmployee" runat="server" CssClass="form-control" 
                    AutoPostBack="True" OnSelectedIndexChanged="dropEmployee_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <asp:Label ID="lblError" runat="server" CssClass="error-label"></asp:Label>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-label"></asp:Label>
            <asp:GridView ID="gridPayslips" runat="server" CssClass="grid-container" AutoGenerateColumns="False" 
                OnRowDeleting="gridPayslips_RowDeleting" OnRowCommand="gridPayslips_RowCommand">
                <Columns>
                    <asp:BoundField DataField="PayslipID" HeaderText="Payslip ID" />
                    <asp:BoundField DataField="MonthAndYear" HeaderText="Month and Year" />
                    <asp:BoundField DataField="GeneratedOn" HeaderText="Generated On" />
                    <asp:BoundField DataField="BasicSalary" HeaderText="Basic Salary" />
                    <asp:BoundField DataField="NoOfLeaves" HeaderText="No. of Leaves" />
                    <asp:BoundField DataField="SalaryPerDay" HeaderText="Salary Per Day" />
                    <asp:BoundField DataField="DeductionForLeaves" HeaderText="Deduction For Leaves" />
                    <asp:BoundField DataField="NetSalary" HeaderText="Net Salary" />
                    <asp:ButtonField CommandName="Print" Text="Print" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#282c34" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="skyblue" ForeColor="#333333" />
                <PagerStyle BackColor="#e0e0e0" ForeColor="#333333" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#e0e0e0" Font-Bold="True" ForeColor="Navy" />
                <HeaderStyle BackColor="#282c34" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="white" />
            </asp:GridView>
            <div class="button-container">
                <asp:LinkButton ID="lnkGeneratePayslip" runat="server" CssClass="button-container" 
                    OnClick="lnkGeneratePayslip_Click" Visible="False">Generate Payslip...</asp:LinkButton>
            </div>
        </form>
    </div>
</body>
</html>
