using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class Cast : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            String a = txtCastID.Text;
            String b = txtFirstName.Text;
            String c = txtLastName.Text;

            if (a != "" && b != "" && c != "")
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
            txtCastID.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
        }
    }
}