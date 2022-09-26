using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EverestVideoLibrary
{
    public partial class _2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-U74Q0SE\SQLEXPRESS;Initial Catalog=applicationDevCW;Integrated Security=True");
            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.Connection = con;
            sqlCmd.CommandType = CommandType.Text;
            sqlCmd.CommandText = "SELECT Cast.last_name as [Last Name], DvdDetails.dvd_id as [Dvd ID], DvdDetails.title as [Title], '' AS [No of Copies] FROM Cast INNER JOIN DvdDetails ON Cast.dvd_id = DvdDetails.dvd_id where last_name = '" + DropDownList1.SelectedValue + "'";
            SqlDataAdapter sqlDataAdap = new SqlDataAdapter(sqlCmd);
            DataTable dtRecord = new DataTable();
            sqlDataAdap.Fill(dtRecord);
            GridView1.DataSource = dtRecord.DefaultView;
            GridView1.DataBind();
            int columnscount = GridView1.Rows.Count;
            for (int j = 0; j < columnscount; j++)
            {
                String dvd_id = GridView1.Rows[j].Cells[1].Text;
                //MessageBox.Show(dvd_id);
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select count(dvd_id) from DvdCopies where dvd_id = '" + dvd_id + "';", con);
                int total_noifdvd = (int)cmd1.ExecuteScalar();
                //MessageBox.Show(total_noifdvd.ToString());
                GridView1.Rows[j].Cells[3].Text = total_noifdvd.ToString();
            }
        }
    }
}