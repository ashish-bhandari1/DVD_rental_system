using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class DVD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
                String b = txtDVDTitle.Text;

                if (b != "")
                {
                    SqlDataSource1.Insert();
                    clear();
                }
                else
                {
                    MessageBox.Show("Required Fields Missing", "Alert !!");
                }
        }

        protected void btnAddStudio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Studio.aspx");
        }

        protected void btnAddProducer_Click(object sender, EventArgs e)
        {
            Response.Redirect("Producer.aspx");
        }

        private void clear()
        {
            txtDVDTitle.Text = "";
        }

    }
}