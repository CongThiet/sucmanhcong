<%@ Page Title="QUẢN LÝ CỬA HÀNG" Language="C#" MasterPageFile="~/Store.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Store_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" style ="width:100%;">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading"><b>THÔNG TIN CỬA HÀNG</b></div>
                        <!-- List group -->
                        <ul class="list-group">
                            <li class="list-group-item">Tên cửa hàng: <% Response.Write(strName); %></li>
                            <li class="list-group-item">Địa chỉ: <% Response.Write(strAddress); %></li>
                            <li class="list-group-item">Điện thoại: <% Response.Write(strPhone); %></li>
                            <li class="list-group-item">Địa chỉ email: <% Response.Write(strEmail); %></li>
                            <li class="list-group-item">Mã số thuế: <% Response.Write(strTaxcode); %></li>
                            <li class="list-group-item">Tài khoản cửa hàng: <% Response.Write(strAccount); %></li>
                            <li class="list-group-item">Số tài khoản: <% Response.Write(strBankAccount); %></li>
                            <li class="list-group-item">Ngân hàng: <% Response.Write(strBankAccountName); %></li>
                        </ul>
                    </div>
                </div>

                <%-- <div class="row">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading"><b>Thông tin khác</b></div>
                        <!-- List group -->
                        <ul class="list-group">
                            <li class="list-group-item">Cửa hàng bán chạy: <% Response.Write(strBestSale); %></li>
                            <li class="list-group-item">Cửa hàng VIP: <% Response.Write(strVIP); %></li>
                            <li class="list-group-item">Số sản phẩm: <% Response.Write(SoSanPham); %></li>
                            <li class="list-group-item">Sản phẩm bán chạy: <% Response.Write(SoSanPhamBanChay); %></li>
                            <li class="list-group-item">Số lần giao dịch: <% Response.Write(SoGiaoDich); %></li>
                            <li class="list-group-item">Tổng doanh số: <% Response.Write(TongDoanhSo); %></li>
                        </ul>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>

