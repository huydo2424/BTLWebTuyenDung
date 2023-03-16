using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWebTuyenDung
{
    public partial class TinTuyenDung : System.Web.UI.Page
    {
        private Utility utility = new Utility();
        private int id_Tag;
        private int id_tag_results;
        string DiachiTD = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id_tag_TD = Request.QueryString["id_tag"];
                DiachiTD = Request.QueryString["Diachi_TD"];
                loadALLTinTuyenDung();
                if (id_tag_TD == null && DiachiTD == null)
                {
                    loadALLTinTuyenDung();
                }
                else if (DiachiTD == null)
                {
                    id_tag_results = int.Parse(id_tag_TD);
                    rptNameTag.DataSource = utility.getByIdTag(id_tag_results);
                    rptNameTag.DataBind();
                }
                else
                {
                    rptNameTag.DataSource = utility.getSearchDC_TD(DiachiTD);
                    rptNameTag.DataBind();
                }
                //loadNameTag();

            }
        }
        //private void loadNameTag()
        //{
        //    DropDownListNameTag.DataSource = utility.get_Tag();
        //    DropDownListNameTag.DataTextField = "sNametag";
        //    DropDownListNameTag.DataValueField = "sID_Tag";
        //    DropDownListNameTag.DataBind();
        //}
        //protected void DropDownListNameTag_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    id_Tag = int.Parse(DropDownListNameTag.Items[DropDownListNameTag.SelectedIndex].Value);
        //}

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //DropDownListNameTag_SelectedIndexChanged(sender, e);
            //if(id_Tag == "All_Tag")
            //{
            //    loadALLTinTuyenDung();
            //}
            //else
            //{
            string name_tag = txtSearchTag.Text;
            rptNameTag.DataSource = utility.search_NameTag(name_tag);
            rptNameTag.DataBind();
            //}
        }
        private void loadALLTinTuyenDung()
        {
            rptNameTag.DataSource = utility.getALLTD_pageTTD();
            rptNameTag.DataBind();
        }


    }
}