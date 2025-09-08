using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Tour_Management
{
    public partial class AdminLogin2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string pass = txtPassword.Text.Trim();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Admin WHERE Email=@Email AND Password=@Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", pass);

                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        Session["AdminEmail"] = email;
                        Response.Redirect("AdminProfile.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Email or Password!";
                    }
                }
            }
        }
    }
}
