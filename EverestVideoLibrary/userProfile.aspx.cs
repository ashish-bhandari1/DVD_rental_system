using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EverestVideoLibrary
{
    public partial class userProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["applicationDevCWConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["userid"] == "")
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("userLogin.aspx");
                }
                else
                {
                    getUserData();
                    if (!Page.IsPostBack)
                    {
                        getUserDetails();
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["userid"].ToString() == "" || Session["userid"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("userLogin.aspx");
                }
                else
                {
                    updateUserDetails();
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userLogin.aspx");
            }
        }


        void updateUserDetails()
        {
            {
                string password = "";
                if (TextBoxNew.Text.Trim() == "")
                {
                    password = TextBoxOld.Text.Trim();
                }
                else
                {
                    password = TextBoxNew.Text.Trim();
                }

                try
                {
                    SqlConnection applicationDevCWConnectionString = new SqlConnection(strcon);
                    if (applicationDevCWConnectionString.State == ConnectionState.Closed)
                    {
                        applicationDevCWConnectionString.Open();
                    }

                    SqlCommand cmd = new SqlCommand("update [User] set FullName=@Fullname, Password=@Password WHERE UserID='" + Session["userid"].ToString().Trim() + "'", applicationDevCWConnectionString);

                    cmd.Parameters.AddWithValue("@Fullname", TextBoxName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", password);

                    int result = cmd.ExecuteNonQuery();
                    applicationDevCWConnectionString.Close();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('Details Successfully Updated');</script>");
                        getUserDetails();
                        getUserData();
                    }
                    else
                    {
                        Response.Write("<script>alert('Invaid entry');</script>");
                    }
                }
                 catch (Exception ex)
                {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }
        
        void getUserDetails()
        {
            try
            {
                SqlConnection applicationDevCWConnectionString = new SqlConnection(strcon);
                if (applicationDevCWConnectionString.State == ConnectionState.Closed)
                {
                    applicationDevCWConnectionString.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from [User] where UserID='" + Session["userid"].ToString() + "';", applicationDevCWConnectionString);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBoxName.Text = dt.Rows[0]["FullName"].ToString();
                TextBoxDesignation.Text = dt.Rows[0]["Designation"].ToString();
                TextBoxID.Text = dt.Rows[0]["UserID"].ToString();
                TextBoxOld.Text = dt.Rows[0]["Password"].ToString();


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void getUserData()
        {
            try
            {
                SqlConnection applicationDevCWConnectionString = new SqlConnection(strcon);
                if (applicationDevCWConnectionString.State == ConnectionState.Closed)
                {
                    applicationDevCWConnectionString.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from [User] where UserID='" + Session["userid"].ToString() + "';", applicationDevCWConnectionString);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }


    }
}