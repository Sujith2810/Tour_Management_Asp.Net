<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTour.aspx.cs" Inherits="Tour_Management.AddTour" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Tour</title>
    <style>
        body { font-family: Arial; background-color: #f5f5f5; }
        .container {
            width: 500px;
            margin: 50px auto;
            padding: 30px;
            background-color: #333;
            color: white;
            border-radius: 10px;
            opacity: 0.9;
        }
        .container h2 { text-align: center; }
        .container label { display: block; margin-top: 10px; }
        .container input, .container textarea {
            width: 100%; padding: 8px; margin-top: 5px; border-radius: 5px; border: none;
        }
        .container input[type="file"] { padding: 3px; }
        .btn-submit {
            margin-top: 20px; width: 100%; padding: 10px; font-size: 18px;
            background-color: #04AA6D; color: white; border: none; border-radius: 5px;
            cursor: pointer;
        }
        .btn-submit:hover { background-color: #028a5e; }
        .message { text-align: center; margin-top: 10px; font-size: 16px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Add New Tour</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <label>Tour Name</label>
            <asp:TextBox ID="tour_name" runat="server"></asp:TextBox>

            <label>Place</label>
            <asp:TextBox ID="place" runat="server"></asp:TextBox>

            <label>Days</label>
            <asp:TextBox ID="days" runat="server"></asp:TextBox>

            <label>Price</label>
            <asp:TextBox ID="price" runat="server"></asp:TextBox>

            <label>Locations</label>
            <asp:TextBox ID="locations" runat="server"></asp:TextBox>

            <label>Tour Info</label>
            <asp:TextBox ID="tour_info" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>

            <label>Upload Tour Image</label>
            <asp:FileUpload ID="FileUpload1" runat="server" />

            <asp:Button ID="Register" runat="server" Text="Add Tour" CssClass="btn-submit" OnClick="Register_Click" />
        </div>
    </form>
</body>
</html>
