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
    public partial class ResumeBuild : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sdr;
        //DataTable dt;
        //SqlDataAdapter sda;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                if(Request.QueryString["id"] != null)
                {
                    showUserInfo();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }

        }

        private void showUserInfo()
        {

            try
            {
                con = new SqlConnection(str);
                string query = "Select * from [User] where UserId=@UserId";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
                con.Open();
                sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    if (sdr.Read())
                    {
                        txtUserName.Text = sdr["Username"].ToString();
                        txtFullName.Text = sdr["Name"].ToString();
                        txtAddress.Text = sdr["Address"].ToString();
                        txtMobile.Text = sdr["Mobile"].ToString();
                        txtTenth.Text = sdr["TenthGrade"].ToString();
                        txtTwelfth.Text = sdr["TwelfthGrade"].ToString();
                        txtBachlore.Text = sdr["GraduationGrade"].ToString();
                        txtMaster.Text = sdr["PostGraduationGrade"].ToString();
                        txtPhd.Text = sdr["phd"].ToString();
                        txtWorksOn.Text = sdr["WorksOn"].ToString();
                        txtSkills.Text = sdr["Skills"].ToString();

                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "User Not Found";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                if(Request.QueryString["id"]!=null)
                {
                    string concatQuery = string.Empty;
                    string filePath = string.Empty;
                    //bool isValidToExecute = false;
                    bool isValid = false;
                    string query;
                    con = new SqlConnection(str);
                    if(txtResume.HasFile)
                    {
                        if(Utills.IsValidForResume(txtResume.FileName))
                        {
                            concatQuery = "Resume=@resume," ;
                            isValid = true;
                        }
                        else
                        {
                            //concatQuery = string.Empty;
                            lblMsg.Visible = true;
                            lblMsg.Text = "Please Select .doc or .pdf file for upload the resume";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        concatQuery = string.Empty;
                    }

                    query = @"Update [User] set Username = @Username , Name = @Name , Email = @Email , Mobile = @Mobile , TenthGrade = @TenthGrade , TwelfthGrade = @TwelfthGrade, GraduationGrade = @GraduationGrade , PostGraduationGrade = @PostGraduationGrade , phd = @phd , WorksOn = @WorksOn," + concatQuery+  " Skills = @Skills,  Address = @Address where UserId = @UserId ";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Name",txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email",txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile",txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@TenthGrade",txtTenth.Text.Trim());
                    cmd.Parameters.AddWithValue("@TwelfthGrade",txtTwelfth.Text.Trim());
                    cmd.Parameters.AddWithValue("@GraduationGrade", txtBachlore.Text.Trim());
                    cmd.Parameters.AddWithValue("@PostGraduationGrade",txtMaster.Text.Trim());
                    cmd.Parameters.AddWithValue("@phd",txtPhd.Text.Trim());
                    cmd.Parameters.AddWithValue("@WorksOn",txtWorksOn.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address",txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@Skills", txtSkills.Text.Trim());
                    cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
                    
                    if(isValid)
                    {
                        Guid obj = Guid.NewGuid();
                        filePath = "Resume/" + txtResume.FileName;
                        txtResume.PostedFile.SaveAs(Server.MapPath("~/Resume/") + txtResume.FileName);
                        cmd.Parameters.AddWithValue("@resume", filePath);
                        //isValidToExecute = true;
                    }
                    else
                    {
                        isValid = true;
                    }
                    if(isValid)
                    {
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Resume Details Update Succesfully!!";
                            lblMsg.CssClass = "alert alert-success";
                            //ClearFields();
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Cannot Update the record, please try after sometime";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Cannot Update the record, relogin and try";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch(SqlException ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtUserName.Text.Trim() + "</b>" + "This username already exists. Please use another.";
                    lblMsg.CssClass = "alert alert-danger";
                }
                else
                {
                    Response.Write("<script> alert('"+ ex.Message+ "'); <script>");
                }
            }
            catch(Exception ex)
            {
                    Response.Write("<script> alert('"+ ex.Message+ "'); <script>");

            }
            finally
            {
                con.Close();
            }
        }
    }
}