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
    public partial class Job_Listing : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        //SqlDataReader sdr;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public int jobCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showJobList();
                RBSelectedColorChange();
            }
        }

        private void RBSelectedColorChange()
        {
            if(RadioButtonList1.SelectedItem.Selected == true)
            {
                RadioButtonList1.SelectedItem.Attributes.Add("class","selectedradio");
            }
        }

        private void showJobList()
        {
            if(dt == null)
            {
                con = new SqlConnection(str);
                string query = "Select JobId , JobTitle , Salary , JobType , CompneyName , CompneyLogo , State , City , PinCode , CreateDate from Job";
                cmd = new SqlCommand(query , con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
            lbljobCount.Text = JobCount(dt.Rows.Count);
        }

        string JobCount(int count)
        {
            if(count > 1)
            {
                return "Total <b>" + count + " </b>Job Found";
            }
            else if(count == 1)
            {
                return "Total" + count + "Job Found";
            }
            else
            {
                return "No Jobs Found";
            }
        }

        //protected void lbFilter_Click(object sender, EventArgs e)
        //{

        //}

        protected void lblReset_Click(object sender, EventArgs e)
        {
            CheckBoxList1.ClearSelection();
            RadioButtonList1.ClearSelection();
            RadioButtonList1.SelectedValue = "0";
            RBSelectedColorChange();
            showJobList();

        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string jobType = string.Empty;
            jobType = selectedCheckBox();
            if(jobType != "")
            {
                con = new SqlConnection(str);
                string query = "Select JobId , JobTitle , Salary , JobType , CompneyName , CompneyLogo , State , City , PinCode , CreateDate from Job where JobType IN(" + jobType +")";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();
            }
            else
            {
                showJobList();
            }
        }

        private string selectedCheckBox()
        {
            string jobType = string.Empty;
            for(int i =0; i< CheckBoxList1.Items.Count; i++)
            {
                if(CheckBoxList1.Items[i].Selected)
                {
                    jobType += "'" + CheckBoxList1.Items[i].Text + "',";
                }
            }
            return jobType = jobType.TrimEnd(',');      
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(RadioButtonList1.SelectedValue != "0")
            {
                string postedDate = string.Empty;
                postedDate = selectedRadioButton();
                con = new SqlConnection(str);
                string query = "Select JobId , JobTitle , Salary , JobType , CompneyName , CompneyLogo , State , City , PinCode , CreateDate from Job where Convert(Date,CreateDate) " + postedDate +" ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();
            }
            else
            {
                showJobList();
                RBSelectedColorChange();
            }
        }

        private string selectedRadioButton()
        {
            string postedDate = string.Empty;
            DateTime date = DateTime.Today;
            if(RadioButtonList1.SelectedValue == "1")
            {
                postedDate = "=Convert(DATE , '" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList1.SelectedValue == "2")
            {
                postedDate = "between Convert(DATE,'" + DateTime.Now.AddDays(-2).ToString("yyyy/MM/dd")+ "') and Convert(DATE,'"+date.ToString("yyyy/MM/dd")+"')";
            }
            else if (RadioButtonList1.SelectedValue == "3")
            {
                postedDate = "between Convert(DATE,'" + DateTime.Now.AddDays(-3).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList1.SelectedValue == "4")
            {
                postedDate = "between Convert(DATE,'" + DateTime.Now.AddDays(-4).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            else
            {
                postedDate = "between Convert(DATE,'" + DateTime.Now.AddDays(-10).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            return postedDate;
        }

        protected string GetImageUrl(Object url)
        {
            string url1 = "";
            if(string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "/Image/No_Image.png";
            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }
            return ResolveUrl(url1);    
        }


        public static string RelativeDate(DateTime theDate)
        {
            Dictionary<long, string> thresholds = new Dictionary<long, string>();
            int minute = 60;
            int hour = 60 * minute;
            int day = 24 * hour;
            thresholds.Add(60, "{0} seconds ago");
            thresholds.Add(minute * 2 , "a minute ago");
            thresholds.Add(45 * minute , "{0} minute ago");
            thresholds.Add(120 * minute , "a hour ago");
            thresholds.Add(day , "{0} hour ago");
            thresholds.Add(day * 2 , "yesterday");
            thresholds.Add(day * 30 , "{0} days ago");
            thresholds.Add(day * 365 , "{0} months ago");
            thresholds.Add(long.MaxValue , "{0} years ago");
            long since = (DateTime.Now.Ticks - theDate.Ticks) / 10000000;
            foreach(long threshold in thresholds.Keys)
            {
                if(since < threshold)
                {
                    TimeSpan t = new TimeSpan((DateTime.Now.Ticks - theDate.Ticks));

                    return string.Format(thresholds[threshold], (t.Days > 365 ? t.Days / 365 : (t.Days > 0 ? t.Days : (t.Hours > 0 ? t.Hours : (t.Minutes > 0 ? t.Minutes : t.Seconds > 0 ? t.Seconds : 0)))).ToString());

                }
            }
            return "";
        }

    }
}