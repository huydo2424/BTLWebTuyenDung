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
    public partial class Userinfor : System.Web.UI.Page
    {
        string strconn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        string gt = "";
        int role = 0;
        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);

            baidang.HRef = "User_post.aspx?id=" + id + "&type=bd";
            user_infor.HRef = "Userinfor.aspx?id=" + id;
            ungtuyen.HRef= "User_post.aspx?id=" + id + "&type=ut";
            load_data(id, FormView1);
            load_data(id, FormView2);
            check_role(id);
            gioitinh();
        }

        protected void load_data(int id, FormView fv)
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "user_profile";
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    conn.Close();
                    fv.DataSource = dt;
                    fv.DataBind();
                }
            }

        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"]);
            div1.Visible = false;
            div2.Visible = false;
            load_data(id, FormView3);
            div3.Visible = true;
            if (gt == "True")
            {
                RadioButton r = FormView3.FindControl("male") as RadioButton;
                r.Checked = true;
            }
            else
            {
                RadioButton r = FormView3.FindControl("female") as RadioButton;
                r.Checked = true;
            }
            if (role == 2)
            {
                FormView3.FindControl("ns").Visible = true;
                FormView3.FindControl("gt").Visible = true;
                FormView3.FindControl("hv").Visible = true;
            }
        }

        private void gioitinh()
        {
            Label lblgioitinh = FormView1.FindControl("Lbl_gioitinh") as Label;
            if (lblgioitinh.Text == "True")
            {
                lblgioitinh.Text = "Nam";
            }
            else if (lblgioitinh.Text == "False")
            {
                lblgioitinh.Text = "Nữ";
            }
            lblgioitinh.Text = Convert.ToInt32(Application["OnlineUsers"]).ToString();
            //lblgioitinh.Text = Application["last"].ToString();
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
                    cmd.Parameters.Add("@id",id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    SqlDataReader dr;
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        role = Convert.ToInt32(dr["sRole"].ToString());
                        gt = dr["bGioitinh"].ToString();
                        conn.Close();
                    }
                }
            }

            if (role == 2)
            {
                FormView1.FindControl("role_1").Visible = true;
            }

            if (id != Convert.ToInt32(Session["id"]))
            {
                Label pass = FormView1.FindControl("lbl_password") as Label;
                pass.Text = "******";
                Button edit = FormView1.FindControl("btn_edit") as Button;
                edit.Visible = false;
                ut.Visible = false;
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            int gt = 0;
            string txtns = "";
            TextBox txtten = FormView3.FindControl("Textbox1") as TextBox;
            TextBox txtpass = FormView3.FindControl("Textbox2") as TextBox;
            TextBox txtngaysinh = FormView3.FindControl("Textbox3") as TextBox;
            TextBox txthocvan = FormView3.FindControl("Textbox4") as TextBox;
            TextBox txtdiachi = FormView3.FindControl("Textbox5") as TextBox;
            TextBox txtgioithieu = FormView3.FindControl("Textbox6") as TextBox;
            RadioButton r = FormView3.FindControl("male") as RadioButton;
            if (r.Checked)
            {
                gt = 1;
            }
            FileUpload FileUpload1 = FormView3.FindControl("FileUpload1") as FileUpload;
            Image img = FormView2.FindControl("Image1") as Image;
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "infor_change";
                    cmd.Parameters.AddWithValue("@id_user", Session["id"]);
                    cmd.Parameters.AddWithValue("@ten_user", txtten.Text);
                    cmd.Parameters.AddWithValue("@pass", txtpass.Text);
                    try{
                        string[] a = txtngaysinh.Text.Split('/');
                        txtns = a[1] + "/" + a[0] + "/" + a[2];
                    }
                    catch
                    {
                        
                    }
                    cmd.Parameters.AddWithValue("@ngaysinh", txtns);
                    cmd.Parameters.AddWithValue("@gioitinh", gt);
                    cmd.Parameters.AddWithValue("@diachi", txtdiachi.Text);
                    cmd.Parameters.AddWithValue("@hocvan", txthocvan.Text);
                    //cmd.Parameters.AddWithValue("@img", img.ImageUrl);
                    if (FileUpload1.FileName != "")
                    {
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("img") + @"\" + FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@img", "img/" + FileUpload1.FileName);
                    }
                    else cmd.Parameters.AddWithValue("@img", img.ImageUrl);
                    cmd.Parameters.AddWithValue("@gioithieu", txtgioithieu.Text);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "window.alert('Sửa đổi thông tin thành công');", true);
                    conn.Close();
                    cmd.Dispose();
                }
            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"Userinfor.aspx?id=" + Session["id"]);
        }
    }
}