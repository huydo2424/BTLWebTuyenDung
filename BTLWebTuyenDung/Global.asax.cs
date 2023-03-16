using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BTLWebTuyenDung
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["login"] = false;
            Session["role"] = "3";    /*0: admin; 1: Nhà tuyển dụng; 2: Người tìm việc*/
            Session["uname"] = "";     /*Ten dang nhap*/
            Session["id"] = "0";         /*ID user*/

            Session["pass"] = "";
            Session["admindangduyet"] = "TTD";
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}