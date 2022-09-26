using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class Studio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String a = txtStudioID.Text;
            String b = txtStudioName.Text;

            if (a != "" && b != "")
            {
                SqlDataSource1.Insert();
                clear();
            }
            else
            {
                MessageBox.Show("Required Fields Missing", "Alert !!");
            }
        }

        private void clear()
        {
            txtStudioID.Text = "";
            txtStudioName.Text = "";
        }
    }
}