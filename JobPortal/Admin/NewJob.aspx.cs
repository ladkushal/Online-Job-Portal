using System;
using System.Data.SqlClient;
using System.Configuration;

namespace JobPortal.Admin
{
    public partial class NewJob : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
        }

        protected void btnAddJob_Click(object sender, EventArgs e)
        {
            try
            {
                string imagePath = string.Empty;
                bool isValidToExecute = false;
                con = new SqlConnection(str);

                string query = "INSERT INTO Job VALUES(@JobTitle, @NoOfPost, @Description, @Qualification, " +
                               "@Experience, @LastDateToApply, @Salary, @JobType, @CompanyName, @CompanyLogo, " +
                               "@Website, @Email, @Address, @Skills, @State, @City, @PinCode, @WorkingHours, @CreateDate)";
                DateTime time = DateTime.Now;
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@JobTitle", txtJobTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@NoOfPost", txtNoPost.Text.Trim());
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@Qualification", txtQulification.Text.Trim());
                cmd.Parameters.AddWithValue("@Experience", txtExpReq.Text.Trim());
                cmd.Parameters.AddWithValue("@LastDateToApply", txtLastDate.Text.Trim());
                cmd.Parameters.AddWithValue("@Salary", txtSalary.Text.Trim());
                cmd.Parameters.AddWithValue("@JobType", ddlJobType.SelectedValue);
                cmd.Parameters.AddWithValue("@CompanyName", txtComName.Text.Trim());
                cmd.Parameters.AddWithValue("@Website", txtWebsite.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAdd.Text.Trim());
                cmd.Parameters.AddWithValue("@Skills", txtSkills.Text.Trim());
                cmd.Parameters.AddWithValue("@State", txtState.Text.Trim());
                cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                cmd.Parameters.AddWithValue("@PinCode", txtPinCode.Text.Trim());
                cmd.Parameters.AddWithValue("@WorkingHours", txtWorkHours.Text.Trim());
                cmd.Parameters.AddWithValue("@CreateDate", time.ToString("yyyy-MM-dd HH:mm:ss"));

                if (txtComLogo.HasFile)
                {
                    if (Utills.IsValidExtension(txtComLogo.FileName))
                    {
                        Guid obj = Guid.NewGuid();
                        imagePath = "Image/" + obj.ToString() + txtComLogo.FileName;
                        txtComLogo.PostedFile.SaveAs(Server.MapPath("~/Image/") + obj.ToString() + txtComLogo.FileName);
                        cmd.Parameters.AddWithValue("@CompanyLogo", imagePath);
                        isValidToExecute = true;
                    }
                    else
                    {
                        lblMsg.Text = "Please select logo in .Jpg or .Jpeg or .Png File";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@CompanyLogo", imagePath);
                    isValidToExecute = true;
                }
                if (isValidToExecute)
                {
                    con.Open();
                    int r = cmd.ExecuteNonQuery();
                    if (r > 0)
                    {
                        lblMsg.Text = "Job Saved successfully!";
                        lblMsg.CssClass = "alert alert-success";
                        ClearFields();
                    }
                    else
                    {
                        lblMsg.Text = "Cannot save the record, please try again";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "An error occurred: " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
            finally
            {
                con.Close();
            }
        }

        private void ClearFields()
        {
            txtJobTitle.Text = string.Empty;
            txtNoPost.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtQulification.Text = string.Empty;
            txtExpReq.Text = string.Empty;
            txtLastDate.Text = string.Empty;
            txtSalary.Text = string.Empty;
            ddlJobType.SelectedIndex = 0;
            txtComName.Text = string.Empty;
            txtWebsite.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAdd.Text = string.Empty;
            txtSkills.Text = string.Empty;
            txtState.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtPinCode.Text = string.Empty;
            txtWorkHours.Text = string.Empty;
        }

        //private bool IsValidExtension(string fileName)
        //{
        //    string[] validExtensions = { ".jpg", ".jpeg", ".png" };
        //    string extension = System.IO.Path.GetExtension(fileName);
        //    return Array.Exists(validExtensions, element => element.Equals(extension, StringComparison.InvariantCultureIgnoreCase));
        //}
    }
}
