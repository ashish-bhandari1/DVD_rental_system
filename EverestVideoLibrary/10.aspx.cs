using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class _10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-C5QP6CF\SQLEXPRESS;Initial Catalog=applicationDevCW;Integrated Security=True;");
            con.Open();
            SqlCommand cmd1 = new SqlCommand("Delete from DvdDetails where dvd_id ='" + DropDownList1.SelectedValue + "';", con);
            //update Loan set return_date = '2020-02-02' where loan_id=12;
            cmd1.ExecuteNonQuery();
            MessageBox.Show("Record deleted successfully.");
        }
    }
}