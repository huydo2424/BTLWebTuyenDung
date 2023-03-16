<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="User_post.aspx.cs" Inherits="BTLWebTuyenDung.User_post" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page">
        <div class="page-sidebar-inner">
            <ul class="accordion-menu">
                <li class="active-page">
                    <a href="Userinfor.aspx" class="item" id="user_infor" runat="server">
                        <i class="fa-solid fa-address-card"></i><span>&nbsp Trang cá nhân</span>
                    </a>
                </li>
                <li class="active-page">
                    <a href="" class="item" runat="server" id="baidang">
                        <i class="fa-brands fa-wordpress"></i><span>&nbsp Bài đăng</span>
                    </a>
                </li>
                <li class="active-page" id="ut" runat="server">
                    <a href="" class="item" runat="server" id="ungtuyen">
                        <i class="fa-solid fa-briefcase"></i><span>&nbsp Công việc đã ứng tuyển</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="user-infor">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="job-ta">
                        <div class="feature-job-item job-bd">
                            <div class="cvo-flex">
                                <div class="box-company-logo">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("sImg") %>' CssClass="logo-user"/>
                                 </div>

                                <div class="cvo-flex-grow">
                                    <div class="u-title">
                                        <asp:Label ID="Lbl_title" runat="server" Text='<%# Eval("sTitle") %>'></asp:Label>
                                        
                                        <div class="time">
                                            <i class="fa-solid fa-clock-rotate-left green-box-icon"></i>
                                            <asp:Label ID="Lbl_ngaydang" runat="server" Text='<%# Eval("dNgaydangtin", "{0:d/M/yyyy}") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <a class="u-name" href="Userinfor.aspx?id=<%# Eval("sID_User") %>">
                                        <asp:Label ID="Lbl_nguoidang" runat="server" Text='<%# Eval("sTen_User") %>'></asp:Label>
                                    </a>

                                    <div class="u-add">
                                        <div>
                                            <i class="fa-solid fa-briefcase"></i>
                                            <asp:Label ID="lvl_vitri" runat="server" Text='<%# Eval("sVitri") %>'></asp:Label>
                                        </div>
                                        <div>
                                            <i class="fa-solid fa-dollar-sign"></i>
                                            <asp:Label ID="lbl_luong" runat="server" Text='<%# Eval("sMucluong") %>'></asp:Label>
                                        </div>
                                        <div>
                                            <i class="fa-solid fa-map-location-dot"></i>
                                            <asp:Label ID="lbl_diachi" runat="server" Text='<%# Eval("sDiachi") %>'></asp:Label>
                                        </div>
                                    </div>
                                    <div class="des u-add">
                                        <asp:Label ID="Lbl_mota" runat="server" Text='<%# Eval("sMota") %>'></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="chuaduyet" id="khung" runat="server" visible="false">
                                <asp:Label ID="lbl_approve" runat="server" Text='<%# Eval("bIsApprove") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
