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
    public partial class _8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int columnscount = GridView1.Rows.Count;
            for (int j = 0; j < columnscount; j++)
            {
                String mem_id = GridView1.Rows[j].Cells[0].Text;
                String mem_fname = GridView1.Rows[j].Cells[1].Text;
                String total_loan_temp = GridView1.Rows[j].Cells[6].Text;
                int total_loan = Int32.Parse(total_loan_temp);
                //MessageBox.Show(mem_id);
                //MessageBox.Show(total_loan.ToString());
                SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-U74Q0SE\SQLEXPRESS;Initial Catalog=kamalDB;Integrated Security=True");
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select MemberCategory.totalLoan from MemberCategory inner join Members on MemberCategory.mem_category_id = Members.mem_category_id where members.mem_id = '" + mem_id + "';", con);
                int total_loan_limit = (int)cmd1.ExecuteScalar();
                //MessageBox.Show(total_loan_limit.ToString());
                if (total_loan_limit < total_loan)
                {
                    MessageBox.Show("No of DVDs on loan.\n" + mem_fname + ": " + total_loan_temp, "Max Limit Reached");
                }
            }
        }

        protected void DropDownListMem_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txtBoxTotal.Text = DropDownListMem.SelectedItem.Text;
        }
    }
}