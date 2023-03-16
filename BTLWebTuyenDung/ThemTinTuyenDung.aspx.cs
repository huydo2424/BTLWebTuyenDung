using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWebTuyenDung
{
    public partial class ThemTinTuyenDung : System.Web.UI.Page
    {
        Utility utility = new Utility();
        private bool isLogin = false;
        private DataTable tbl;
        private string username = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                username = (string)Session["uname"];
                isLogin = username != null && username != "" ? true : false;
                if (!isLogin)
                {
                    Response.Redirect("Dangnhap.aspx");
                }
                if (isLogin)
                {
                    string role = utility.getByIdUser_role(username);
                    if (role == "2")
                    {
                        Response.Redirect("Trangchu.aspx");
                    }
                }
                tbl = utility.getdUser_username(username);
                lbTenCTY.Text = tbl.Rows[0][1].ToString();

            }
            btn_back.CausesValidation = false;
        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
            username = (string)Session["uname"];
            int id_user = utility.getUser_NameUser_idUser(username);
            string title = txttitle.Text;
            string Mota = txtMota.Value;
            string yeucau = txtYeucau.Value;
            string vitri = txtvitri.Text;
            string mucluong = txtMucluong.Text;
            string diachi = txtDiachi.Text;
            string Tagname = txtTagName.Text;
            int id_TD = utility.addTinTuyenDung(title, id_user, Mota, yeucau, vitri, mucluong, diachi);
            int id_tag = utility.addTag(Tagname);
            bool check = utility.addTag_Tin(id_TD, id_tag);
            if (check)
            {
                txttitle.Text = "";
                txtMota.Value = "";
                txtYeucau.Value = "";
                txtvitri.Text = "";
                txtMucluong.Text = "";
                txtDiachi.Text = "";
                txtTagName.Text = "";
            }
        }


        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("TinTuyenDung.aspx");
        }
    }
}