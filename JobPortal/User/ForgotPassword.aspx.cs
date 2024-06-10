using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal.User
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd;
            //SqlConnection con;
            //SqlDataReader sdr;
            //DataTable dt;
            //SqlDataAdapter sda;
            string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

            string username = txtFpUserName.Text.Trim();
            string email = txtFpEmail.Text.Trim();
            string newPassword = txtFpCnfPassword.Text.Trim();

            using (SqlConnection connection = new SqlConnection(str))
            {
                connection.Open();
                cmd = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE Username = @Username AND Email = @Email", connection);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);

                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    // Update password
                    SqlCommand updateCmd = new SqlCommand("UPDATE [User] SET Password = @Password WHERE Username = @Username", connection);
                    updateCmd.Parameters.AddWithValue("@Password", newPassword);
                    updateCmd.Parameters.AddWithValue("@Username", username);
                    updateCmd.ExecuteNonQuery();

                    lblMsg.Visible = true;
                    lblMsg.Text = "Your Password change success!!";
                    lblMsg.CssClass = "alert alert-success";
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Invalid UserName or Password ";
                    lblMsg.CssClass = "alert alert-danger";
                }

            }
        }
    }
}