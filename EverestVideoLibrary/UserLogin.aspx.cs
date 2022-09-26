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
    public partial class UserLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["applicationDevCWConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // user login
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection applicationDevCWConnectionString = new SqlConnection(strcon);
                if (applicationDevCWConnectionString.State == ConnectionState.Closed)
                {
                    applicationDevCWConnectionString.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from [User] where UserID='" + TextBoxID.Text.Trim() + "' AND Password='" + TextBoxPassword.Text.Trim() + "'", applicationDevCWConnectionString);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Login Successful');</script>");
                        Session["userid"] = dr.GetValue(2).ToString();
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                    }
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}