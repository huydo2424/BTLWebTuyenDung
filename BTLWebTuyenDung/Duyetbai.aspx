<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Duyetbai.aspx.cs" Inherits="BTLWebTuyenDung.Duyetbai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-inner">
        <div id="main-wrapper">
            <div class="row">
                <!-- Content -->
                <div class ="header-duyettin">
                    <input type="button" onclick="tintuyendung()" name="name" value="Tin tuyển dụng" class="snip1457 click" id="btnduyet_td"/>
                    <input type="button" onclick="tintimviec()" name="name" value="Tin tìm việc" class="snip1457" id="btnduyet_tv"/>
                </div>
            </div>
            <div class="row" id ="tintuyendung">
                <!-- List -->
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="job-ta" style="display: flex;" id="item">
                            <div class="feature-job-item job-bd" style="width: 900px; margin-right: 30px;">
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
                            </div>
                            <div class="grid">
                                <input type="button" <%--onclick="DuyetBai(this, '<%# Eval("sID_tintuyendung") %>', 'TD')"--%> id="duyet_<%# Eval("sID_tintuyendung") %>" name="xulyttd" value="Duyệt" />
                                <input type="button" <%--onclick="XoaBai(this, '<%# Eval("sID_tintuyendung") %>', 'TD')"--%> id="xoa_<%# Eval("sID_tintuyendung") %>" name="xulyttd" value="Xóa" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>          
        </div>

        <div class="row" id ="tintimviec">
                <!-- List -->
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <div class="job-ta" style="display: flex;" id="item">
                            <div class="feature-job-item job-bd" style="width: 900px; margin-right: 30px;">
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
                            </div>
                            <div class="grid">
                                <input type="button" <%--onclick="DuyetBai(this, '<%# Eval("sID_tintimviec") %>', 'TV')"--%> id="duyet_<%# Eval("sID_tintimviec") %>" name="huyduyetttv" value="Duyệt" />
                                <input type="button" <%--onclick="XoaBai(this, '<%# Eval("sID_tintimviec") %>', 'TV')"--%> id="xoa_<%# Eval("sID_tintimviec") %>" name="xulyttv" value="Xóa" />
                                <input type="button" id="huyduyet_<%# Eval("sID_tintimviec") %>" name="huyduyetttv" value="Hủy duyệt" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>          
        <div class="page-footer">
            <p>Made with <i class="fa fa-heart"></i> by Group 03</p>
        </div>
    </div>

    <script>
        document.getElementById("tintimviec").style.display = "none";
        function tintimviec() {
            document.getElementById("tintuyendung").style.display = "none";
            document.getElementById("tintimviec").style.display = "block";
            document.getElementById("btnduyet_tv").classList = "snip1457 click";
            document.getElementById("btnduyet_td").classList = "snip1457";
        }
        function tintuyendung() {
            document.getElementById("tintuyendung").style.display = "block";
            document.getElementById("tintimviec").style.display = "none";
            document.getElementById("btnduyet_td").classList = "snip1457 click";
            document.getElementById("btnduyet_tv").classList = "snip1457"
        }
        //function XoaBai(obj, id, type) {
        //    var xhttp;
        //    xhttp = new XMLHttpRequest();
        //    xhttp.onreadystatechange = function () {
        //        if (this.readyState == 4 && this.status == 200) {
        //            obj.closest('.job-ta').remove();
        //        }
        //    }
        //    xhttp.open("POST", "Duyetbai.aspx?act=xoa&id=" + id + "&type=" + type);
        //    xhttp.send();
        //}
        //function DuyetBai(obj, id, type) {
        //    var xhttp;
        //    xhttp = new XMLHttpRequest();
        //    xhttp.onreadystatechange = function () {
        //        if (this.readyState == 4 && this.status == 200) {
        //            obj.closest('.job-ta').remove();
        //        }
        //    }
        //    xhttp.open("POST", "Duyetbai.aspx?act=duyet&id=" + id + "&type=" + type);
        //    xhttp.send(); 
        //}
        window.onload = function () {
            var reloading = sessionStorage.getItem("admindangduyet");
            if (reloading == "TTV") {
                tintimviec();
            }
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            //alert("1");
            $('input[name="xulyttv"]').click(function () {
                var idElement = this.id;
                const arr = idElement.split("_");
                var action_ttv = arr[0];
                var id_ttv = parseInt(arr[1]);
                var obj = {
                    act: action_ttv,
                    id: id_ttv
                }
                $.ajax({
                    type: 'POST',
                    url: 'Duyetbai.aspx/xuLyTinTimViecAdmin',
                    data: JSON.stringify(obj),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',

                    beforeSend: function () {

                    },
                    success: function (response) {
                        alert(response.d);
                        sessionStorage.setItem("admindangduyet", "TTV");
                        location.reload();
                    },
                    failure: function (response) {
                        alert("fail");
                    },
                    complete: function () {

                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        alert(err.Message);
                    },
                });
            });

            $('input[name="xulyttd"]').click(function () {
                var idElement = this.id;
                const arr = idElement.split("_");
                var action_ttd = arr[0];
                var id_ttd = parseInt(arr[1]);
                var obj = {
                    act: action_ttd,
                    id: id_ttd
                }
                $.ajax({
                    type: 'POST',
                    url: 'Duyetbai.aspx/xuLyTinTuyenDungAdmin',
                    data: JSON.stringify(obj),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',

                    beforeSend: function () {

                    },
                    success: function (response) {
                        alert(response.d);
                        sessionStorage.setItem("admindangduyet", "TTD");
                        location.reload();
                    },
                    failure: function (response) {
                        alert("fail");
                    },
                    complete: function () {

                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        alert(err.Message);
                    },
                });
            });

            $('input[name="huyduyetttv"]').click(function () {
                var idElement = this.id;
                const arr = idElement.split("_");
                var action_ttv = arr[0];
                var id_ttv = parseInt(arr[1]);
                var obj = {
                    act: action_ttv,
                    id: id_ttv
                }
                $.ajax({
                    type: 'POST',
                    url: 'Duyetbai.aspx/huyDuyetTinTimViecAdmin',
                    data: JSON.stringify(obj),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',

                    beforeSend: function () {

                    },
                    success: function (response) {
                        alert(response.d);
                        sessionStorage.setItem("admindangduyet", "TTV");
                        location.reload();
                    },
                    failure: function (response) {
                        alert("fail");
                    },
                    complete: function () {

                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        alert(err.Message);
                    },
                });
            });

        });
    </script>
</asp:Content>
