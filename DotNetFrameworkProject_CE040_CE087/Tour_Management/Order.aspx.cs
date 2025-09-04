using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Tour_Management
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btn_click(object sender, EventArgs e)
        {
            // Connection to the database
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                conn.Open();

                // Insert query without TOUR_ID
                string insertQuery = "INSERT INTO booking (TOUR_NAME, PLACE, Email, FirstName) " +
                                     "VALUES (@TOUR_NAME, @PLACE, @Email, @FirstName)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@TOUR_NAME", tour_name.Text);
                    cmd.Parameters.AddWithValue("@PLACE", city.Text);
                    cmd.Parameters.AddWithValue("@Email", number.Text);
                    cmd.Parameters.AddWithValue("@FirstName", name.Text);

                    cmd.ExecuteNonQuery();
                }

                conn.Close();
            }

            // Redirect to mybooking page
            Response.Redirect("mybooking.aspx");
        }
    }
}
