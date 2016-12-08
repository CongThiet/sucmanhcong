<%@ Page Title="THÔNG TIN HÓA ĐƠN" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BillNote.aspx.cs" Inherits="Customer_BillNote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div style="width: 100%;">
            <div style="width: 50%; float: left;">
                <h3>Thông tin hóa đơn</h3>
                <div style="width: 100%; height: 40px; line-height: 40px; font-weight: bold;">
                    <% Response.Write(this.strPartnerName); %>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 25%; float: left;">
                        Ngày hóa đơn
                    </div>
                    <div style="width: 75%; float: right; text-align: left;">
                        <% Response.Write(this.strNgayHoaDon); %>
                    </div>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 25%; float: left;">
                        Tiền hóa đơn
                    </div>
                    <div style="width: 75%; float: right; text-align: left;">
                        <% Response.Write(this.strTotalMoney); %>
                    </div>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 25%; float: left;">
                        Tiền hưởng chiết khấu
                    </div>
                    <div style="width: 75%; float: right; text-align: left;">
                        <% Response.Write(this.strTotalMoneyDiscount); %>
                    </div>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 25%; float: left;">
                        Mức chiết khấu
                    </div>
                    <div style="width: 75%; float: right; text-align: left;">
                        <% Response.Write(this.strDiscount); %>
                    </div>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 25%; float: left;">
                        Tiền phải thanh toan
                    </div>
                    <div style="width: 75%; float: right; text-align: left;">
                        <% Response.Write(this.strTotalPeyment); %>
                    </div>
                </div>
            </div>
            <div style="width: 50%; float: right;">
                <h3>Đánh giá đơn hàng</h3>
                 <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 25%; float: left;">
                        Lựa chọn
                    </div>
                    <div style="width: 75%; float: right; text-align: left;">
                        <asp:DropDownList ID="ddlBillNote" runat="server" Style="width: 100%; height: 26px; line-height: 26px; margin-top: 3px;"></asp:DropDownList>
                    </div>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 25%; float: left;">
                        Nội dung khác
                    </div>
                    <div style="width: 75%; float: right; text-align: left;">
                        <asp:TextBox ID="txtNote" TextMode ="MultiLine" Width = "100%" Rows = "6" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div style="width: 100%; height: 30px; line-height: 30px;">
                    <div style="width: 25%; float: left;">
                        Nội dung khác
                    </div>
                    <div style="width: 75%; float: right; text-align: left; height:40px; line-height:40px;">
                        <asp:Button ID="btnSave" runat="server" Text="Lưu thông tin" CssClass ="btn btn-default" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

