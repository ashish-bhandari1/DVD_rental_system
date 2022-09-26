using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary

{
    public partial class _6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void fillDate()
        {
            //MessageBox.Show("function called.");
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-C5QP6CF\SQLEXPRESS;Initial Catalog=applicationDevCW;Integrated Security=True;");
            con.Open();
            //MessageBox.Show(DropDownList2.SelectedValue);
            SqlCommand cmd1 = new SqlCommand("select DvdDetails.ageRestricted from DvdDetails inner join DvdCopies on DvdDetails.dvd_id = DvdCopies.dvd_id where DvdCopies.copy_id='" + DropDownList2.SelectedValue + "';", con);
            int age_res = (int)cmd1.ExecuteScalar();
            //MessageBox.Show(age_res.ToString());
            if (age_res == 1)
            {
                SqlCommand cmd = new SqlCommand("Select mem_firstname,mem_id from members where mem_age>18;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                //MessageBox.Show(dt.ToString());
                DropDownList3.DataTextField = "mem_firstname";
                DropDownList3.DataValueField = "mem_id";
                DropDownList3.DataSource = dt;
                DropDownList3.DataBind();
            }
            else if (age_res == 0)
            {
                SqlCommand cmd = new SqlCommand("Select mem_firstname,mem_id from members;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                //MessageBox.Show(dt.ToString());
                DropDownList3.DataTextField = "mem_firstname";
                DropDownList3.DataValueField = "mem_id";
                DropDownList3.DataSource = dt;
                DropDownList3.DataBind();
            }
        }

        protected void button_clear_Click(object sender, EventArgs e)
        {
            clear_fields();
        }
        public void clear_fields()
        {
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            DropDownList4.SelectedIndex = 0;
            var date_today = DateTime.Today;
            calender_loaddate.SelectedDate = date_today;
            txtbox_duration.Text = String.Empty;
        }

        protected void button_submit_Click(object sender, EventArgs e)
        {
            double duration = double.Parse(txtbox_duration.Text);
            var loandate = calender_loaddate.SelectedDate;
            var duedate = loandate.AddDays(duration);
            SqlDataSource4.InsertParameters.Add("due_date", TypeCode.DateTime, duedate.ToShortDateString());
            SqlDataSource4.Insert();
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-C5QP6CF\SQLEXPRESS;Initial Catalog=applicationDevCW;Integrated Security=True;");
            con.Open();
            SqlCommand cmd = new SqlCommand("update DvdCopies set isonloan = 1 where copy_id='" + DropDownList2.SelectedValue + "';", con);
            //update DvdCopies set isonloan = 1 where copy_id=1001
            cmd.ExecuteNonQuery();
            MessageBox.Show("Data inserted successfully.");
            DropDownList2.DataBind();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillDate();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillDate();
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtbox_duration.Text = DropDownList4.SelectedItem.Text;
        }
    }
}