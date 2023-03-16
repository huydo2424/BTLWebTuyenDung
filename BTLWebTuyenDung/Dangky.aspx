<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="Dangky.aspx.cs" Inherits="BTLWebTuyenDung.Dangky" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>  
        .viewCSS {  
            border: solid 2px black;  
            padding: 20px;  
        }  
  
        #menuTabs a.static.selected {  
            border-bottom-color: red;  
            border-bottom-style: solid;  
            border-bottom-width: 3px;  
            color: red;  
        }  
        input[type="radio"] 
        {
            margin-left: 0px;
        }
        .rbGioiTinh span
        {
            margin-left: 30px;
            text-align: center;
        }
        .rbGioiTinh label
        {
            display: block;
        }
    </style> 
    <div class="main-regis">
        <div style="height: 91%" class="noi-dung">
            <div class="form">
                <h2>Đăng Ký</h2>
                <form id="form1">
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                        <asp:View ID="View1" runat="server">
                            <div>
                                Bạn là? <br />
                                <asp:RadioButton ID="R1" GroupName="role" runat="server" Text="Người tìm việc" Checked="true" OnCheckedChanged="check"/>
                                <asp:RadioButton ID="R2" GroupName="role" runat="server" Text="Nhà tuyển dụng" OnCheckedChanged="check"/>
                                <br /><br />
                                <asp:Panel ID="Panel1" runat="server" DefaultButton="btnnext1">
                                    <div class="input-form txtRegis">
                                        <span>Họ và tên:</span>
                                        <asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHoTen"
                                            ErrorMessage="Không được để trống" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="input-form txtRegis">
                                        <asp:Label ID="lblTenTaiKhoan" runat="server" Text="Tên tài khoản"></asp:Label>
                                        <asp:TextBox ID="txtTenTaiKhoan" runat="server"></asp:TextBox>

                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTenTaiKhoan"
                                            ErrorMessage="Không được để trống" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtTenTaiKhoan" ErrorMessage="Vui lòng nhập đúng định dạng địa chỉ email" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                        <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtTenTaiKhoan" ForeColor="red" runat="server" ErrorMessage="Tài khoản này đã có người đăng ký" OnServerValidate="CustomValidator1_ServerValidate" Display="Dynamic"></asp:CustomValidator>
                                    </div>
                                    <div class="input-form txtRegis">
                                        <span>Mật khẩu:</span>
                                        <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password"></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ControlToValidate="txtMatKhau" ForeColor="red" runat="server" ErrorMessage="Không được để trống"></asp:RequiredFieldValidator>
                                        
                                    </div>
                                    <div class="input-form txtRegis">
                                        <span>Nhập lại mật khẩu:</span>
                                        <asp:TextBox ID="txtMatKhau1" runat="server" TextMode="Password"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ControlToValidate="txtMatKhau1" ForeColor="red" runat="server" ErrorMessage="Không được để trống"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator
                                            ID="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="Mật khẩu không giống nhau" ForeColor="Red" ControlToValidate="txtMatKhau1"
                                            ControlToCompare="txtMatKhau"></asp:CompareValidator>
                                    </div>
                                    
                                    <div class="input-form txtRegis">
                                        <asp:Button ID="btnnext1" runat="server" Text = "Next" OnClick="btnnext1_Click" />
                                    </div>
                                </asp:Panel>
                            </div>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <div>
                                <div class="input-form txtRegis" style="text-align: center">
                                    <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                                <asp:Panel ID="Panel2" runat="server" DefaultButton="btnDangKy">
                                <div class="input-form txtRegis" ID="ngaysinh" runat="server">
                                    <span>Ngày sinh:</span>
                                    <asp:TextBox ID="TxtNgaysinh" runat="server" TextMode="Date"></asp:TextBox><br />
                                </div>

                                <div class="input-form txtRegis" ID="gioitinh" runat="server">
                                    <span>Giới tính:</span> <br />
                                    <asp:RadioButton ID="male" CssClass="rbGioiTinh" GroupName="gioitinh" runat="server" Checked="true" Text="Nam" TextAlign="Right"/>
                                    <asp:RadioButton ID="female" CssClass="rbGioiTinh" GroupName="gioitinh" runat="server" Text="Nữ"/>
                                </div>
                                <div class="input-form txtRegis">
                                    <span>Địa chỉ:</span>
                                    <asp:TextBox ID="TxtDiachi" runat="server"></asp:TextBox><br />
                                </div>

                                <div class="input-form txtRegis" ID="hocvan" runat="server">
                                    <span>Học vấn:</span>
                                    <asp:TextBox ID="TxtHocvan" runat="server"></asp:TextBox><br />
                                </div>

                                <div class="input-form txtRegis">
                                    <span>Ảnh đại diện:</span>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </div>

                                <div class="input-form txtRegis">
                                    <span>Giới thiệu:</span>
                                    <asp:TextBox ID="TxtGioithieu" runat="server"></asp:TextBox><br />
                                </div>

                            
                                <div class="input-form txtRegis">
                                    <asp:Button ID="btnDangKy" runat="server" Text="Đăng ký" OnClick="btnDangKy_Click" />
                                </div>
                            </asp:Panel>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                       
                    <div class="input-form is-user">
                        <p>Bạn Đã Có Tài Khoản? <a href="Dangnhap.aspx">Đăng Nhập</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {

            $("#btnnext1").click(function () {
                //const trangthai = document.getElementById("cbDuyet").checked;
                alert("1");
                $.ajax({
                    type: 'POST',
                    url: 'Articles.aspx/changeStatusArticle',
                    data: "{ status: " + trangthai + "}",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',

                    success: function (response) {
                        alert(response.d);
                    },
                    failure: function (response) {
                        alert("fail");
                    }
                });
            });
        });

    </script>
</asp:Content>
