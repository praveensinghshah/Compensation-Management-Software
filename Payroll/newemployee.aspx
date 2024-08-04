<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newemployee.aspx.cs" Inherits="newemployee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Employee</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            font-family: Arial, sans-serif;
        }

        .sidebar {
            background-color: #343a40;
            color: #ffffff;
            padding: 20px;
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            overflow-y: auto;
        }

        .sidebar h4 {
            margin-bottom: 20px;
            color: #ffffff;
            text-transform: uppercase;
        }

        .sidebar a {
            color: #ffffff;
            text-decoration: none;
            font-size: 18px;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #495057;
            color: #17a2b8;
        }

        .content {
            margin-left: 500px;
            width: calc(100% - 270px);
            padding: 20px;
            background-color: #f8f9fa;
        }

        .container {
            width: 100%;
            max-width: 100%;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
            margin: auto;
        }

        .form-group label {
            font-weight: bold;
        }

        .error-message {
            color: #dc3545;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 1rem;
        }

        .submit-btn {
            background-color: #009933;
            color: #ffffff;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .submit-btn:hover {
            background-color: #007a00;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                padding: 10px;
            }

            .content {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Sidebar Navigation -->
        <div class="sidebar">
            <h4>Admin Panel</h4>
            <a href="adminwelcome.aspx">Dashboard</a>
            <a href="employees.aspx">Employee</a>
            <a href="settings.aspx">Settings</a>
            <a href="reports.aspx">Reports</a>
            <a href="logout.aspx">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <div class="container">
                <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>
                <h2 class="text-center">New Employee</h2>
                <div class="form-group">
                    <asp:Label ID="lblEmployeeID" runat="server" Text="Employee ID:" />
                    <asp:Label ID="lblEmpID" runat="server" CssClass="form-control"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblName" runat="server" Text="Name:" />
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Employee Name." ControlToValidate="txtName" CssClass="error-message" Font-Size="15px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone:" />
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" MaxLength="10" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" Text="E-Mail:" />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblDesignation" runat="server" Text="Designation:" />
                    <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblLevel" runat="server" Text="Level:" />
                    <asp:DropDownList ID="dropLevel" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblUsername" runat="server" Text="User Name:" />
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter User Name." ControlToValidate="txtUsername" CssClass="error-message" Font-Size="15px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" Text="Password:" />
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Password." ControlToValidate="txtPassword" CssClass="error-message" Font-Size="15px" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="submit-btn" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </form>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
