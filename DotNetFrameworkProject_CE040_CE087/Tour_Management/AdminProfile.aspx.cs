using System;
using System.Web.UI;

namespace Tour_Management
{
    public partial class AdminProfile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to login if not logged in
            if (Session["AdminEmail"] == null)
            {
                Response.Redirect("AdminLogin2.aspx");
            }
        }
    }
}
