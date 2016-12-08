<%@ Page Title="QUẢN TRỊ NỘI DUNG" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Abouts.aspx.cs" Inherits="Abouts" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; height: 32px; line-height: 30px; background-color: #dde8ec; font-family: Arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
        <div style="float: left; width: 12%;">&nbsp;&nbsp;THÔNG TIN</div>
        <div style="float: right; width: 87.5%;">

            <div style="float: left; width: 30%;">
                &nbsp;
            </div>
            <div style="float: right; width: 70%; text-align: right;">
                <asp:Button ID="btnSave" runat="server" Text="Ghi nhận" Style="height: 28px; width: 75px; padding-bottom: 4px; font-weight: bold; margin-right: -2px;" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Thoát" Style="height: 28px; width: 75px; padding-bottom: 4px; font-weight: bold; margin-right: 6px;" OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
    <div style="width: 100%; height: 35px; line-height: 35px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Đơn vị :
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtName" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Địa chỉ:
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtAddress" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; text-align: justify;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Điện thoại:
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtPhone" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; text-align: justify;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Email:
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtEmail" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; text-align: justify;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 450px; line-height: 450px; margin-top:5px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Nội dung:
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <CKEditor:CKEditorControl ID="txtIntro" CssClass="editor1" runat="server" Height="305" Width="99%" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
        </div>
    </div>
</asp:Content>
