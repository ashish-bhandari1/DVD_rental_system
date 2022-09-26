using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class MemberCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String a = txtMemCatID.Text;
            String b = txtMemCat.Text;
            String c = txtTotalLoan.Text;

            if (a != "" && b != "" && c != "")
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
            txtMemCatID.Text = "";
            txtMemCat.Text = "";
            txtTotalLoan.Text = "";
        }
    }
}