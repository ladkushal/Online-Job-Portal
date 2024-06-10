using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;    
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace JobPortal.Admin
{
    public partial class JobList : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        //string query = null;
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");

            }

            if (!IsPostBack)
            {
                ShowJob();
            }
        }

        //public void FillDate()
        //{
        //    if (Request.QueryString ["id"] != null)
        //    {
        //        con = new SqlConnection(str);
        //        query = "Select * from Job where JobId = '" + Request.QueryString["id"] + "' ";
        //        cmd = new SqlCommand(query,con);
        //        con.Open();
        //        SqlDataReader sdr = cmd.ExecuteReader();
        //        if(sdr.HasRows)
        //        {
        //            while(sdr.Read())
        //            {
        //                txtJobTitle.Text = sdr["Title"].ToString();
                          
        //            }
        //        }
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowJob();
        }

        private void ShowJob()
        {
            string query = string.Empty;
            con = new SqlConnection(str);
            query = @"Select Row_Number() over(Order by (select 1))  as [Sr.No],JobId, CompneyName ,JobTitle, NoOfPost,Experience, Salary, JobType,Website, Email, Address, State, City, PinCode , LastDateToApply, WorkingHours, CreateDate from Job";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowJob();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int jobId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                con = new SqlConnection(str);
                cmd = new SqlCommand("Delete from Job where JobId = @id", con);
                cmd.Parameters.AddWithValue("@id", jobId);
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if(r>0)
                {
                    lblMsg.Text = "Job Delete Successfully";
                    lblMsg.CssClass = "alert alert-success";
                }
                else
                {
                    lblMsg.Text = "Cannot delete the Job,Please try again later..";
                    lblMsg.CssClass = "alert alert-danger";
                }
                con.Close();
                GridView1.EditIndex = -1;
                ShowJob();
            }
            catch(Exception ex)
            {
                con.Close();
                lblMsg.Text = "An error occurred: " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "EditJob")
            {
                Response.Redirect("NewJob.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}