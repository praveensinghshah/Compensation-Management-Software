<%@ Page Language="C#" AutoEventWireup="true" CodeFile="generatepayslip.aspx.cs" Inherits="generatepayslip" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generate Payslip</title>
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
        #centeredForm {
            margin: auto;
            width: 60%;
            padding: 20px;
            border-radius: 8px;
            background-color: #f8f9fa;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .form-group {
            margin-bottom: 30px; 
        }
        .form-group label {
            display: block;
            font-weight: bold;
            color: #333333;
            margin-bottom: 10px; 
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-top: 5px; 
        }
        .button-container {
            margin-top: 20px;
            text-align: right;
        }
        .button-container button {
            padding: 10px 20px;
            font-size: 14px;
            color: #ffffff;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .button-container button:hover {
            background-color: #218838;
        }
        .error-label {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
        }
        #lblPageTitle {
            text-align: center; 
            margin-bottom: 30px; 
            font-size: 18px;
            font-weight: bold;
            color: red;
            display: block;
            width: 100%;
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
            <div id="centeredForm">
                <asp:Label ID="lblError" runat="server" CssClass="error-label"></asp:Label>
                <asp:Label ID="lblPageTitle" runat="server" Text="Generate Payslip:" 
                    CssClass="form-group" Font-Bold="True" Font-Size="18px" ForeColor="Red"></asp:Label>

                <div class="form-group">
                    <asp:Label ID="LabelEmployee" runat="server" Text="Employee:" />
                    <asp:Label ID="lblEmployee" runat="server" />
                    <asp:DropDownList ID="dropMonth" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="dropMonth_SelectedIndexChanged">
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="dropYear" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="dropYear_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label ID="LabelBasicSalary" runat="server" Text="Basic Salary:" />
                    <asp:Label ID="lblBasicSalary" runat="server" />
                </div>

                <div class="form-group">
                    <asp:Label ID="LabelSalaryPerDay" runat="server" Text="Salary Per Day:" />
                    <asp:Label ID="lblSalaryPerDay" runat="server" />
                </div>

                <div class="form-group">
                    <asp:Label ID="LabelDeductionForLeaves" runat="server" Text="Deduction for Leaves:" />
                    <asp:Label ID="lblDeductionForLeaves" runat="server" />
                </div>

                <div class="form-group">
                    <asp:Label ID="LabelNetSalary" runat="server" Text="Net Salary:" />
                    <asp:Label ID="lblNetSalary" runat="server" />
                </div>

                <div class="form-group">
                    <asp:Label ID="LabelNoOfLeaves" runat="server" Text="No. of Leaves:" />
                    <asp:TextBox ID="txtNoOfLeaves" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="txtNoOfLeaves_TextChanged">0</asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Value should be between 0 and 31" ControlToValidate="txtNoOfLeaves" CssClass="error-label" MaximumValue="31" MinimumValue="0" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter User Name." ControlToValidate="txtNoOfLeaves" CssClass="error-label" Font-Size="15px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </div>

                <div class="button-container">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" BackColor="#009933" BorderStyle="Groove" CssClass="button-container" Font-Bold="True" ForeColor="Yellow" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </form>
    </div>
</body>
</html>
