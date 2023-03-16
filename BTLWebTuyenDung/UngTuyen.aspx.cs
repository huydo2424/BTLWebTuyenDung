using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWebTuyenDung
{
    public partial class UngTuyen : System.Web.UI.Page
    {
        private Utility utility = new Utility();
        private DataTable tbl;
        private int id_TD;
        private bool isLogin = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = (string)Session["uname"];
                isLogin = username != null && username != "" ? true : false;
                if (!isLogin)
                {
                    Response.Redirect("Dangnhap.aspx");
                }
                if (isLogin)
                {
                    string role = utility.getByIdUser_role(username);
                    if (role == "1")
                    {
                        Response.Redirect("Trangchu.aspx");
                    }
                }
                id_TD = int.Parse(Request.QueryString["id_TD"]);
                tbl = utility.getByID_TD(id_TD);
                lbvitri.Text = tbl.Rows[0][3].ToString();
                rptTinUngTuyen.DataSource = tbl;
                rptTinUngTuyen.DataBind();
            }
            
        }
        private string addCV()
        {
            string fileName = fileCV.FileName;
            string fileExtension = Path.GetExtension(fileName);
            fileExtension = fileExtension.ToLower();
            string imgPath = "~/Data/" + fileName;
            fileCV.SaveAs(Server.MapPath(imgPath));
            return imgPath;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string username = (string)Session["uname"];
            int id_user = utility.getUser_NameUser_idUser(username);
            int id_TD1 = int.Parse(Request.QueryString["id_TD"]);
            string name = txtName.Text;
            string email = txtEmail.Text;
            string phonenumber = txtPhone.Text;
            string Mota = "họ và tên : " + name + ". Email: " + email + ". Số điện thoai: " + phonenumber + ". Mô tả: " + txtDescription.Value;
            string FileCV = addCV();
            utility.addUngTuyen(id_user, id_TD1, Mota, FileCV);
            Response.Redirect("TinTuyenDung.aspx");

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("TinTuyenDung.aspx");
        }
    }
}