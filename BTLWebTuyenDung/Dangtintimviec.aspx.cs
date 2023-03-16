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
    public partial class Dangtintimviec : System.Web.UI.Page
    {
        string strconn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["login"] == false)
            {
               Response.Redirect("Dangnhap.aspx");
            }
        }

        protected void btn_addTinTimViec_Click(object sender, EventArgs e)
        {
            int x = (int)Session["id"];
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_addTTV";
                    cmd.Parameters.AddWithValue("@idUser", (int)Session["id"]);
                    cmd.Parameters.AddWithValue("@title", txtTitle.Text);
                    //
                    String khoangLuong = txtMucluong.Text + "-" + txtMucluong1.Text;
                    cmd.Parameters.AddWithValue("@mucLuong", khoangLuong);
                    //
                    cmd.Parameters.AddWithValue("@viTri", txtvitri.Text);
                    cmd.Parameters.AddWithValue("@capDo", txtCapdo.Text);
                    cmd.Parameters.AddWithValue("@diaChi", txtDiachi.Text);
                    if (FileUpload1.FileName != "")
                    {
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("savedfile") + @"\" + FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@fileCV", "savedfile/" + FileUpload1.FileName);
                    }
                    else cmd.Parameters.AddWithValue("@fileCV", "img/blank.jpg");
                    cmd.Parameters.AddWithValue("@moTa", txtMota.InnerText);
                    cmd.Parameters.AddWithValue("@isApprove", 0);
                    cmd.Parameters.AddWithValue("@ngayDangTin", DateTime.Now);

                    conn.Open();
                    int exec = cmd.ExecuteNonQuery();
                    if(exec > 0)
                    {
                        Response.Redirect("Tintimviec.aspx");
                    }
                    conn.Close();
                    cmd.Dispose();
                }
            }
        }
    }
}