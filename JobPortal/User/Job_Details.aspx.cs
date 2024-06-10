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
    public partial class Job_Details : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        
        SqlDataAdapter sda;
        DataTable dt,dt1;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            showJobDetails();
        }

        private void showJobDetails()
        {
            con = new SqlConnection(str);
            string query = @"Select * from Job where JobId = @id";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id",Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

            if(e.CommandName == "ApplyJob")
            {
                if(Session["user"] != null)
                {
                    try
                    {
                        con = new SqlConnection(str);
                        string query = @"Insert Into AppliedJobs values(@JobId , @UserId)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@JobId", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Job Applied Successfully!!";
                            lblMsg.CssClass = "alert alert-success";
                        }
                        else
                        {
                            lblMsg.Visible = false;
                            lblMsg.Text = "Cannot apply the job please try again later!!";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    catch(Exception ex)
                    {
                        Response.Write("<script> alert('" + ex.Message + "');</script>");
                    }
                    finally
                    {
                        con.Close();
                    }
                    
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            
        }

        bool isApplied()
        {
            con = new SqlConnection(str);
            string query = @"Select * from AppliedJobs where JobId = @JobId and UserId = @UserId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.Parameters.AddWithValue("@JobId", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt1 = new DataTable();
            sda.Fill(dt1);
            if(dt1.Rows.Count==1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if(Session["user"] != null)
            {
                LinkButton btnApplyJob = e.Item.FindControl("lbApplyJob") as LinkButton;
                if(isApplied())
                {
                    btnApplyJob.Enabled = false;
                    btnApplyJob.Text = "Applied";

                    lblMsg.Visible = true;
                    lblMsg.Text = "You already apply for a this job";
                    lblMsg.CssClass = "alert alert-success";
                }
                else
                {
                    btnApplyJob.Enabled = true;
                    btnApplyJob.Text = "Apply Now";
                }
            }
        }
    }
}