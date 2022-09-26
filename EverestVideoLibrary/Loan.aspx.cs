using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class Loan : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
                double duration = double.Parse(DropDownTypeID.SelectedItem.Text);
                var loandate = txtDateOut.SelectedDate;
                var duedate = loandate.AddDays(duration);
                SqlDataSource4.InsertParameters.Add("due_date", TypeCode.DateTime, duedate.ToShortDateString());
                SqlDataSource4.Insert();
                MessageBox.Show("Data inserted successfully.");
        }

        protected void ddldetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtbox_duration.Text = DropDownTypeID.SelectedItem.Text;
        }

    }
}