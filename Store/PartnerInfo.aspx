<%@ Page Title="THÔNG TIN CỬA HÀNG" Language="C#" MasterPageFile="~/Store.master" AutoEventWireup="true" CodeFile="PartnerInfo.aspx.cs" Inherits="Store_PartnerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="col-md-12">
            <div style="width: 100%; display: table; margin-top:20px;">
                <div style="width: 40%; display: table; float: left;">
                    
                    <div style="width: 100%; display: table; float: right;">
                        <b>THÔNG TIN CỬA HÀNG</b>
                    </div>

                    <div style="width: 100%; display: table; float: right; margin-top:10px;">
                        <asp:Label ID="lblImg1" runat="server" Text=""></asp:Label>
                    </div>

                    <div style="width: 100%; display: table; float: right; height:30px; line-height:30px; margin-top:10px;">
                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                    </div>

                    <div style="width: 100%; display: table; float: right; height:30px; line-height:30px;">
                        <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                    </div>
                    
                    <div style="width: 100%; display: table; float: right; height:30px; line-height:30px;">
                        <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                    </div>
                    
                    <div style="width: 100%; display: table; float: right; height:30px; line-height:30px;">
                        <asp:Label ID="lblManager" runat="server" Text=""></asp:Label>
                    </div>

                    <div style="width: 100%; display: table; float: right; height:30px; line-height:30px;">
                        <asp:Label ID="lblTaxCode" runat="server" Text=""></asp:Label>
                    </div>
                    
                    <div style="width: 100%; display: table; float: right; height:30px; line-height:30px;">
                        <asp:CheckBox ID="ckbBestSale" Enabled = "false" Text="  Bán chạy %" runat="server" />
                    </div>

                    <div style="width: 100%; display: table; float: right; height:30px; line-height:30px;">
                        <asp:CheckBox ID="ckbVIP" Enabled = "false" Text="  Bán chạy VIP" runat="server" />
                    </div>
                        
                    <div style="width: 100%; display: table; float: right; height:30px; line-height:30px;">
                        <asp:CheckBox ID="ckbState" Enabled = "false" Text="  Trạng thái" runat="server" />
                    </div>
                </div>
                <div style="width: 60%; display: table; float: right;">
                    <div style="width: 20%; display: table; float: left; height:30px; line-height:30px;">
                        &nbsp;
                    </div>
                    <div style="width: 80%; display: table; float: right; height:30px; line-height:30px;">
                        <b>THÔNG TIN TÀI KHOẢN GIAN HÀNG</b>
                    </div>
                    <div style="width: 20%; display: table; float: left;height:30px; line-height:30px;">
                        Tài khoản:
                    </div>
                    <div style="width: 80%; display: table; float: right;height:30px; line-height:30px;">
                        <asp:Label ID="lblAccount" runat="server" Text=""></asp:Label>
                    </div>

                    <div style="width: 20%; display: table; float: left;height:30px; line-height:30px;">
                        Số sản phẩm:
                    </div>
                    <div style="width: 80%; display: table; float: right;height:30px; line-height:30px;">
                        <% Response.Write(this.SoSanPham.ToString()); %>
                    </div>

                    <div style="width: 20%; display: table; float: left;height:30px; line-height:30px;">
                        Sản phẩm VIP:
                    </div>
                    <div style="width: 80%; display: table; float: right;height:30px; line-height:30px;">
                        <% Response.Write(this.SoSanPhamVIP.ToString()); %>
                    </div>

                    <div style="width: 20%; display: table; float: left;height:30px; line-height:30px;">
                        Sản phẩm bán chạy:
                    </div>
                    <div style="width: 80%; display: table; float: right;height:30px; line-height:30px;">
                        <% Response.Write(this.SoSanPhamBanChay.ToString()); %>
                    </div>

                    <div style="width: 20%; display: table; float: left;height:30px; line-height:30px;">
                        Số lần giao dịch:
                    </div>
                    <div style="width: 80%; display: table; float: right;height:30px; line-height:30px;">
                       <% Response.Write(this.SoGiaoDich.ToString()); %>
                    </div>

                    <div style="width: 20%; display: table; float: left;height:30px; line-height:30px;">
                        Doanh số:
                    </div>
                    <div style="width: 80%; display: table; float: right;height:30px; line-height:30px;">
                        <% Response.Write(this.TongDoanhSo.ToString()); %>
                    </div>

                     <div style="width: 20%; display: table; float: left;height:50px; line-height:50px;">
                        &nbsp;
                    </div>
                    <div style="width: 80%; display: table; float: right;height:50px; line-height:50px;">
                        &nbsp;
                    </div>

                     <div style="width: 20%; display: table; float: left;height:30px; line-height:30px;">
                        Mật khẩu cũ:
                    </div>
                    <div style="width: 80%; display: table; float: right;height:30px; line-height:30px;">
                        <asp:TextBox ID="txtOldPass" runat="server" TextMode = "Password" Height = "26px" Width = "200px"></asp:TextBox>
                    </div>
                    <div style="width: 20%; display: table; float: left;height:30px; line-height:30px;">
                        Mật khẩu mới:
                    </div>
                    <div style="width: 80%; display: table; float: right;height:30px; line-height:30px;">
                        <asp:TextBox ID="txtNewPass" runat="server" TextMode = "Password" Height = "26px" Width = "200px"></asp:TextBox>
                    </div>
                    <div style="width: 20%; display: table; float: left;height:50px; line-height:50px;">
                        &nbsp;
                    </div>
                    <div style="width: 80%; display: table; float: right;height:50px; line-height:50px;">
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                    <div style="width: 20%; display: table; float: left;height:30px; line-height:30px;">
                        &nbsp;
                    </div>
                    <div style="width: 80%; display: table; float: right;height:30px; line-height:30px;">
                        <asp:Button ID="btnOK" runat="server" Text="GHI NHẬN" Width = "200px" class="btn btn-lg btn-success btn-block" OnClick="btnOK_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

