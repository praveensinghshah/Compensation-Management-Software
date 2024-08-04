<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <!-- Bootstrap CSS for improved styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f8f9fa;
        }

        .login-container {
            background-color: #ffffff; 
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 350px;
        }

        .mylabel {
            font-weight: bold;
            color: #333333;
        }

        .mytextbox {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
        }

        .mybutton {
            background-color: #28a745;
            color: #ffffff;
            font-weight: bold;
            border: none;
            width: 100%;
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .mybutton:hover {
            background-color: #218838;
        }

        .text-center {
            text-align: center;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        // Client-side validation
        function validateForm() {
            var userName = document.getElementById('<%= txtUserName.ClientID %>').value;
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;
            if (userName === "" || password === "") {
                alert("Please fill in all fields.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h3 class="text-center mylabel">Login</h3>
            <asp:Label ID="lblError" runat="server" CssClass="mylabel text-center" Font-Bold="True" ForeColor="Red"></asp:Label>
            <div class="form-group">
                <label for="txtUserName" class="mylabel">User Name:</label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control mytextbox" TabIndex="20"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword" class="mylabel">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mytextbox" TextMode="Password" TabIndex="30"></asp:TextBox>
            </div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn mybutton" OnClientClick="return validateForm()" OnClick="btnSubmit_Click" />
        </div>
    </form>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
