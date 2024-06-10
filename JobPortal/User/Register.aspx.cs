using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace JobPortal.User
{
    public partial class Register : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    // Check if the connection can be opened
                    if (!TryOpenConnection(con))
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Failed to establish a connection to the database.";
                        lblMsg.CssClass = "alert alert-danger";
                        return; // Exit the method if the connection failed
                    }

                    string query = @"INSERT INTO [User] (Username, Password, Name, Address, Mobile, Email) VALUES (@Username, @Password, @Name, @Address, @Mobile, @Email)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                        int r = cmd.ExecuteNonQuery();

                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Registered successfully!";
                            lblMsg.CssClass = "alert alert-success";
                            clear();
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Your record cannot be stored in the database. Try again later.";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                }
                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "<b>" + txtUserName.Text.Trim() + "</b>" + "This username already exists. Please use another.";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
                finally
                {
                    con.Close(); // Close the connection in the finally block
                }
            }
        }

        private bool TryOpenConnection(SqlConnection connection)
        {
            try
            {
                connection.Open();
                return true;
            }
            catch (SqlException)
            {
                return false;
            }
        }

        private void clear()
        {
            txtUserName.Text = txtPassword.Text = txtMobile.Text = txtFullName.Text = txtEmail.Text = txtConfirmPassword.Text = txtAddress.Text = string.Empty;
        }
    }
}
