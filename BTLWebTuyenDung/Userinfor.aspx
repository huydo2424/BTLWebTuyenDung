<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="Userinfor.aspx.cs" Inherits="BTLWebTuyenDung.Userinfor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page">
        <div class="page-sidebar-inner">
                <ul class="accordion-menu">
                    <li class="active-page">
                        <a href="" class="item_user_infor" id="user_infor" runat="server">
                            <i class="fa-solid fa-address-card"></i><span>&nbsp Trang cá nhân</span>
                        </a>
                    </li>
                    <li class="active-page">
                        <a href="" class="item_user_infor" runat="server" id="baidang">
                            <i class="fa-brands fa-wordpress"></i><span>&nbsp Bài đăng</span>
                        </a>
                    </li>
                    <li class="active-page" id="ut" runat="server">
                        <a href="" class="item_user_infor" runat="server" id="ungtuyen">
                            <i class="fa-solid fa-briefcase"></i><span>&nbsp Công việc đã ứng tuyển</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="user-infor" id="div1" runat="server">
                <asp:FormView ID="FormView1" runat="server" CssClass="user-table">
                    <ItemTemplate>
                        <div class="r">
                            <div class="item_user_infor">
                                <div><asp:Label ID="Lbl_tendangnhap" runat="server" Text="Tên đăng nhập / Email: "></asp:Label><%# Eval("sTendangnhap") %></div>
                            
                                <div><asp:Label ID="Lbl_tenuser" runat="server" Text="Tên người dùng: "></asp:Label> <%# Eval("sTen_User") %></div>
                            </div>

                            <div class="item_user_infor">
                                <div><asp:Label ID="Lbl_pass" runat="server" Text="Mật khẩu: "></asp:Label>
                                    <asp:Label ID="lbl_password" runat="server" Text='<%# Eval("sPassword") %>'></asp:Label></div>
                            
                                <div><asp:Label ID="Lbl_diachi" runat="server" Text="Địa chỉ: "> <%# Eval("sDiachi") %></asp:Label></div>
                            </div>

                            <div class="item_user_infor" id="role_1" runat="server" visible="false">
                                <div><asp:Label ID="Lbl_ngaysinh" runat="server" Text="Ngày sinh: "></asp:Label><%# Eval("dNgaysinh", "{0:d/M/yyyy}") %></div>

                                <div><asp:Label ID="Lbl_gt" runat="server" Text="Giới tính: "></asp:Label><asp:Label ID="Lbl_gioitinh" runat="server" Text='<%# Eval("bGioitinh") %>'></asp:Label></div>
                            
                                <div><asp:Label ID="Lbl_hocvan" runat="server" Text="Học vấn: "> <%# Eval("sHocvan") %></asp:Label></div>
                            </div>

                            <div class="item_user_infor">
                                <div><asp:Label ID="Lbl_gioithieu" runat="server" Text="Giới thiệu: "> <%# Eval("sGioithieu") %></asp:Label></div>
                            </div>

                            <div class="item_user_infor center">
                                <asp:Button ID="btn_edit" runat="server" Text="Sửa thông tin" OnClick="btn_edit_Click" CssClass="btnedit-hover btnedit"/>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>

            <div class="user-infor-img" id="div2" runat="server">
                <asp:FormView ID="FormView2" runat="server" CssClass="user-table">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("sImg") %>' CssClass="img-user"/>
                        </ItemTemplate>
                </asp:FormView>
            </div>
            
            <div class="user-infor" id="div3" runat="server" visible="false">
                <asp:FormView ID="FormView3" runat="server" CssClass="user-table user-infor">
                    <ItemTemplate>
                        <div class="item2">
                            <div>
                                <asp:Label ID="Lbl_tendangnhap" runat="server" Text="Tên đăng nhập / Email: "></asp:Label>
                                <asp:TextBox ID="Txt_tendangnhap" runat="server" Text='<%# Eval("sTendangnhap") %>' ReadOnly="true"></asp:TextBox>
                                <span class="focus-border"></span>
                            </div>  
                                
                            <div>
                                <asp:Label ID="Label1" runat="server" Text="Tên người dùng: "></asp:Label>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("sTen_User") %>' ></asp:TextBox>
                                <span class="focus-border"></span>
                            </div>

                            <div>
                                <asp:Label ID="Label2" runat="server" Text="Mật khẩu: "></asp:Label>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("sPassword") %>' ></asp:TextBox>
                                <span class="focus-border"></span>
                            </div>

                            <div id="ns" runat="server" visible="false">
                                <asp:Label ID="Label3" runat="server" Text="Ngày sinh: "></asp:Label>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("dNgaysinh", "{0:d/M/yyyy}") %>' TextMode="DateTime"></asp:TextBox>
                                <span class="focus-border"></span>
                            </div>

                            <div id="gt" runat="server" visible="false">
                                <asp:Label ID="Label4" runat="server" Text="Giới tính: "></asp:Label><br />
                                <asp:RadioButton ID="male" GroupName="gioitinh" runat="server" Text="Nam"/>
                                <asp:RadioButton ID="female" GroupName="gioitinh" runat="server" Text="Nữ"/>
                            </div>

                            <div>
                                <asp:Label ID="Label5" runat="server" Text="Địa chỉ: "></asp:Label>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("sDiachi") %>' ></asp:TextBox>
                                <span class="focus-border"></span>
                            </div>

                            <div id="hv" runat="server" visible="false">
                                <asp:Label ID="Label6" runat="server" Text="Học vấn:  "></asp:Label>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("sHocvan") %>' ></asp:TextBox>
                                <span class="focus-border"></span>
                            </div>

                            <div>
                                <asp:Label ID="Label7" runat="server" Text="Ảnh đại diện:  "></asp:Label>
                                <asp:FileUpload ID="FileUpload1" runat="server"/>
                                <span class="focus-border"></span>
                            </div>

                            <div>
                                <asp:Label ID="Label8" runat="server" Text="Giới thiệu:  "></asp:Label>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("sGioithieu") %>' ></asp:TextBox>
                                <span class="focus-border"></span>
                            </div>
                                
                            <asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" CssClass="btnedit-hover btnedit save"/>
                                    
                            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click" CssClass="btnedit-hover btnedit save"/>
                        </div>
                    </ItemTemplate>
            </asp:FormView>
        </div>
    </div>
</asp:Content>
