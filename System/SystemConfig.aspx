<%@ Page Title="QUẢN TRỊ NỘI DUNG" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SystemConfig.aspx.cs" Inherits="SystemConfig" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; height: 32px; line-height: 30px; background-color: #dde8ec; font-family: Arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
        <div style="float: left; width: 12%;">&nbsp;&nbsp;CẤU HÌNH</div>
        <div style="float: right; width: 88%;">

            <div style="float: left; width: 30%;">
                &nbsp;
            </div>
            <div style="float: left; width: 35%; text-align:right;">
                &nbsp;
            </div>
            <div style="float: right; width: 35%; text-align: right;">
                <asp:Button ID="btnSave" runat="server" Text="Ghi nhận" Style="height: 28px; width: 75px; padding-bottom: 4px; font-weight: bold; margin-right: -2px;" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Thoát" Style="height: 28px; width: 75px; padding-bottom: 4px; font-weight: bold; margin-right: 6px;" OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 15%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            KH thẻ đối tác :
        </div>
        <div style="width: 85%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtPartnerAccount" runat="server" Style="height: 22px; line-height: 22px; width: 100%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 15%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            KH thẻ khách hàng - Đồng :
        </div>
        <div style="width: 85%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtCustomerAccount" runat="server" Style="height: 22px; line-height: 22px; width: 100%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 15%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            KH thẻ khách hàng - Bạc :
        </div>
        <div style="width: 85%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtCustomerAccount1" runat="server" Style="height: 22px; line-height: 22px; width: 100%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 15%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            KH thẻ khách hàng - Vàng :
        </div>
        <div style="width: 85%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtCustomerAccount2" runat="server" Style="height: 22px; line-height: 22px; width: 100%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 15%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            KH thẻ thành viên :
        </div>
        <div style="width: 85%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtMemberAccount" runat="server" Style="height: 22px; line-height: 22px; width: 100%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 15%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            Giảm giá đối tác :
        </div>
        <div style="width: 85%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtPartnerDiscount" runat="server" Style="height: 22px; line-height: 22px; width: 100%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

     <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 15%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            Giảm giá thành viên :
        </div>
        <div style="width: 85%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtCustomerDiscount" runat="server" Style="height: 22px; line-height: 22px; width: 100%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>
        
    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 15%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;
        </div>
        <div style="width: 85%; height: 30px; line-height: 30px; float: right;">
            <asp:Label ID="lblMsg" runat="server" Style="height: 22px; line-height: 22px; width: 100%; font-size: 13px; font-family: Arial; color:red"></asp:Label>
        </div>
    </div>
</asp:Content>
