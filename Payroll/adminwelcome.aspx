<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminwelcome.aspx.cs" Inherits="adminwelcome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Home</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        body {
            display: flex;
            flex-direction: row;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            overflow: hidden;
        }

        .sidebar {
            background-color: #343a40;
            color: #ffffff;
            padding: 20px;
            width: 250px;
            height: 100%;
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
            margin-left: 300px;
            width:100%;
            height: 100vh;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #ffffff;
            overflow-y: auto;
        }

        .welcome-message {
            font-size: 36px;
            font-weight: bold;
            font-family: Tahoma, sans-serif;
            color: #28a745;
            margin-bottom: 20px;
            text-align: center;
        }

        .info-text {
            font-size: 18px;
            color: #6c757d;
            margin-bottom: 20px;
            text-align: center;
        }

        .admin-actions {
            text-align: center;
        }

        .admin-actions a {
            color: #007bff;
            text-decoration: none;
            font-size: 18px;
            margin-right: 15px;
            display: inline-block;
            margin-bottom: 10px;
        }

        .admin-actions a:hover {
            text-decoration: underline;
        }

        .error-message {
            font-size: 16px;
            font-weight: bold;
            color: #dc3545;
            margin-bottom: 20px;
            text-align: center;
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
            <a href="logout.aspx">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>
            <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-message">Welcome to the Admin Home Page!</asp:Label>
            <p class="info-text">Here you can manage your application, view reports, and access various administrative functions.</p>
        </div>
    </form>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
