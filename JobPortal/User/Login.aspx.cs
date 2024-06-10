using System;
using System.Data.SqlClient;
using System.Configuration;

namespace JobPortal.User
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sdr;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string Username = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlLoginType.SelectedValue == "Admin")
                {
                    // Admin login logic
                    Username = ConfigurationManager.AppSettings["Username"];
                    string passwordFromConfig = ConfigurationManager.AppSettings["Password"];

                    if (Username == txtUserName.Text.Trim() && passwordFromConfig == txtPassword.Text.Trim())
                    {
                        Session["Admin"] = Username;
                        Response.Redirect("../Admin/Dashboard.aspx", false);
                    }
                    else
                    {
                        showErrorMsg("Admin");
                    }
                }
                else
                {
                    con = new SqlConnection(str);
                    string query = @"SELECT UserId, Username, Password FROM [User] WHERE Username = @Username";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                    con.Open();

                    sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        // Check if the entered password matches the one in the database
                        string passwordFromDB = sdr["Password"].ToString();
                        if (txtPassword.Text.Trim() == passwordFromDB)
                        {
                            Session["User"] = sdr["Username"].ToString();
                            Session["UserId"] = sdr["UserId"].ToString();

                            // Additional debugging statement
                            Response.Write("<script>alert('Redirecting to Default.aspx');</script>");

                            Response.Redirect("Default.aspx", false);
                        }
                        else
                        {
                            showErrorMsg("User: Incorrect Password");
                        }
                    }
                    else
                    {
                        showErrorMsg("User: No matching user found");
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "'); </script>");
                con.Close();
            }
        }

        private void showErrorMsg(string userType)
        {
            lblMsg.Visible = true;
            lblMsg.Text = "<b>" + userType + "</b>" + " Give appropriate credentials.";
            lblMsg.CssClass = "alert alert-danger";
        }
    }
}
