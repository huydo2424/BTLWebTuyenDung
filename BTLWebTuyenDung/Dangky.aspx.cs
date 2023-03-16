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
    public partial class Dangky : System.Web.UI.Page
    {
        string strconn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        string gt = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        /*check role*/ 
        protected void check(object sender, EventArgs e)
        {
            if (R2.Checked)
            {
                View2.FindControl("ngaysinh").Visible = false;
                View2.FindControl("gioitinh").Visible = false;
                View2.FindControl("hocvan").Visible = false;
            }
        }

        protected void btnnext1_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                check(sender, e);
                Session["pass"] = txtMatKhau.Text;
                MultiView1.ActiveViewIndex = 1;
            }
        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    int role = 2;
                    if (male.Checked)
                    {
                        gt = "1";
                    }
                    if (R2.Checked)
                    {
                        role = 1;
                        gt = "";
                    }
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "dangky";
                    cmd.Parameters.AddWithValue("@ten_user", txtHoTen.Text);
                    cmd.Parameters.AddWithValue("@tendangnhap", txtTenTaiKhoan.Text);
                    cmd.Parameters.AddWithValue("@pass", Session["pass"]);
                    cmd.Parameters.AddWithValue("@ngaysinh", TxtNgaysinh.Text);
                    cmd.Parameters.AddWithValue("@gioitinh", gt);
                    cmd.Parameters.AddWithValue("@diachi", TxtDiachi.Text);
                    cmd.Parameters.AddWithValue("@hocvan", TxtHocvan.Text);
                    if (FileUpload1.FileName != "")
                    {
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("img") + @"\" + FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@img", "img/" + FileUpload1.FileName);
                    }
                    else cmd.Parameters.AddWithValue("@img", "img/blank.jpg");
                    cmd.Parameters.AddWithValue("@gioithieu", TxtGioithieu.Text);
                    cmd.Parameters.AddWithValue("@role", role);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblThongBao.Text = "Đăng ký thành công";
                    conn.Close();
                    cmd.Dispose();
                }
            }
        }

        /*check tai khoan da ton tai*/
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.CommandText = "check_user_dangky";
                    cmd.Parameters.AddWithValue("@username", txtTenTaiKhoan.Text);
                    conn.Open();
                    SqlDataReader dr;
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        args.IsValid = false;
                    }
                    else
                    {
                        args.IsValid = true;
                    }
                    conn.Close();
                }
            }
        }
    }
}