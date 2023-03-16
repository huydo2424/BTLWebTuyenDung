using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWebTuyenDung
{
    public partial class TrangAdmin : System.Web.UI.Page
    {
        public string lineData;
        string strconn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            check_role();
            lblTenDangNhap.Text = (string)Session["uname"];
            count();
            thongke();
        }
        private void check_role()
        {
            if((bool)Session["login"] == true )
            {
                if (Convert.ToInt32(Session["role"]) != 0)
                    Response.Redirect("Trangchu.aspx");
            }
            else
                Response.Redirect("Dangnhap.aspx");
        }

        private void count()
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "count_admin";
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    Label1.Text = dt.Rows[0]["cou"].ToString();
                    Label2.Text = dt.Rows[1]["cou"].ToString();
                    Label3.Text = dt.Rows[2]["cou"].ToString();
                    Label4.Text = (Convert.ToInt32(dt.Rows[3]["cou"].ToString()) + Convert.ToInt32(dt.Rows[4]["cou"].ToString())).ToString();
                }
            }
        }

        private void thongke()
        {
            DataTable dt1 = new DataTable();
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "thongke";
                    using (SqlDataAdapter daThongke = new SqlDataAdapter(cmd))
                    {
                        daThongke.Fill(dt1);
                        conn.Close();
                    }
                }
            }
            lineData = "[";
            foreach (DataRow dr in dt1.Rows)
            {
                lineData += "{name: '" + dr["sTen_User"] + "',y: " + dr["cou"] + "},";
            }
            lineData = lineData.Remove(lineData.Length - 1) + ']';
        }
    }
}