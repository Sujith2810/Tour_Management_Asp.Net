<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="Tour_Management.AdminProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Profile</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }
        li { float: left; border-right:1px solid #bbb; }
        li:last-child { border-right: none; }
        li a {
            display: block; color: white; text-align: center;
            padding: 14px 16px; text-decoration: none;
        }
        li a:hover:not(.active) { background-color: #111; }
        .active { background-color: #04AA6D; }
        .page-header {
            text-align: center; padding: 30px; background-color: #444; color: white;
        }
        .container { padding: 20px; }
        h2 { margin-bottom: 15px; }
        .gridview {
            width: 100%; border-collapse: collapse; margin-top: 15px;
        }
        .gridview th, .gridview td {
            border: 1px solid #ccc; padding: 8px; text-align: center;
        }
        .gridview th { background-color: #333; color: white; }
        .gridview tr:nth-child(even) { background-color: #f9f9f9; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation -->
        <ul class="nav navbar nav-tabs">
            <li><a href="AdminProfile.aspx" class="active">Profile</a></li>
            <li><a href="AddTour.aspx">Add Tours</a></li>
            <li><a href="TourCrud.aspx">Manage Tours</a></li>
            <li><a href="AdminProfile.aspx#bookings">Current Bookings</a></li>
            <li style="float:right"><a href="Logout.aspx">Logout</a></li>
        </ul>

        <!-- Header -->
        <div class="page-header">
            <h1>Welcome to the Admin Section</h1>
            <p>You can manage tours, places, and bookings here.</p>
        </div>

        <!-- Current Bookings -->
        <div class="container" id="bookings">
            <h2>Current Bookings</h2>
            <asp:GridView ID="GridViewBookings" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                DataSourceID="SqlDataSourceBookings" DataKeyNames="BookingId">
                <Columns>
                    <asp:BoundField DataField="BookingId" HeaderText="Booking ID" ReadOnly="True" />
                    <asp:BoundField DataField="TOUR_NAME" HeaderText="Tour Name" />
                    <asp:BoundField DataField="PLACE" HeaderText="Place" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSourceBookings" runat="server"
                ConnectionString="<%$ ConnectionStrings:dbconnection %>"
                SelectCommand="SELECT BookingId, TOUR_NAME, PLACE, Email, FirstName FROM Booking"
                DeleteCommand="DELETE FROM Booking WHERE BookingId = @BookingId">
                <DeleteParameters>
                    <asp:Parameter Name="BookingId" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
