<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin2.aspx.cs" Inherits="Tour_Management.AdminLogin2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style>
        .container {
            text-align: center;
            background-color: black;
            width: 100%;
            font-size: 30px;
            color: white;
            padding-bottom: 150px;
            opacity: 0.8;
        }
        .input-field {
            font-size: 20px;
            margin: 10px 0;
        }
        .btn-login {
            font-size: 20px;
            padding: 5px 15px;
        }
        .error-message {
            color: red;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Admin Login</h1>

            <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label><br />

            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label><br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field"></asp:TextBox><br />

            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox><br />

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
