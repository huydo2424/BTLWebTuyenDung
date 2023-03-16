<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="ThemTinTuyenDung.aspx.cs" Inherits="BTLWebTuyenDung.ThemTinTuyenDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide" style="padding-bottom: 1px">
        <div class="row add_TDD_container">
            <div class="add_TDD_content col c-6 l-6">
                <div class=" add_TDD-title " style="display: flex">
                    <h2>
                        <asp:Label ID="lbTenCTY" runat="server" CssClass=" txtCTY" Text="Công ty"></asp:Label></h2>
                </div>
                <div style="margin-top: 20px">
                    <form>
                        <tr>
                            <td>
                                <span class="txt_TDD">Tên tag</span>
                            </td>
                            <td>:<asp:TextBox ID="txtTagName" CssClass="input" runat="server" placeholder="Tag tên"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvtxtTagName" runat="server"
                                    ControlToValidate="txtTagName"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    ErrorMessage="Vui lòng nhập Tên"></asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        </br>
                        <tr>
                            <td>
                                <span class="txt_TDD">Tiêu đề</span></td>
                            <td>:<asp:TextBox ID="txttitle" CssClass="input" runat="server" placeholder="Tiêu đề"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvtxtTitle" runat="server"
                                    ControlToValidate="txttitle"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    ErrorMessage="Vui lòng nhập tiêu đề" />
                            </td>
                        </tr>
                        </br>
                        <tr>
                            <td>
                                <span class="txt_TDD">Vị trí</span></td>
                            <td>:<asp:TextBox ID="txtvitri" CssClass="input" runat="server" placeholder="Vị trí"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvtxtvitri" runat="server"
                                    ControlToValidate="txtvitri"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    ErrorMessage="Vui lòng nhập vị trí cần tuyển" />
                            </td>
                        </tr>
                        </br>
                        <tr>
                            <td>
                                <span class="txt_TDD">Mức lương</span></td>
                            <td>:<asp:TextBox ID="txtMucluong" CssClass="input" runat="server" placeholder="Mức lương"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvtxtMucluong" runat="server"
                                    ControlToValidate="txtMucluong"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    ErrorMessage="Vui lòng nhập mức lương" />
                                <asp:RegularExpressionValidator ID="revtxtMucluong" runat="server"
                                    ControlToValidate="txtMucluong"
                                    ForeColor="Red"
                                    ValidationExpression="\d+$"
                                    ErrorMessage="Điện thoại không đúng định dạng"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        </br>
                        <tr>
                            <td>
                                <span class="txt_TDD">Địa chỉ</span></td>
                            <td>:<asp:TextBox ID="txtDiachi" CssClass="input" runat="server" placeholder="Địa chỉ "></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvtxtDiachi" runat="server"
                                    ControlToValidate="txtDiachi"
                                    ForeColor="Red"
                                    Display="Dynamic"
                                    ErrorMessage="Vui lòng nhập địa chỉ" />
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
                <div>
                    <p class="txtarea_TDD">Yêu cầu</p>
                    <textarea id="txtYeucau" class="input input-area" runat="server" placeholder="Yêu cầu"></textarea>
                    <asp:RequiredFieldValidator ID="rfvtxtYeucau" runat="server"
                        ControlToValidate="txtYeucau"
                        ForeColor="Red"
                        Display="Dynamic"
                        ErrorMessage="Vui lòng nhập yêu cầu" />
                </div>
                <div class="add_TDD-btn">
                    <asp:Button ID="btn_back" CssClass="btn" runat="server" Text="Back" OnClick="btn_back_Click" />
                    <asp:Button ID="btn_add" CssClass="btn" runat="server" Text="Thêm" OnClick="btn_add_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
