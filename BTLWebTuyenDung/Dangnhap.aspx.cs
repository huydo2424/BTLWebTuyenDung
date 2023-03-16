using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWebTuyenDung
{
    public partial class Dangnhap : System.Web.UI.Page
    {
        public static int xa = 3;
        public static string strconn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["act"] == "dx")
                {
                    Session.Abandon();
                }
            }

        }

        protected void btndangnhap_Click(object sender, EventArgs e)
        {
            string username = txtTaikhoan.Text.Trim();
            string password = txtMatkhau.Text.Trim();
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "dangnhap";
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@pass", password);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    SqlDataReader dr;
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Session["login"] = true;
                        Session["uname"] = username;
                        Session["role"] = Convert.ToInt32(dr["sRole"].ToString());
                        Session["id"] = Convert.ToInt32(dr["sID_User"].ToString());
                        conn.Close();
                        if (Convert.ToInt32(Session["role"]) == 0)
                        {
                            Response.Redirect("TrangAdmin.aspx");
                        }
                        else
                        {
                            Response.Redirect("Trangchu.aspx");
                        }
                    }
                    else
                    {
                        lblThongbao.Text = "Nhập sai tài khoản hoặc mật khẩu";
                    }
                }
            }
        }

        public String test1 (String tentuoi, String matma)
        {
            return "ggg";
        }

        [WebMethod]
        public static String loginTest(String tk, String mk)
        {
            String kq = "1";
            using (SqlConnection conn = new SqlConnection(Dangnhap.strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "dangnhap";
                    cmd.Parameters.AddWithValue("@username", tk);
                    cmd.Parameters.AddWithValue("@pass", mk);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    SqlDataReader dr;
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        HttpContext.Current.Session["login"] = true;
                        HttpContext.Current.Session["uname"] = tk;
                        HttpContext.Current.Session["role"] = Convert.ToInt32(dr["sRole"].ToString());
                        HttpContext.Current.Session["id"] = Convert.ToInt32(dr["sID_User"].ToString());
                        conn.Close();
                        if (Convert.ToInt32(HttpContext.Current.Session["role"]) == 0)
                        {
                            //HttpContext.Current.Response.Redirect("TrangAdmin.aspx");
                            kq = "TrangAdmin.aspx";
                        }
                        else
                        {
                            //HttpContext.Current.Response.Redirect("Trangchu.aspx");
                            kq = "Trangchu.aspx";
                        }
                    }
                    else
                    {
                        //Page page = (Page)HttpContext.Current.Handler;
                        //Label l1 = (Label)page.FindControl("lblThongbao");
                        //l1.Text = "Nhập sai tài khoản hoặc mật khẩu";
                        kq = "1";
                    }
                }
            }

            return kq;
        }

        [WebMethod]
        public static String abandonCurrentSession()
        {
            String kq = "abandon";
            HttpContext.Current.Session.Abandon();

            return kq;
        }
    }
}