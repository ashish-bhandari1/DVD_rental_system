using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class LoanType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String a = txtTypeID.Text;
            String b = txtLoanTypeName.Text;
            String c = txtDuration.Text;
            String d = txtChargePerDay.Text;

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

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            int a = int.Parse(txtDuration.Text);
            int b = int.Parse(txtChargePerDay.Text);
            double c = (a * b) * 0.5;
            txtPenalty.Text = c.ToString();
        }

        private void clear()
        {
            txtTypeID.Text = "";
            txtLoanTypeName.Text = "";
            txtDuration.Text = "";
            txtChargePerDay.Text = "";
        }
    }
}