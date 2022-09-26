using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EverestVideoLibrary
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    if (Session["role"].Equals(""))
            //    {
            //        LinkButton4.Visible = false;
            //        LinkButton5.Visible = false;

            //        LinkButton1.Visible = true;
            //        LinkButton2.Visible = true;

            //        btnid1.Visible = false;
            //        btnid2.Visible = false;

            //        LinkButton3.Visible = false;
            //        LinkButton7.Visible = false;

            //        LinkButton6.Visible = true;
            //        LinkButton11.Visible = false;
            //        LinkButton12.Visible = false;
            //        LinkButton8.Visible = false;
            //        LinkButton9.Visible = false;
            //        LinkButton10.Visible = false;
            //        LinkButton14.Visible = false;
            //        LinkButton20.Visible = false;
            //        LinkButton21.Visible = false;

            //    }

            //    if (Session["role"].Equals("user"))
            //    {

            //        LinkButton4.Visible = true;
            //        LinkButton5.Visible = true;

            //        LinkButton1.Visible = false;
            //        LinkButton2.Visible = false;

            //        LinkButton3.Visible = true;
            //        LinkButton7.Visible = true;
            //        btnid1.Visible = true;
            //        btnid2.Visible = true;
            //        LinkButton7.Text = "Hello " + Session["userid"].ToString();


            //        LinkButton6.Visible = true;
            //        LinkButton11.Visible = true;
            //        LinkButton12.Visible = true;
            //        LinkButton8.Visible = true;
            //        LinkButton9.Visible = true;
            //        LinkButton10.Visible = true;
            //        LinkButton14.Visible = false;
            //        LinkButton20.Visible = true;
            //        LinkButton21.Visible = true;
            //    }

            //    else if (Session["role"].Equals("admin"))
            //    {

            //        LinkButton4.Visible = true;
            //        LinkButton5.Visible = true;

            //        LinkButton1.Visible = false;
            //        LinkButton2.Visible = false;

            //        LinkButton3.Visible = true;
            //        LinkButton7.Visible = true;
            //        btnid1.Visible = true;
            //        btnid2.Visible = true;
            //        LinkButton7.Text = "Hello Admin";


            //        LinkButton6.Visible = false;
            //        LinkButton11.Visible = true;
            //        LinkButton12.Visible = true;
            //        LinkButton8.Visible = true;
            //        LinkButton9.Visible = true;
            //        LinkButton10.Visible = true;
            //        LinkButton14.Visible = true;
            //        LinkButton20.Visible = true;
            //        LinkButton21.Visible = true;
            //    }
            //}
            //catch (Exception ex)
            //{

            //}
        }


        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminLogin.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userLogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx");
        }

        //logout button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["userid"] = "";
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";

            LinkButton1.Visible = true;
            LinkButton2.Visible = true;
            

            LinkButton3.Visible = false;
            LinkButton7.Visible = false;


            LinkButton6.Visible = true;
            LinkButton11.Visible = false;
            LinkButton12.Visible = false;
            LinkButton8.Visible = false;
            LinkButton9.Visible = false; 
            LinkButton10.Visible = false; 
            LinkButton20.Visible = false;
            LinkButton21.Visible = false;
            btnid1.Visible = false;
            btnid2.Visible = false;

            Response.Redirect("home.aspx");
        }

        // view profile
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("userProfile.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("7.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("6.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("4.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("DVD.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("dvdCopy.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberCategory.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Member.aspx");
        }


        protected void LinkButton14_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageUser.aspx");
        }

        protected void LinkButton20_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cast.aspx");
        }

        protected void LinkButton21_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoanType.aspx");
        }
    }
}