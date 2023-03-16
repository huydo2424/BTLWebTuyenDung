using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWebTuyenDung
{
    public partial class Duyetbai : System.Web.UI.Page
    {
        string strconn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            check_role();
            load();
            if (Request["act"] == "xoa")
            {
                if (Request["id"] != null)
                {
                    Response.Clear();
                        xoatin(Convert.ToInt32(Request.QueryString["id"]), Request["type"]);
                    Response.Flush();
                    Response.End();
                }
            }
            else if (Request["act"] == "duyet")
            {
                if (Request["id"] != null)
                {
                    Response.Clear();
                    duyettin(Convert.ToInt32(Request.QueryString["id"]), Request["type"]);
                    Response.Flush();
                    Response.End();
                }
            }
        }

        private void check_role()
        {
            if ((bool)Session["login"] == true)
            {
                if (Convert.ToInt32(Session["role"]) != 0)
                    Response.Redirect("Trangchu.aspx");
            }
            else
                Response.Redirect("Dangnhap.aspx");
        }

        private void load()
        {
            load_td();
            load_tv();
        }

        private void load_td()
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "tin_td_chua_duyet";
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

        private void load_tv()
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "tin_tv_chua_duyet";
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    conn.Close();
                    Repeater2.DataSource = dt;
                    Repeater2.DataBind();
                }
            }
        }

        private void xoatin(int id, string type)
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    if(type == "TD")
                    {
                        cmd.CommandText = "xoatin_TD";
                    }
                    else
                    {
                        cmd.CommandText = "xoatin_TV";
                    }
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }

        private void duyettin(int id, string type)
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (type == "TD")
                    {
                        cmd.CommandText = "duyettin_TD";
                    }
                    else
                    {
                        cmd.CommandText = "duyettin_TV";
                    }
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }

        //the
        [WebMethod]
        public static String xuLyTinTimViecAdmin(String act, int id)
        {
            String kq = "10";
            String procName = "";
            if(String.Compare(act, "duyet") == 0)
            {
                procName = "sp_approveTTV";
            }
            else
            {
                procName = "sp_denyTTV";
            }
            using (SqlConnection conn = new SqlConnection(Dangnhap.strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = procName;
                    cmd.Parameters.AddWithValue("@idTTV", id);
                    conn.Open();
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        if (act == "duyet")
                        {
                            kq = "Đã duyệt bài viết !!";
                        }
                        else
                        {
                            kq = "Đã xóa bài viết !?";
                        }                      
                    }
                    else
                    {
                        kq = "Đã có lỗi ??";
                    }
                }
            }

            return kq;
        }

        [WebMethod]
        public static String xuLyTinTuyenDungAdmin(String act, int id)
        {
            String kq = "20";
            String procName = "";
            if (String.Compare(act, "duyet") == 0)
            {
                procName = "sp_approveTTD";
            }
            else
            {
                procName = "sp_denyTTD";
            }
            using (SqlConnection conn = new SqlConnection(Dangnhap.strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = procName;
                    cmd.Parameters.AddWithValue("@idTTD", id);
                    conn.Open();
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        if (act == "duyet")
                        {
                            kq = "Đã duyệt bài tuyển dụng !!";
                        }
                        else
                        {
                            kq = "Đã xóa bài tuyển dụng !?";
                        }
                    }
                    else
                    {
                        kq = "Đã có lỗi xảy ra ??";
                    }
                }
            }

            return kq;
        }

        //cau3
        [WebMethod]
        public static String huyDuyetTinTimViecAdmin(String act, int id)
        {
            String kq = "20";
            String procName = "";
            if (String.Compare(act, "huyduyet") == 0)
            {
                procName = "sp_unApproveTTV";
            }
            else
            {
                procName = "sp_approveTTV1";
            }
            using (SqlConnection conn = new SqlConnection(Dangnhap.strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = procName;
                    cmd.Parameters.AddWithValue("@idTTV", id);
                    cmd.Parameters.AddWithValue("@idUser", (int)HttpContext.Current.Session["id"]);
                    cmd.Parameters.AddWithValue("@tg", System.DateTime.Now);
                    conn.Open();
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        if (act == "duyet")
                        {
                            kq = "Đã duyệt bài tuyển dụng !!";
                        }
                        else
                        {
                            kq = "Đã hủy duyệt bài tuyển dụng !?";
                        }
                    }
                    else
                    {
                        kq = "Đã có lỗi xảy ra ??";
                    }
                }
            }

            return kq;
        }
    }
}