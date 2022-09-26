using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void clear()
        {
            txtUserID.Text = "";
            txtFullName.Text = "";
            txtPassword.Text = "";
            txtDesignation.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String a = txtUserID.Text;
            String b = txtFullName.Text;
            String c = txtPassword.Text;
            String d = txtDesignation.Text;

            if (a != "" && b != "" && c != "" && d != "")
            {
                SqlDataSource1.Insert();
                clear();
            }
            else
            {
                MessageBox.Show("Required Fields Missing", "Alert !!");
            }
        }
    }
}