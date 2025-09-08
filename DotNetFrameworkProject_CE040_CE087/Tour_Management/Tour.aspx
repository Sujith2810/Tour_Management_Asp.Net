<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tour.aspx.cs" Inherits="Tour_Management.Tour" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Available Tours</title>
    <style>
        body { font-family: Arial; }
        h1 { text-align: center; }
        .grid-container { display: flex; justify-content: center; margin-top: 30px; }
    </style>
</head>
<body>
    <h1>Available Tours</h1>
    <div class="grid-container">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="800px">
            <Columns>
                <asp:BoundField DataField="TOUR_NAME" HeaderText="Tour Name" />
                <asp:BoundField DataField="PLACE" HeaderText="Place" />
                <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                <asp:BoundField DataField="DAYS" HeaderText="Days" />
                <asp:BoundField DataField="LOCATIONS" HeaderText="Locations" />
                <asp:BoundField DataField="TOUR_INFO" HeaderText="Info" />
                <asp:ImageField DataImageUrlField="pic" HeaderText="Image" ControlStyle-Width="100px" ControlStyle-Height="100px" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:dbconnection %>"
        SelectCommand="SELECT * FROM Tour">
    </asp:SqlDataSource>
</body>
</html>
