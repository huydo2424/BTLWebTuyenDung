using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLWebTuyenDung
{
    public partial class detail_Tintuyendung : System.Web.UI.Page
    {
        private Utility utility = new Utility();
        private DataTable tbl;
        int id_Tag;
        private int id_TD;
        private string Mota = "";
        private string Yeucau = "";
        private string[] arrMota;
        private string[] arrYeucau;
        private string listMota = "";
        private string listYeucau = "";
        string vitri = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //loadNameTag();
                id_TD = int.Parse(Request.QueryString["id"]);
                tbl = utility.getByID_TD(id_TD);
                rptUngtuyen.DataSource = tbl;
                rptUngtuyen.DataBind();
                if (tbl.Rows.Count > 0)
                {
                    loadDataDetailTD();
                }

                LoadNganhnghe();
                LoadKhuVuc();
                //loadALLTinTuyenDung();

                if (Convert.ToInt32(Session["role"]) == 1 || Convert.ToInt32(Session["role"]) == 0 )
                {
                    btn_ungtuyen.Visible = false;
                }

            }
        }
        private void loadDataDetailTD()
        {
            img.Src = tbl.Rows[0][2].ToString();
            lbTitle.Text = tbl.Rows[0][4].ToString();
            lbNameCTY.Text = tbl.Rows[0][0].ToString();
            lbLuong.Text = tbl.Rows[0][10].ToString();
            lbVitri.Text = tbl.Rows[0][9].ToString();
            vitri = tbl.Rows[0][8].ToString();
            lbDiachi.Text = tbl.Rows[0][7].ToString();
            Mota = tbl.Rows[0][5].ToString();
            Yeucau = tbl.Rows[0][8].ToString();

            lbCty.Text = tbl.Rows[0][0].ToString();
            lbGioiThieu.Text = tbl.Rows[0][3].ToString();
            lbDC_CTY.Text = tbl.Rows[0][1].ToString();


            arrMota = Mota.Split('.');
            arrYeucau = Yeucau.Split('.');

            for (int i = 0; i < arrMota.Length; i++)
            {
                listMota += "<li class='" + "moTa-item" + "'>" + arrMota[i] + "</li>";
            }
            for (int i = 0; i < arrYeucau.Length; i++)
            {
                listYeucau += "<li class='" + "yeuCau-item" + "'>" + arrYeucau[i] + "</li>";
            }

            lbMota.Text = listMota;
            lbYeucau.Text = listYeucau;


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

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    //DropDownListNameTag_SelectedIndexChanged(sender, e);
        //    //if (id_Tag == "All_Tag")
        //    //{
        //    //loadALLTinTuyenDung();
        //    //}
        //    //else
        //    //{
        //    string name_tag = txtSearchTag.Text;
        //    rptNameTag.DataSource = utility.search_NameTag(name_tag);
        //    rptNameTag.DataBind();
            
        //    //}
        //}
        private void loadALLTinTuyenDung()
        {
            rptNameTag.DataSource = utility.getALLTD_pageTTD();
            rptNameTag.DataBind();
        }
        private void LoadNganhnghe()
        {
            rptNganhNghe.DataSource = utility.get_Tag();
            rptNganhNghe.DataBind();
        }
        private void LoadKhuVuc()
        {
            rptKhuvuc.DataSource = utility.getDC_TD();
            rptKhuvuc.DataBind();

        }

    }
}