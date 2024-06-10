using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortal.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sdr;
        DataTable dt;
        SqlDataAdapter sda;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["admin"] == null)
            {
                Response.Redirect("../User/Loginaspx");
            }
            if(!IsPostBack)
            {
                Users();
                Jobs();
                AppliedJobs();
                ContactCount();
            }
        }

        private void ContactCount()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from Contact",con);
            dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count>0)
            {
                Session["Contact"] = dt.Rows[0][0];
            }
            else
            {
                Session["Contact"] = 0;
            }
        }

        private void AppliedJobs()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from AppliedJobs", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["AppliedJobs"] = dt.Rows[0][0];
            }
            else
            {
                Session["AppliedJobs"] = 0;
            }
        }

        private void Jobs()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from Job", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Job"] = dt.Rows[0][0];
            }
            else
            {
                Session["Job"] = 0;
            }
        }

        private void Users()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from [User]", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["User"] = dt.Rows[0][0];
            }
            else
            {
                Session["User"] = 0;
            }
        }
    }
}