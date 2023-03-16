<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="detail_Tintuyendung.aspx.cs" Inherits="BTLWebTuyenDung.detail_Tintuyendung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="tuyenDung_search">
        <div class="grid wide">
            <div class="tuyenDung_list row">
                <div class="tuyenDung_item col c-9 l-9">
                    <asp:TextBox ID="txtSearchTag" runat="server" CssClass="item-name item" placeholder="Nhập tên công việc"></asp:TextBox>
                </div>
              
                <div class="tuyenDung_item col c-3 l-3">
                    <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" CssClass="item-search item" AutoPostBack="True" OnClick="btnSearch_Click" />
                </div>
            </div>
        </div>
    </div>--%>

    <div class=" grid wide" style="background: #fff; border-radius: 2px;">
        <div class="detail_header row">
            <div class="detail_header-content col c-12 m-12 l-12">
                <div class="detail_header-list row">
                    <div class="detail_header-item col c-2 m-2 l-2">
                        <img class="item-img" runat="server" id="img" src="" alt="ảnh" />
                    </div>
                    <div class="detail_header-item col c-7 m-7 l-7">
                        <h1>
                            <asp:Label ID="lbTitle" runat="server" Text="Tiêu đề"></asp:Label>

                        </h1>
                        <p>
                            <asp:Label ID="lbNameCTY" runat="server" Text="Tên Công Ty"></asp:Label>
                        </p>
                    </div>
                    <div class="detail_header-item header-btn  col c-12 m-3 l-3 " id="btn_ungtuyen" runat="server"> 
                        <asp:Repeater ID="rptUngtuyen" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink CssClass="detail_header-Ungtuyen" ID="linkUngtuyen" runat="server"
                                        NavigateUrl='<%# String.Format("UngTuyen.aspx?id_TD={0}", 
                                        HttpUtility.UrlEncode(Eval("sID_tintuyendung").ToString())) %>'>
                                    <p class="btnUngTuyen">Ứng tuyển ngay</p>  
                                    </asp:HyperLink>  
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="grid wide">
        <div class="detail_title row">
            <div class="detail_title-item col c-2 m-4 l-2"> 
                <a href="#TinTuyenDung_detail">Tin Tuyển dụng</a>
            </div>
            <div class="detail_title-item col c-2 m-4 l-2">
                <a href="#TinTuyenDung_CTY">Thông tin công ty</a>
            </div>
            <div class="detail_title-item col c-2 m-4 l-2">
                <a href="#TinTuyenDung_job">Việc làm liên quan</a>
            </div>
        </div>
    </div>


    <div class="grid wide" id="TinTuyenDung_detail">
        <div class="detail_container">
            <div class="detail row">
                <div class="title_detail col c-12 m-12 l-12">
                    <div></div>
                    <h2>Chi tiết tin tuyển dụng</h2>
                </div>
            </div>
            <div class="row" style="padding-bottom: 20px">
                <div class="col c-12 m-12 l-7">
                    <div class="detail_info-list">
                        <p class="detail_info-title">Thông tin chung</p>
                        <div class="detail_info-item">
                            <div>
                                <img src="https://www.topcv.vn/v4/image/job-detail/icon/1.svg" />
                            </div>
                            <div class="info-item-description">
                                <p>Mức lương</p>
                                <p>
                                    <asp:Label ID="lbLuong" runat="server" Text="Lương"></asp:Label>
                                </p>
                            </div>
                        </div>
                        <div class="detail_info-item">
                            <div>
                                <img src="https://www.topcv.vn/v4/image/job-detail/icon/1.svg" />
                            </div>
                            <div class="info-item-description">
                                <p>Vị trí làm việc</p>
                                <p>
                                    <asp:Label ID="lbVitri" runat="server" Text="Lương"></asp:Label>
                                </p>
                            </div>
                        </div>
                        <div class="detail_info-item">
                            <div>
                                <img src="https://www.topcv.vn/v4/image/job-detail/icon/1.svg" />
                            </div>
                            <div class="info-item-description">
                                <p>Địa chỉ làm việc</p>
                                <p>
                                    <asp:Label ID="lbDiachi" runat="server" Text="Lương"></asp:Label>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="moTa">
                        <h3>Mô tả công việc</h3>
                        <asp:Label ID="lbMota" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="yeuCau">
                        <h3>Yêu cầu công việc </h3>
                        <asp:Label ID="lbYeucau" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="CachThucUngTuyen">
                        <h3>Cách thức ứng tuyển </h3>
                        <p class="btnUngTuyen a">Ứng tuyển ngay</p>  
                    </div>
                </div>

                <div class="col c-12 m-12 l-4">
                    <div class="detail_right-nganhnghe">
                        <h3>Ngành nghề</h3>
                        <asp:Repeater ID="rptNganhNghe" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink CssClass="detail_right-link" ID="linkNganhnghe" runat="server"
                                        NavigateUrl='<%# String.Format("TinTuyenDung.aspx?id_tag={0}", 
                                        HttpUtility.UrlEncode(Eval("sID_Tag").ToString())) %>'>
                                        <p class="nganh_nghe"><%# Eval("sNametag") %></p>
                                    </asp:HyperLink>  
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <div class="detail_right-Khuvuc">
                        <h3>Khu Vực</h3>
                        <asp:Repeater ID="rptKhuvuc" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink CssClass="detail_right-link" ID="linkKhuvuc" runat="server"
                                        NavigateUrl='<%# String.Format("TinTuyenDung.aspx?Diachi_TD={0}", 
                                        HttpUtility.UrlEncode(Eval("sDiachi").ToString())) %>'>
                                        <p class="nganh_nghe"><%# Eval("sDiachi") %></p>
                                    </asp:HyperLink>  
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="grid wide" id="TinTuyenDung_CTY">
        <div class="detail_container">
            <div class="detail row">
                <div class="title_detail col c-12 l-12">
                    <div></div>
                    <h2>Thông tin
                        <asp:Label ID="lbCty" runat="server" Text="Label"></asp:Label>
                    </h2>
                </div>
            </div>
            <div class="row">
                <div class="col c-12 l-12">
                    <div class ="detail_cty">
                        <div>
                            <img src="https://www.topcv.vn/v4/image/job-detail/icon/1.svg" />
                        </div>
                        <div>
                            <h3>Giới thiệu</h3>
                            <asp:Label ID="lbGioiThieu" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                    <div class ="detail_cty">
                        <div>
                            <img src="https://www.topcv.vn/v4/image/job-detail/icon/1.svg" />
                        </div>
                        <div >
                            <h3>Địa điểm</h3>
                            <asp:Label ID="lbDC_CTY" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="grid wide" id="TinTuyenDung_job">
        <div class="detail_container">
            
        </div>
    </div>
    <div class="Recruitment grid wide">
        <div class="Recruitment_list row">
            <asp:Repeater ID="rptNameTag" runat="server">
                <ItemTemplate>
                    <div class="Recruitment_item col c-12 l-12">
                        <div class="Recruitment_item-container row">
                            <div class="Recruitment_item-img  col c-2 l-2">
                                <image src='<%# Eval("sImg") %>' alt="ảnh" />
                            </div>
                            <div class="Recruitment_item-content col c-9 l-9">
                                <asp:HyperLink ID="linkToDetail" runat="server"
                                    NavigateUrl='<%# String.Format("detail_Tintuyendung.aspx?id={0}", 
                                        HttpUtility.UrlEncode(Eval("sID_tintuyendung").ToString()) ) %>'>
                                        <h2><%# Eval("sTitle") %></h2>
                                </asp:HyperLink>

                                <p class="name_cty"><a href="Userinfor.aspx?id=<%# Eval("sID_User") %>"><%# Eval("sTen_User") %></a></p>
                                <div>
                                    <p>Mức lương: <%# Eval("sMucluong") %></p>
                                    <p><%# Eval("Diachi") %></p>
                                    <p>Ngày đăng tin <%# Eval("dNgaydangtin") %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
