<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="Dangtintimviec.aspx.cs" Inherits="BTLWebTuyenDung.Dangtintimviec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide" style="padding-bottom: 1px;">
        <div class="row add_TDD_container" style="width: 100%;">
            <div class="add_TDD_content col c-6 l-6">
                <div class=" add_TDD-title " style="display: flex">
                    <h2>
                        <asp:Label ID="lbTenCTY" runat="server" CssClass=" txtCTY" Text="Đăng tin tìm việc"></asp:Label></h2>
                </div>
                <div style="margin-top: 20px">
                    <form>
                        <tr>
                            <td>
                                <span class="txt_TDD">Tiêu đề</span>
                            </td>
                            <td>:<asp:TextBox ID="txtTitle" CssClass="input" runat="server" placeholder="Nhập tiêu đề:"></asp:TextBox>
                                <div>
                                    <asp:RequiredFieldValidator ID="rfvtxtTitle" runat="server"
                                        ControlToValidate="txtTitle"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        ErrorMessage="Vui lòng nhập Tên"></asp:RequiredFieldValidator>
                                </div>

                            </td>
                        </tr>
                        </br>
                        <tr>
                            <td>
                                <span class="txt_TDD">Địa chỉ</span></td>
                            <td>:<asp:TextBox ID="txtDiachi" CssClass="input" runat="server" placeholder="Nhập địa chỉ"></asp:TextBox>
                                <div>
                                    <asp:RequiredFieldValidator ID="rfvtxtDiachi" runat="server"
                                        ControlToValidate="txtDiachi"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        ErrorMessage="Vui lòng nhập địa chỉ" />
                                </div>
                            </td>
                        </tr>
                        </br>
                        <tr>
                            <td>
                                <span class="txt_TDD">Vị trí</span></td>
                            <td>:<asp:TextBox ID="txtvitri" CssClass="input" runat="server" ></asp:TextBox>
                                <div>
                                    <asp:RequiredFieldValidator ID="rfvtxtvitri" runat="server"
                                        ControlToValidate="txtvitri"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        ErrorMessage="Vui lòng nhập vị trí cần tuyển" />
                                </div>
                            </td>
                        </tr>
                        </br>
                        <tr>
                            <td>
                                <span class="txt_TDD">Mức lương từ</span></td>
                            <td>:<asp:TextBox ID="txtMucluong" CssClass="input" runat="server" placeholder="Mức lương mong muốn"></asp:TextBox>
                                <td>
                                    <br />
                                <span class="txt_TDD">Đến</span></td>
                            <td>:<asp:TextBox ID="txtMucluong1" CssClass="input" runat="server" placeholder="Mức lương mong muốn"></asp:TextBox>
                                <div>
                                    <asp:RequiredFieldValidator ID="rfvtxtMucluong" runat="server"
                                        ControlToValidate="txtMucluong"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        ErrorMessage="Vui lòng nhập mức lương" />

                                    <asp:RegularExpressionValidator ID="revtxtMucluong" runat="server"
                                        ControlToValidate="txtMucluong"
                                        ForeColor="Red"
                                        ValidationExpression="\d+$"
                                        ErrorMessage="Nhập mức lương mong muốn!"></asp:RegularExpressionValidator>
                                </div>
                            </td>
                        </tr>
                        </br>
                        <tr>
                            <td>
                                <span class="txt_TDD">Cấp độ</span></td>
                            <td>:<asp:TextBox ID="txtCapdo" CssClass="input" runat="server"  ></asp:TextBox>
                                <div>
                                    <asp:RequiredFieldValidator ID="rfvtxtCapdo" runat="server"
                                        ControlToValidate="txtCapdo"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        ErrorMessage="Vui lòng nhập cấp độ" />
                                </div>
                            </td>
                        </tr>
                    </form>
                </div>
                <div>
                    <p class="txtarea_TDD">Mô tả</p>
                    <textarea id="txtMota" class="input input-area" placeholder="Mô tả" runat="server"></textarea>
                    <asp:RequiredFieldValidator ID="rfvtxtMota" runat="server"
                        ControlToValidate="txtMota"
                        ForeColor="Red"
                        Display="Dynamic"
                        ErrorMessage="Vui lòng nhập mô tả" />
                </div>
                 <div class="col-6">
                            <div class="input-box">
                                <label>File CV:</label>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <asp:Image ID="txtImage"  runat="server" />
                            </div>
                        </div>
                        <div class="clear"></div>
                <div class="add_TDD-btn">
                   
                    <asp:Button ID="btn_addTinTimViec" CssClass="btn" runat="server" OnClick="btn_addTinTimViec_Click" Text="Đăng tin " />
                </div>
            </div>
        </div>
    </div>
</asp:Content>