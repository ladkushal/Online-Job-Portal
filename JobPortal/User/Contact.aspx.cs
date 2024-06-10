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
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                string query = @"Insert into Contact values (@Name , @Email , @Subject , @Message)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", Name.Value.Trim());
                cmd.Parameters.AddWithValue("@Email", Email.Value.Trim());
                cmd.Parameters.AddWithValue("@Subject", Subject.Value.Trim());
                cmd.Parameters.AddWithValue("@Message", Message.Value.Trim());
                con.Open();
                
                int r = cmd.ExecuteNonQuery();
                if(r>0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Thanks for your response!!";
                    lblMsg.CssClass = "aleart alert-success";
                    clear();
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Your record cannot store in the database, Try after some-time!!!";
                    lblMsg.CssClass = "aleart alert-danger";
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert(' " +ex.Message + " ') </script>");
            }
            finally
            {
                con.Close();
            }
        }
        private void clear()
        {
            Name.Value = string.Empty;
            Email.Value = string.Empty;
            Subject.Value = string.Empty;
            Message.Value = string.Empty;
        }
    }
}