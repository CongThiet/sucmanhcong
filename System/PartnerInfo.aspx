<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PartnerInfo.aspx.cs" Inherits="System_PartnerInfo" %>

<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; height: 32px; line-height: 30px; background-color: #dde8ec; font-family: Arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
        <div style="float: left;">&nbsp;&nbsp;THÔNG TIN TÀI KHOẢN CỬA HÀNG</div>
        <div style="float: right;">&nbsp;</div>
    </div>
    <div style="width: 100%; display: table;">
        <div style="width: 40%; display: table; float: left;">
            <div style="width: 100%; display: table; float: right;">
                <b>THÔNG TIN CỬA HÀNG</b>
            </div>

            <div style="width: 100%; display: table; float: right;">
                <asp:Label ID="lblImg1" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 100%; display: table; float: right;">
                <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 5%; display: table; float: left;">
                -:-
            </div>
            <div style="width: 95%; display: table; float: right;">
                <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 5%; display: table; float: left;">
                -:-
            </div>
            <div style="width: 95%; display: table; float: right;">
                <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 5%; display: table; float: left;">
                -:-
            </div>
            <div style="width: 95%; display: table; float: right;">
                <asp:Label ID="lblManager" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 5%; display: table; float: left;">
                -:-
            </div>
            <div style="width: 95%; display: table; float: right;">
                <asp:Label ID="lblTaxCode" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 5%; display: table; float: left;">
                -:-
            </div>
            <div style="width: 95%; display: table; float: right;">
                <asp:CheckBox ID="ckbBestSale" Text="  Bán chạy %" runat="server" />
            </div>

            <div style="width: 5%; display: table; float: left;">
                -:-
            </div>
            <div style="width: 95%; display: table; float: right;">
                <asp:CheckBox ID="ckbVIP" Text="  Bán chạy VIP" runat="server" />
            </div>

            <div style="width: 5%; display: table; float: left;">
                -:-
            </div>
            <div style="width: 95%; display: table; float: right;">
                <asp:CheckBox ID="ckbState" Text="  Trạng thái" runat="server" />
            </div>
        </div>

        <div style="width: 60%; display: table; float: right;">
            <div style="width: 22%; display: table; float: left;">
                &nbsp;
            </div>
            <div style="width: 78%; display: table; float: right;">
                <b>THÔNG TIN TÀI KHOẢN GIAN HÀNG</b>
            </div>
            <div style="width: 22%; display: table; float: left;">
                Tài khoản cửa hàng:
            </div>
            <div style="width: 78%; display: table; float: right;">
                <asp:TextBox ID="txtAccount" runat="server" ReadOnly="true" Style="height: 22px; line-height: 22px; width: 100px; font-family: Arial; font-size: 14px; font-weight: bold; text-transform: uppercase; border: solid 1px Aqua;"></asp:TextBox>

            </div>

            <div style="width: 22%; display: table; float: left;">
                Tổng mức chiết khấu:
            </div>
            <div style="width: 78%; display: table; float: right;">
                <asp:TextBox ID="txtDiscountTotal" runat="server" Style="height: 22px; line-height: 22px; width: 100px; font-family: Arial; font-size: 14px; font-weight: bold; text-transform: uppercase; border: solid 1px Aqua;"></asp:TextBox>

            </div>

            <div style="width: 22%; display: table; float: left;">
                Chiết khấu trực tiếp:
            </div>
            <div style="width: 78%; display: table; float: right;">
                <asp:TextBox ID="txtDiscount" runat="server" Style="height: 22px; line-height: 22px; width: 100px; font-family: Arial; font-size: 14px; font-weight: bold; text-transform: uppercase; border: solid 1px Aqua;"></asp:TextBox>
            </div>

            <div style="width: 22%; display: table; float: left;">
                Chiết khấu tích lũy:
            </div>
            <div style="width: 78%; display: table; float: right;">
                <asp:TextBox ID="txtDiscountCard" runat="server" Style="height: 22px; line-height: 22px; width: 100px; font-family: Arial; font-size: 14px; font-weight: bold; text-transform: uppercase; border: solid 1px Aqua;"></asp:TextBox>
            </div>

            <div style="width: 22%; display: table; float: left;">
                Chiết khấu quảng cáo:
            </div>
            <div style="width: 78%; display: table; float: right;">
                <asp:TextBox ID="txtDiscountAdv" runat="server" Style="height: 22px; line-height: 22px; width: 100px; font-family: Arial; font-size: 14px; font-weight: bold; text-transform: uppercase; border: solid 1px Aqua;"></asp:TextBox>
            </div>

            <div style="width: 22%; display: table; float: left;">
                Số sản phẩm:
            </div>
            <div style="width: 78%; display: table; float: right;">
                <% Response.Write(this.SoSanPham.ToString()); %>
            </div>

            <div style="width: 22%; display: table; float: left;">
                Sản phẩm VIP:
            </div>
            <div style="width: 78%; display: table; float: right;">
                <% Response.Write(this.SoSanPhamVIP.ToString()); %>
            </div>

            <div style="width: 22%; display: table; float: left;">
                Sản phẩm bán chạy:
            </div>
            <div style="width: 78%; display: table; float: right;">
                <% Response.Write(this.SoSanPhamBanChay.ToString()); %>
            </div>

            <div style="width: 22%; display: table; float: left;">
                Số lần giao dịch:
            </div>
            <div style="width: 78%; display: table; float: right;">
                <% Response.Write(this.SoGiaoDich.ToString()); %>
            </div>

            <div style="width: 22%; display: table; float: left;">
                Doanh số:
            </div>
            <div style="width: 78%; display: table; float: right;">
                <% Response.Write(this.TongDoanhSo.ToString()); %>
            </div>

            <div style="width: 100%; display: table; float: right;">
                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text=""></asp:Label>
            </div>
            <br />
            <br />
            <div style="width: 100%; height: 30px; line-height: 30px; display: table; float: right; margin-top:30px;">
                <asp:Button ID="btnCreate" runat="server" Style="height: 28px; line-height: 22px; width: 150px;" Text="Khởi tạo mã cửa hàng" OnClick="btnCreate_Click" />
                <asp:Button ID="btnUpdate" runat="server" Style="height: 28px; line-height: 22px; width: 140px;" Text="Cập nhật chiết khấu" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnProduct" runat="server" Style="height: 28px; line-height: 22px; width: 115px;" Text="Chi tiết giao dịch" />
            </div>

        </div>
    </div>
</asp:Content>

