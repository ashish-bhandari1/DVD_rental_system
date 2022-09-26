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
    public partial class _7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button_clear_Click(object sender, EventArgs e)
        {
            clearFields();

        }
        public void clearFields()
        {
            DropDownList1.SelectedIndex = 0;
            calender_returndate.SelectedDate = DateTime.Today;
        }

        protected void button_submit_Click(object sender, EventArgs e)
        {
            var return_date = calender_returndate.SelectedDate;
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-C5QP6CF\SQLEXPRESS;Initial Catalog=applicationDevCW;Integrated Security=True;");
            con.Open();
            SqlCommand cmd = new SqlCommand("Select due_date from loan where loan_id='" + DropDownList1.SelectedValue + "';", con);
            cmd.ExecuteNonQuery();
            DateTime due_date = (DateTime)cmd.ExecuteScalar();
            if (return_date > due_date)
            {
                int days_pass = (return_date - due_date).Days;
                MessageBox.Show("You are past due date.\nFine amount: " + days_pass * 50);
                addReturnDate();
            }
            else
            {
                addReturnDate();
            }

            DropDownList1.DataBind();
            GridView1.DataBind();
        }
        public void addReturnDate()
        {
            DateTime return_date = calender_returndate.SelectedDate;
            String sql_returndate = return_date.Date.ToString("yyyy-MM-dd");
            //MessageBox.Show(sql_returndate.ToString());
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-C5QP6CF\SQLEXPRESS;Initial Catalog=applicationDevCW;Integrated Security=True;");
            con.Open();
            SqlCommand cmd1 = new SqlCommand("update loan set return_date ='" + sql_returndate + "' where loan_id='" + DropDownList1.SelectedValue + "';", con);
            SqlCommand cmd2 = new SqlCommand("update DvdCopies set isonloan = 0 where copy_id='" + DropDownList1.SelectedValue + "';", con);
            //update Loan set return_date = '2020-02-02' where loan_id=12;
            cmd1.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            MessageBox.Show("Return date added.");
        }
    }
}