<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="TinTuyenDung.aspx.cs" Inherits="BTLWebTuyenDung.TinTuyenDung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tuyenDung_search">
        <div class="grid wide">
            <div class="tuyenDung_list row">
                <div class="tuyenDung_item col c-9 l-9">
                    <asp:TextBox ID="txtSearchTag" runat="server" CssClass="item-name item" placeholder="Nhập tên công việc"></asp:TextBox>
                </div>
              
                <div class="tuyenDung_item col c-3 l-3">
                    <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" CssClass="item-search item" AutoPostBack="True" OnClick="btnSearch_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="Recruitment grid wide">
        <div class="Recruitment_list row">
            <asp:Repeater ID="rptNameTag" runat="server">
                <ItemTemplate>
                    <div class="Recruitment_item col c-12 l-12">
                        <div class="Recruitment_item-container row">
                            <div class="Recruitment_item-img  col c-2 l-2">
                                <image src='<%# Eval("sImg") %>' alt="ảnh" />
                            </div>
                            <div class="Recruitment_item-content col c-9 l-9">
                                <asp:HyperLink CssClass="Recruitment_item-link" ID="linkToDetail" runat="server"
                                        NavigateUrl='<%# String.Format("detail_Tintuyendung.aspx?id={0}", 
                                        HttpUtility.UrlEncode(Eval("sID_tintuyendung").ToString())) %>'>
                                        <h2><%# Eval("sTitle") %></h2>
                                    </asp:HyperLink>  
                            
                                <p class="name_cty"><a href="Userinfor.aspx?id=<%# Eval("sID_User") %>"><%# Eval("sTen_User") %></a></p>
                                <div>
                                    <p>Mức lương: <%# Eval("sMucluong") %></p>
                                    <p><%# Eval("sDiachi") %></p>
                                    <p>Ngày đăng tin <%# Eval("dNgaydangtin") %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
