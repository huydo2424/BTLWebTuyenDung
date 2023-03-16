<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="UngTuyen.aspx.cs" Inherits="BTLWebTuyenDung.UngTuyen" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide" style="padding-bottom: 1px">
        <div class="row ungTuyen_container">
            <div class="ungTuyen_content col c-6 l-6">
                <div class=" ungTuyen-title " style="display: flex">
                    <h2 style="padding-right: 6px">Ứng tuyển </h2>
                    <h2>
                        <asp:Label ID="lbvitri" runat="server" CssClass=" txtVitri" Text="Label"></asp:Label></h2>
                </div>
                <div style="margin-top: 20px">
                    <form>
                        <tr>
                            <td><span class="ungTuyen-text">Chọn file CV</span></td>
                            <td>:<asp:FileUpload ID="fileCV" CssClass="input fileCV" runat="server"/>
                            </td>
                        </tr>
                        </br>
                    <tr>
                        <td>
                            <sapn class="ungTuyen-text">Họ và tên</sapn></td>
                        <td>:<asp:TextBox ID="txtName" CssClass="input txtName" runat="server" placeholder="họ tên"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server"
                            ControlToValidate="txtName"
                            ForeColor="Red"
                            Display="Dynamic"
                            ErrorMessage="Vui lòng nhập họ và tên"
                        />
                            
                        </td>
                    </tr>
                        </br>
                    <tr>
                        <td>
                            <sapn class="ungTuyen-text">Email</sapn></td>
                        <td>:<asp:TextBox ID="txtEmail" CssClass="input txtMail" runat="server" placeholder="email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ForeColor="Red"
                            Display="Dynamic"
                            ErrorMessage="Vui lòng nhập email"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ForeColor="Red"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ErrorMessage="Email không đúng định dạng"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                        </br>
                    <tr>
                        <td><span class="ungTuyen-text">Số điện thoai</span></td>
                        <td>:<asp:TextBox ID="txtPhone" CssClass="input txtPhone" runat="server" placeholder="số điện thoại"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvtxtPhone" runat="server"
                            ControlToValidate="txtPhone"
                            ForeColor="Red"
                            Display="Dynamic"
                            ErrorMessage="Vui lòng nhập số điện thoại"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revtxtPhone" runat="server"
                            ControlToValidate="txtPhone"
                            ForeColor="Red"
                            ValidationExpression="^0\d{9,10}$"
                            ErrorMessage="Điện thoại không đúng định dạng"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    </form>
                </div>
                <div class="ungTuyen-description">
                    <h3>Giới thiệu:</h3>
                    <div>
                        <textarea id="txtDescription" class="txtMota" runat="server" placeholder="Mô tả"></textarea></div>
                        <asp:RequiredFieldValidator ID="rfvtxtMota" runat="server"
                            ControlToValidate="txtDescription"
                            ForeColor="Red"
                            Display="Dynamic"
                            ErrorMessage="Vui lòng nhập mô tả"></asp:RequiredFieldValidator>
                </div>
                <div class="ungTuyen-btn">
                       <asp:Repeater ID="rptTinUngTuyen" runat="server">
                            <ItemTemplate>
                                <asp:HyperLink CssClass="btn-back-link" ID="linkUngtuyen" runat="server"
                                    NavigateUrl='<%# String.Format("detail_Tintuyendung.aspx?id={0}", 
                                        HttpUtility.UrlEncode(Eval("sID_tintuyendung").ToString())) %>'>
                                    <span class="btn btn-back">Back</span>  
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    <asp:Button ID="btnsubmit" CssClass="btn btnsubmit" runat="server" Text="Nộp" OnClick="btnsubmit_Click" />
                </div>
                <div class="ungTuyen-note">
                    <p>Lưu ý</p>
                   <ol style="padding:16px">
                        <li>Ứng viên nên lựa chọn ứng tuyển bằng CV Online & viết thêm mong muốn tại phần thư giới thiệu để được Nhà tuyển dụng xem CV sớm hơn.</li>
                        <li>Bạn nên thực hiện ứng tuyển khi cảm thấy thông tin công việc và công ty là an toàn và không có các dấu hiệu bất thường. Với vai trò là nền tảng kết nối ứng viên và nhà tuyển dụng</li>
                        <li>Để có trải nghiệm tốt nhất, bạn nên sử dụng các trình duyệt phổ biến như Google Chrome</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
