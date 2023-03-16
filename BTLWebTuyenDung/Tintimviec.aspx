<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="Tintimviec.aspx.cs" Inherits="BTLWebTuyenDung.Tintimviec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <div class="main-content">
        <section class="box_general">
            <div class="box-header">
                <h2 class="box-title">
                    <i class="fa-solid fa-star green-box-icon"></i>TIN TÌM VIỆC, BÀI ĐĂNG MỚI NHẤT
                </h2>
                <span class="pull-right">
                    <a href="" target="_blank">
                        <i class="fa-solid fa-angles-right"></i>Xem tất cả
                    </a></span>
            </div>

            <div class="slick-list">
                <div class="row">
                    <asp:ListView ID="ListView2" runat="server">
                        <ItemTemplate>
                            <div data-job-id="690946" class="col-md-4 col-sm-6 job-ta">
                                <div class="feature-job-item">
                                    <div class="cvo-flex">
                                        <div class="box-company-logo">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("sImg") %>' CssClass="logo-user" />
                                        </div>
                                        <div class="cvo-flex-grow">
                                            <div class="u-title">
                                                <a href="Tintimviecinfor.aspx?id=<%# Eval("sID_tintimviec") %>">
                                                    <asp:Label ID="Lbl_title" runat="server" Text='<%# Eval("sTitle") %>'></asp:Label></a>
                                            </div>
                                            <div class="u-name">
                                                <a href="Userinfor.aspx?id=<%# Eval("sID_User") %>">
                                                    <asp:Label ID="Lbl_username" runat="server" Text='<%# Eval("sTen_User") %>'></asp:Label></a>
                                            </div>
                                            <div class="u-add">
                                                <div>
                                                    <i class="fa-solid fa-dollar-sign"></i>
                                                    <asp:Label ID="lbl_luong" runat="server" Text='<%# Eval("sMucluong") %>'></asp:Label>
                                                </div>
                                                <div>
                                                    <i class="fa-solid fa-map-location-dot"></i>
                                                    <asp:Label ID="lbl_diachi" runat="server" Text='<%# Eval("sDiachi") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-job-info">
                                        <div class="salary text_ellipsis">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
