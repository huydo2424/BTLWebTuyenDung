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
    public partial class User_post : System.Web.UI.Page
    {
        string strconn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        int role = 3;

        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);
            string type = Request.QueryString["type"];

            baidang.HRef = "User_post.aspx?id=" + id +"&type=bd";
            user_infor.HRef = "Userinfor.aspx?id=" + id;
            ungtuyen.HRef = "User_post.aspx?id=" + id + "&type=ut";
            check_role(id);
            load_data(id, type);
            if (id != Convert.ToInt32(Session["id"]))
            {
                ut.Visible = false;
            }
        }

        private void load_data(int id, string type)
        {
            if (type == "bd")
                load_bd(id);
            else if (type == "ut")
                load_ut(id);
                
        }

        private void load_bd(int id)
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (role == 1) {
                        if (id != Convert.ToInt32(Session["id"]))
                            cmd.CommandText = "list_tintuyendung";
                        else cmd.CommandText = "list_tintuyendung_1";
                    }
                    else
                    {
                        if (id != Convert.ToInt32(Session["id"]))
                            cmd.CommandText = "list_tintimviec";
                        else cmd.CommandText = "list_tintimviec_1";
                    }
                        
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    conn.Close();
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            }

            if (id == Convert.ToInt32(Session["id"]))
                show_approve();
        }

        private void load_ut(int id)
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (role == 1)
                        cmd.CommandText = "list_ut_tintimviec";
                    else
                        cmd.CommandText = "list_ut_tintuyendung";
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    conn.Close();
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            }
        }

        [Obsolete]
        private void check_role(int id)
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "check_role";
                    cmd.Parameters.Add("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    SqlDataReader dr;
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        role = Convert.ToInt32(dr["sRole"].ToString());
                        conn.Close();
                    }
                }
            }
        }

        private void show_approve()
        {
            foreach (RepeaterItem item in Repeater1.Items)
            {
                Label isAprove = item.FindControl("lbl_approve") as Label;

                if (isAprove.Text == "False")
                {
                    item.FindControl("khung").Visible = true;
                    isAprove.Text = "Not Approved";
                }
            }
        }
    }
}