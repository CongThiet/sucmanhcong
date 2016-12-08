<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerInfo.aspx.cs" Inherits="System_CustomerInfo" %>

<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; height: 32px; line-height: 30px; background-color: #dde8ec; font-family: Arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
        <div style="float: left;">&nbsp;&nbsp;THÔNG TIN THẺ KHÁCH HÀNG</div>
        <div style="float: right;">&nbsp;</div>
    </div>
    <div style="width: 100%; display: table;">
        <div style="width: 40%; display: table; float: left;">
            <div style="width: 100%; display: table; float: left;">
                <b>THÔNG TIN CÁ NHÂN</b>
            </div>

            <div style="width: 100%; display: table; float: left;">
                <asp:Label ID="lblAvatar" runat="server" Text=""></asp:Label>
            </div>

            <div style="width: 100%;">
                <div style="width: 100%; display: table; float: right;">
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div style="width: 100%;">
                <div style="width: 5%; display: table; float: left;">
                    -:-
                </div>
                <div style="width: 95%; display: table; float: right;">
                    <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div style="width: 100%;">
                <div style="width: 5%; display: table; float: left;">
                    -:-
                </div>
                <div style="width: 95%; display: table; float: right;">
                    <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div style="width: 100%;">
                <div style="width: 5%; display: table; float: left;">
                    -:-
                </div>
                <div style="width: 95%; display: table; float: right;">
                    <asp:Label ID="lblBirthday" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div style="width: 100%;">
                <div style="width: 5%; display: table; float: left;">
                    -:-
                </div>
                <div style="width: 95%; display: table; float: right;">
                    <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div style="width: 100%;">
                <div style="width: 5%; display: table; float: left;">
                    -:-
                </div>
                <div style="width: 95%; display: table; float: right;">
                    <asp:Label ID="lblIdCard" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>

        <div style="width: 60%; display: table; float: right;">
            <div style="width: 20%; display: table; float: left;">
                &nbsp;
            </div>
            <div style="width: 80%; display: table; float: right;">
                <b>THÔNG TIN TÀI KHOẢN THẺ</b>
            </div>
            <div style="width: 20%; display: table; float: left;">
                Loại thẻ:
            </div>
            <div style="width: 80%; display: table; float: right;">
                <asp:DropDownList ID="ddlTypeCard" runat="server" Style="width: 120px; height: 24px; line-height: 24px;">
                    <asp:ListItem Value="CustomerAccount" Selected="True">Thẻ Đồng</asp:ListItem>
                    <asp:ListItem Value="CustomerAccount1">Thẻ Bạc</asp:ListItem>
                    <asp:ListItem Value="CustomerAccount2">Thẻ Vàng</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div style="width: 20%; display: table; float: left;">
                Tài khoản thẻ:
            </div>
            <div style="width: 80%; display: table; float: right;">
                <asp:TextBox ID="txtAccount" runat="server" Style="height: 22px; line-height: 22px; width: 120px; font-family: Arial; font-size: 14px; font-weight: bold; text-transform: uppercase; border: solid 1px Aqua;"></asp:TextBox>
            </div>

            <div style="width: 20%; display: table; float: left;">
                Số lần giao dịch:
            </div>
            <div style="width: 80%; display: table; float: right;">
                <% Response.Write(this.SoGiaoDich.ToString()); %>
            </div>

            <div style="width: 20%; display: table; float: left;">
                Doanh số:
            </div>
            <div style="width: 80%; display: table; float: right;">
                <% Response.Write(this.TongDoanhSo.ToString()); %>
            </div>
            <br />
            <div style="width: 100%; height: 30px; line-height: 30px; display: table; margin-top: 20px; float: right;">
                <asp:Button ID="btnCreate" runat="server" Style="height: 28px; line-height: 22px; width: 130px;" Text="Khởi tạo số hiệu thẻ" OnClick="btnCreate_Click" />
                <asp:Button ID="btnProduct" runat="server" Style="height: 28px; line-height: 22px; width: 115px;" Text="Chi tiết giao dịch" />
            </div>
        </div>
    </div>

</asp:Content>

