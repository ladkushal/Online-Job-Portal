using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace JobPortal.User
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        //SqlDataReader sdr;
        DataTable dt;
        SqlDataAdapter sda;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if(!IsPostBack)
            {
                showUserProfile();
            }
        }

        public void showUserProfile()
        {
            con = new SqlConnection(str);
            string query = "Select UserId,Username,Name,Address,Mobile,Email,Country,Resume from [User] where Username = @username";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username",Session["user"]);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            dlProfile.DataSource = dt;
            dlProfile.DataBind();
        }

        protected void dlProfile_ItemCommand(object source , DataListCommandEventArgs e)
        {
            if(e.CommandName == "EditUserProfile")
            {
                Response.Redirect("ResumeBuild.aspx?id=" + e.CommandArgument.ToString());

            }
        }
    }
}