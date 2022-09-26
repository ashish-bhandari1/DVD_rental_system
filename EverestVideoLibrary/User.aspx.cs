using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EverestVideoLibrary
{

    public partial class User : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["applicationDevCWConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        // sign up button click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {

                Response.Write("<script>alert('User Already Exist with this User ID, try other ID');</script>");
            }
            else
            {
                signUpNewMember();
            }
        }

        // user defined method
        bool checkMemberExists()
        {
            try
            {
                SqlConnection applicationDevCWConnectionString = new SqlConnection(strcon);
                if (applicationDevCWConnectionString.State == ConnectionState.Closed)
                {
                    applicationDevCWConnectionString.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from [User] where UserID='" + TextBoxUserID.Text.Trim() + "';", applicationDevCWConnectionString);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void signUpNewMember()
        {
            //Response.Write("<script>alert('Testing');</script>");
            try
            {
                SqlConnection applicationDevCWConnectionString = new SqlConnection(strcon);
                if (applicationDevCWConnectionString.State == ConnectionState.Closed)
                {
                    applicationDevCWConnectionString.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO [User] (FullName,Designation,UserID,Password) values(@FullName,@Designation,@UserID,@Password)", applicationDevCWConnectionString);
                cmd.Parameters.AddWithValue("@FullName", TextBoxName.Text.Trim());
                cmd.Parameters.AddWithValue("@Designation", TextBoxDesignation.Text.Trim());
                cmd.Parameters.AddWithValue("@UserID", TextBoxUserID.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", TextBoxPassword.Text.Trim());
                cmd.ExecuteNonQuery();
                applicationDevCWConnectionString.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}