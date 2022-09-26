using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class dvdCopy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String b = txtCopyName.Text;
            String c = txtShelf.Text;

            if (b != "" && c != "")
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
            txtCopyName.Text = "";
            txtShelf.Text = "";
        }
    }
}