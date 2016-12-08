<%@ Page Title="TÀI KHOẢN" Language="C#" MasterPageFile="~/Customer.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Customer_MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-3">
                <div style="width: 100%; color: #fff;" class="TVS-Col-md20">
                    <a href="#"><b>THÔNG TIN TÀI KHOẢN</b></a>
                </div>
                 <div style="width: 100%;">
                    <asp:Label ID="lblImg1" runat="server" Text=""></asp:Label>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2">
                    <a href="MyProfile.aspx">+ Hồ sơ của tôi</a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2">
                    <a href="#">+ Đội nhóm</a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2-1">
                    <a href="#">- Tích lũy tháng</a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2-1">
                    <a href="#">- Tổng số dư</a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2">
                    <a href="#">+ Chia sẻ link</a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2">
                    <a href="#">+ Thay đổi mật khẩu</a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2-2">
                    <a href="../Logout.aspx">+ Thoát</a>
                </div>
            </div>
            <div class="col-md-9">
                <div class="row">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading">Hồ sơ của tôi</div>
                        <div class="panel-body">
                            <p>...</p>
                        </div>

                        <!-- List group -->
                        <ul class="list-group">
                            <li class="list-group-item">Tên tài khoản: <% Response.Write(strName); %></li>
                            <li class="list-group-item">Địa chỉ: <% Response.Write(strAddress); %></li>
                            <li class="list-group-item">Điện thoại: <% Response.Write(strPhone); %></li>
                            <li class="list-group-item">Ngày sinh: <% Response.Write(strBirthday); %></li>
                            <li class="list-group-item">Số CMND: <% Response.Write(strIdCard); %></li>
                            <li class="list-group-item">Địa chỉ Email: <% Response.Write(strEmail); %></li>
                        </ul>
                    </div>
                </div>

                <div class ="row">
                    <asp:Button ID="btnUpdate" CssClass ="btn btn-primary" runat="server" Text="Cập nhật thông tin" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

