    <%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="BTLWebTuyenDung.Dangnhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-login">
        <div class="noi-dung">
            <div class="form">
                <h2>Đăng Nhập</h2>
                <asp:Panel ID="loginPanel" runat="server" DefaultButton="btndangnhap">
                    <div class="input-form txtlogin">
                        <span>Tên tài khoản:</span>
                        <asp:TextBox ID="txtTaikhoan" runat="server" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="input-form txtlogin">
                        <span>Mật khẩu:</span>
                        <asp:TextBox ID="txtMatkhau" TextMode="Password" runat="server" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <br>
                    <div class="input-form txtlogin">
                        <asp:Button ID="btndangnhap" runat="server" Text="ĐĂNG NHẬP" OnClick="btndangnhap_Click" />
                    </div>
                </asp:Panel>
                <div class="input-form txtlogin">
                    <p>Bạn Chưa Có Tài Khoản? <a href="Dangky.aspx">Đăng Ký</a></p>
                </div>

                <div class="login_message" style="text-align: center; color: red;">
                    <asp:Label ID="lblThongbao" runat="server" ClientIDMode="Static"></asp:Label>
                    <asp:Button ID="btn1" runat="server" ClientIDMode="Static" Text="test" Visible="false" />
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            //alert("1");
            $("#btn1").click(function (e) {
                e.preventDefault(); //cancel reload page
                var taikhoan = $("#txtTaikhoan").val();
                var matkhau = $("#txtMatkhau").val();
                var obj = {
                    tk: taikhoan,
                    mk: matkhau
                }
                $.ajax({
                    type: 'POST',
                    url: 'Dangnhap.aspx/loginTest',
                    data: JSON.stringify(obj),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',

                    beforeSend: function () {
                        alert("before");
                    },
                    success: function (response) {
                        //alert(response.d);
                        if (response.d == "1") {
                            alert("dang nhap sai!");
                            $("#lblThongbao").text("Nhập sai rồi!")
                            //document.getElementById("lblThongbao").innerHTML = 'Some Value';
                        }
                        else {
                            alert(response.d);
                            window.location = response.d;
                        }
                        
                    },
                    failure: function (response) {
                        alert("fail");
                    },
                    complete: function () {
                        alert("complete");
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


