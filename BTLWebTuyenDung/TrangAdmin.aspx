<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TrangAdmin.aspx.cs" Inherits="BTLWebTuyenDung.TrangAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-inner">
        <div class="page-title">
            <h3 class="breadcrumb-header">Chào mừng <asp:Label ID="lblTenDangNhap" runat="server"></asp:Label> đến trang quản trị viên</h3>
        </div>
        <div id="main-wrapper">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-white stats-widget">
                        <div class="panel-body">
                            <div class="pull-left">
                                <asp:Label ID="Label1" runat="server" Text="Label" CssClass="stats-number"></asp:Label>
                                <p class="stats-info">Người dùng</p>
                            </div>
                            <div class="pull-right">
                                <i class="fa-solid fa-users" style="zoom: 3;"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-white stats-widget">
                        <div class="panel-body">
                            <div class="pull-left">
                                <asp:Label ID="Label2" runat="server" Text="Label" CssClass="stats-number"></asp:Label>
                                <p class="stats-info">Tin tuyển dụng</p>
                            </div>
                            <div class="pull-right">
                                <i class="fa-solid fa-file-lines" style="zoom: 3;"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-white stats-widget">
                        <div class="panel-body">
                            <div class="pull-left">
                                <asp:Label ID="Label3" runat="server" Text="Label" CssClass="stats-number"></asp:Label>
                                <p class="stats-info">Tin tìm việc</p>
                            </div>
                            <div class="pull-right">
                                <i class="fa-regular fa-file" style="zoom: 3;"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-white stats-widget">
                        <div class="panel-body">
                            <div class="pull-left">
                                <asp:Label ID="Label4" runat="server" Text="Label" CssClass="stats-number"></asp:Label>
                                <p class="stats-info">Tin chưa duyệt</p>
                            </div>
                            <div class="pull-right">
                                <i class="fa-solid fa-circle-check" style="zoom: 3;"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-white">
                        <div class="panel-heading clearfix">
                            <h4 class="panel-title">Thống kê</h4>
                        </div>
                        <div class="panel-body">
                            <div id="MyLineChart">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-footer">
            <p>Made with <i class="fa fa-heart"></i> by Group 03</p>
        </div>
    </div>

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script>
        Highcharts.chart('MyLineChart', {
            chart: {
                type: 'bar'
            },
            title: {
                text: 'Top 5 Nhà tuyển dụng có nhiều bài đăng nhất'
            },
       
            accessibility: {
                announceNewData: {
                    enabled: true
                }
            },
            xAxis: {
                type: 'category'
            },
            yAxis: {
                title: {
                    text: 'Số bài đăng'
                }

            },
            legend: {
                enabled: false
            },
            plotOptions: {
                series: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.,f}'
                    }
                }
            },

            tooltip: {
                pointFormat: '<span style="color:{point.color}">Số bài đăng :{point.y}</span>'
            },

            series: [
                {
                    colorByPoint: true,
                    data: <%=lineData%>,
                }
            ],
        });
    </script>
</asp:Content>
