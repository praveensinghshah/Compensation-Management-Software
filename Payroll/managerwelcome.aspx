<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerwelcome.aspx.cs" Inherits="managerwelcome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager Welcome</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        .nav-bar {
            width: 250px; 
            background-color: #282c34;
            color: #ffffff;
            height: 100%;
            padding-top: 20px;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }
        .nav-bar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .nav-bar li {
            margin: 0;
        }
        .nav-bar a {
            display: block;
            color: #ffffff;
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }
        .nav-bar a:hover, .nav-bar a.active {
            background-color: #61dafb;
            color: #282c34;
        }
        .nav-bar .parent {
            font-weight: bold;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            flex: 1;
            background-color: #ffffff;
            height: 100%;
            overflow-y: auto;
        }
        .content h1 {
            color: #282c34;
        }
        .mylabel {
            font-family: Tahoma, sans-serif;
            font-size: 16px;
        }
        .error {
            color: red;
        }
        .welcome {
            color: #4caf50;
            font-size: 40px;
        }
        .content .info-box {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="nav-bar">
                <ul>
                    <li><a href="managerwelcome.aspx" class="parent"><span id="navHeader">Home</span></a></li>
                    <li><a href="manageremployees.aspx"><span>Employees Detail</span></a></li>
                    <li><a href="payslips.aspx"><span>Pay Slips</span></a></li>
                    <li><a href="logout.aspx"><span>Log Out</span></a></li>
                </ul>
            </div>
            <div class="content">
                <asp:Label ID="lblError" runat="server" CssClass="mylabel error"></asp:Label>

                <div class="info-box">
                    <asp:Label ID="lblWelcome" runat="server" CssClass="mylabel welcome">
                        Welcome to Manager!!
                    </asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
