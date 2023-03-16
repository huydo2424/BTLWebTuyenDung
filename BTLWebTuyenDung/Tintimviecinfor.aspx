<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="Tintimviecinfor.aspx.cs" Inherits="BTLWebTuyenDung.Tintimviecinfor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page">
        <div class="user-infor" id="div1" runat="server" style="padding: 50px">
            <asp:FormView ID="FormView1" runat="server" CssClass="user-table">
                <ItemTemplate>
                    <div class="box-general">
                        <div>
                            <h4><%#Eval("sTen_User") %></h4>
                            <br /><br />
                            <asp:Label ID="Label9" runat="server" Text="Tiêu đề:"></asp:Label><%# Eval("sTitle") %></div>
                        <div class="item">
                            <div>
                                <asp:Label ID="Lbl_tendangnhap" runat="server" Text="Mức lương:"></asp:Label><%# Eval("sMucluong") %></div>

                            <div>
                                <asp:Label ID="Lbl_tenuser" runat="server" Text="Vị trí: "></asp:Label>
                                <%# Eval("sCapdo") %></div>
                        </div>

                        <div class="item">
                            <div>
                                <asp:Label ID="Lbl_diachi" runat="server" Text="Địa chỉ: "> <%# Eval("sDiachi") %></asp:Label></div>
                            <div>
                                <asp:Label ID="Label10" runat="server" Text="File: "></asp:Label></div>
                            <!-- Viết lấy file-->
                        </div>

                        <div class="item" id="role_1" runat="server" visible="false">
                            <div>
                                <asp:Label ID="Lbl_ngaysinh" runat="server" Text="Ngày đăng: "></asp:Label><%# Eval("dNgaydangtin", "{0:d/M/yyyy}") %></div>
                        </div>

                        <div class="item">
                            <div>
                                <asp:Label ID="Lbl_gioithieu" runat="server" Text="Mô tả: "> <%# Eval("sMota") %></asp:Label></div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
        
           
    </div>
</asp:Content>
