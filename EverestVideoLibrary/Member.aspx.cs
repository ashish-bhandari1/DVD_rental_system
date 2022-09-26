using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class Member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String b = txtFirstName.Text;
            String c = txtLastName.Text;
            String f = txtAge.Text;
            String g = txtPhone.Text;
            String h = txtAddress.Text;

            if (b != "" && c != "" && f != "" && g != "" && h != "")
            {
                SqlDataSource2.Insert();
                clear();
            }
            else
            {
                MessageBox.Show("Required Fields Missing", "Alert !!");
            }
        }

        private void clear()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtAge.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
        }
    }
}