using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWebTuyenDung
{
    public partial class Core : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string html = "";
            if (!IsPostBack)
            {
                if ((bool)Session["login"] == true)
                {
                    btnOut.Visible = true;
                    txtUser.Visible = true;
                    login.Attributes.Add("style", "width: 240px; height: 130px");
                    txtUser.Text = "Xin chào, " + Session["uname"];
                    html += " <table class=\"table-login\">" +
                            "<tr>" +
                            "<td><i class=\"fa fa-user\" style=\"font-size: 15px; color: black;\" aria-hidden=\"true\"></i></td><td>";
                    if(Convert.ToInt32(Session["role"]) == 0)
                        html += "<a href =\"TrangAdmin.aspx\"><span>&nbsp Trang quản trị";
                    else
                    html += "<a href=\"Userinfor.aspx?id=" + Session["id"] + "\"><span> Xem trang cá nhân";
                    html += "</span></a></td>" +
                            "</tr>" +
                            "</table>";
                }
                else
                {
                    html += " <table class=\"table-login\">" +
                            "<tr>" +
                            "<td><i class=\"fa fa-sign-in\" style=\"font-size: 15px; color: black;\" aria-hidden=\"true\"></i></td>" +
                            "<td><a href =\"Dangnhap.aspx\"><span>&nbsp Đăng nhập</span></a></td>" +
                            "</tr>" +
                            "<tr>" +
                            "<td><i class=\"fa fa-user-plus\" style=\"font-size: 15px; color: black;\" aria-hidden=\"true\"></i></td>" +
                            "<td><a href =\"Dangky.aspx\"><span>&nbsp Đăng ký</span></a></td>" +
                            "</tr>" +
                            "</table>";
                }
                showlogin.InnerHtml = html;
            }

            if (Convert.ToInt32(Session["role"]) == 1)
            {
                menu_ut_item.Visible = true;
            }

        }

        protected void btnOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Dangnhap.aspx");
        }
    }
}