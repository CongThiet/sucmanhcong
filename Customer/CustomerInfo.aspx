<%@ Page Title="THÔNG TIN" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerInfo.aspx.cs" Inherits="Customer_CustomerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="width: 100%; display: table; margin-top:10px;">
        <div style="width: 40%; display: table; float: left;">
            <div style="width: 100%; display: table; float: right;">
                <H4>THÔNG TIN THÀNH VIÊN</H4>
            </div>

            <div style="width: 100%; display: table; float: right;">
                    <asp:Label ID="lblAvatar" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 100%; display: table; float: right; margin-top:20px;">
                <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 100%; display: table; float: right;">
                <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 100%; display: table; float: right;">
                <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 100%; display: table; float: right;">
                <asp:Label ID="lblBirthday" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 100%; display: table; float: right;">
                <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 100%; display: table; float: right;">
                <asp:Label ID="lblIdCard" runat="server" Text=""></asp:Label>
            </div>
        </div>

        <div style="width: 60%; display: table; float: right;">
            <div style="width: 20%; display: table; float: left;">
                &nbsp;
            </div>
            <div style="width: 80%; display: table; float: right;">
                <H4>THÔNG TIN TÀI KHOẢN THÀNH VIÊN</H4>
                 <button type="button" class="btn btn-info">Mã số thẻ cá nhân  <span class="badge"><asp:Label ID="txtAccount" runat="server" ReadOnly="true" Style="height: 22px; line-height: 22px; width: 120px; font-family: Arial; font-size: 14px; font-weight: bold; text-transform: uppercase;"></asp:Label></span></button>
                <br />
                <br />
                <button type="button" class="btn btn-info">Hạn mức chiết khấu  <span class="badge"><asp:Label ID="txtDiscountCard" runat="server" ReadOnly="true" Style="height: 22px; line-height: 22px; width: 120px; font-family: Arial; font-size: 14px; font-weight: bold; text-transform: uppercase;"></asp:Label></span></button>
                <br />
                <br />
                <button type="button" class="btn btn-info">Số lần đã giao dịch  <span class="badge"><% Response.Write(this.SoGiaoDich.ToString()); %></span></button>
                <br />
                <br />
                <button type="button" class="btn btn-info">Doanh số đã giao dịch  <span class="badge"><% Response.Write(this.TongDoanhSo.ToString()); %></span></button>
            </div>
        </div>
    </div>
</asp:Content>

