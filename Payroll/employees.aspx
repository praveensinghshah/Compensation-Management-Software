<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employees.aspx.cs" Inherits="employees" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Management</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
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
            margin-left: 270px;
            padding: 20px;
            background-color: #f8f9fa;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: auto;
        }

        .page-title {
            text-align: center;
            font-weight: bold;
            font-size: 24px;
            color: #007bff;
            margin-bottom: 20px;
        }

        .grid-view {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .grid-view th {
            background-color: #007bff; 
            color: #ffffff; 
            padding: 15px;
            text-align: left;
        }

        .grid-view td {
            padding: 10px;
            text-align: left;
        }

        .grid-view tbody tr:nth-child(even) {
            background-color: #f9f9f9; 
        }

        .grid-view tbody tr:hover {
            background-color: #e9ecef; 
        }

        .error-label {
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            color: #dc3545;
            margin: 20px 0;
        }

        .new-employee-link {
            display: block;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
            text-decoration: none;
            margin: 20px 0;
            transition: color 0.3s ease;
        }

        .new-employee-link:hover {
            color: #0056b3;
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
            <a href="logout.aspx">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <div class="container">
                <asp:Label ID="lblPageTitle" runat="server" Text="Employees:" CssClass="page-title" />
                
                <asp:GridView ID="gridEmployees" runat="server" CssClass="grid-view" CellPadding="10" AutoGenerateColumns="False"
                    OnRowDeleting="gridEmployees_RowDeleting" OnRowUpdating="gridEmployees_RowUpdating" OnRowEditing="gridEmployees_RowEditing"
                    OnRowCancelingEdit="gridEmployees_RowCancelingEdit" DataKeyNames="EmployeesID">
                    <Columns>
                        <asp:BoundField DataField="EmployeesID" HeaderText="EmployeesID" ReadOnly="True" />
                        <asp:TemplateField HeaderText="EmpName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmpName" runat="server" Text='<%# Bind("EmpName") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmpName" runat="server" Text='<%# Bind("EmpName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Designation">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDesignation" runat="server" Text='<%# Bind("Designation") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Designation") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Level">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLevelId" runat="server" Text='<%# Bind("LevelID") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLevelId" runat="server" Text='<%# Bind("LevelID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UserName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtUsername" runat="server" Text='<%# Bind("UserName") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblUsername" runat="server" Text='<%# Bind("UserName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPasswordd" runat="server" Text='<%# Bind("Passwordd") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPasswordd" runat="server" Text='<%# Bind("Passwordd") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#007bff" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#ffffff" ForeColor="#333333" />
                    <PagerStyle BackColor="#007bff" ForeColor="#ffffff" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#0056b3" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#007bff" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#f9f9f9" />
                </asp:GridView>

                <asp:Label ID="lblError" runat="server" CssClass="error-label" />
                <asp:HyperLink ID="hypNewEmployee" runat="server" CssClass="new-employee-link" NavigateUrl="newemployee.aspx">New Employee</asp:HyperLink>
            </div>
        </div>
    </form>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
