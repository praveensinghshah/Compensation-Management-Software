<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="employeewelcome.aspx.cs" Inherits="employeewelcome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Welcome</title>
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
        .welcome-message {
            text-align: center;
            margin-top: 20%;
            color: #333;
        }
        .welcome-message .error {
            color: red;
            font-weight: bold;
        }
        .welcome-message .welcome {
            color: green;
            font-size: 30px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <ul>
            <li><a href="employeewelcome.aspx" class="parent"><span>Home</span></a></li>
            <li><a href="employeePayslips.aspx"><span>Pay Slips</span></a></li>
            <li><a href="logout.aspx"><span>Log Out</span></a></li>
        </ul>
    </div>
    <div class="container">
        <form id="form1" runat="server">
            <div class="welcome-message">
                <asp:Label ID="lblError" runat="server" CssClass="error"></asp:Label>
                <asp:Label ID="lblWelcome" runat="server" CssClass="welcome" Text="Welcome to"></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>
