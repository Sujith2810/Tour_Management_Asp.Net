using System;
using System.Web.UI;

namespace Tour_Management
{
    public partial class Tour : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = SqlDataSource1;
                GridView1.DataBind();
            }
        }
    }
}
