using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Tour_Management
{
    public partial class AddTour : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            // Validate required fields
            if (string.IsNullOrEmpty(tour_name.Text) || string.IsNullOrEmpty(place.Text) ||
                string.IsNullOrEmpty(days.Text) || string.IsNullOrEmpty(price.Text))
            {
                lblMessage.Text = "Please fill all required fields!";
                return;
            }

            string picFileName = null;

            // Handle file upload
            if (FileUpload1.HasFile)
            {
                string folderPath = Server.MapPath("~/Tour_pics/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath); // create folder if not exist
                }

                picFileName = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Path.Combine(folderPath, picFileName));
            }

            // Insert into database
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
            {
                conn.Open();
                string insertQuery = @"INSERT INTO Tour 
                    (TOUR_NAME, PLACE, DAYS, PRICE, LOCATIONS, TOUR_INFO, pic)
                    VALUES
                    (@TOUR_NAME, @PLACE, @DAYS, @PRICE, @LOCATIONS, @TOUR_INFO, @pic)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@TOUR_NAME", tour_name.Text);
                    cmd.Parameters.AddWithValue("@PLACE", place.Text);
                    cmd.Parameters.AddWithValue("@DAYS", days.Text);
                    cmd.Parameters.AddWithValue("@PRICE", price.Text);
                    cmd.Parameters.AddWithValue("@LOCATIONS", locations.Text);
                    cmd.Parameters.AddWithValue("@TOUR_INFO", tour_info.Text);
                    cmd.Parameters.AddWithValue("@pic", (object)picFileName ?? DBNull.Value);

                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "Tour added successfully!";
            ClearFields();
        }

        private void ClearFields()
        {
            tour_name.Text = "";
            place.Text = "";
            days.Text = "";
            price.Text = "";
            locations.Text = "";
            tour_info.Text = "";
        }
    }
}
