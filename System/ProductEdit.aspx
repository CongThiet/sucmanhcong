<%@ Page Title="QUẢN TRỊ NỘI DUNG" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductEdit.aspx.cs" Inherits="ProductEdit" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; height: 32px; line-height: 30px; background-color: #dde8ec; font-family: Arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
        <div style="float: left; width: 12%;">&nbsp;&nbsp;Thêm sản phẩm</div>
        <div style="float: right; width: 87.5%;">

            <div style="float: left; width: 30%;">
                <asp:DropDownList ID="ddlProductGroup" runat="server" Style="width: 100%; height: 26px; line-height: 26px; margin-top: 3px;"></asp:DropDownList>
            </div>
            <div style="float: left; width: 35%; text-align:right;">
                <asp:DropDownList ID="ddlPartner" runat="server" Style="width: 99%; height: 26px; line-height: 26px; margin-top: 3px;"></asp:DropDownList>
            </div>
            <div style="float: right; width: 35%; text-align: right;">
                <asp:Button ID="btnSave" runat="server" Text="Ghi nhận" Style="height: 28px; width: 75px; padding-bottom: 4px; font-weight: bold; margin-right: -2px;" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Thoát" Style="height: 28px; width: 75px; padding-bottom: 4px; font-weight: bold; margin-right: 6px;" OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Sản phẩm :
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtName" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12.5%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Giá bán :
        </div>
        <div style="width: 10%; height: 30px; line-height: 30px; float: left;">
            <asp:TextBox ID="txtPrice" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; text-align: justify;"></asp:TextBox>
        </div>

        <div style="width: 10%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Giảm giá (%) :
        </div>
        <div style="width: 10%; height: 30px; line-height: 30px; float: left;">
            <asp:TextBox ID="txtDiscount" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; text-align: justify;"></asp:TextBox>
        </div>

        <div style="width: 10%; height: 30px; line-height: 30px; float: left; padding-left:20px;">
            <asp:CheckBox ID="ckbBestSale" Text="  Bán chạy %" runat="server" />
        </div>

        <div style="width: 10%; height: 30px; line-height: 30px; float: left;">
            <asp:CheckBox ID="ckbVIP" Text="  Bán chạy VIP" runat="server" />
        </div>
    </div>

    <div style="width: 100%; height: 450px; line-height: 450px; margin-top: 5px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Nội dung:
            <br />
            <br />
            Ảnh đại diện (253x252)
            <br />
            <asp:Label ID="lblImg1" Text="Ảnh minh hoạ" CssClass="MQTT_Normal_Text" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="txtImage" runat="server" Width="10px" Visible="false"></asp:TextBox>
            <label class="file-upload" style ="margin-top:-12px;">
                <span><strong>Upload Image</strong></span>
            <asp:FileUpload ID="upImage1" runat="server" Width="100px" CssClass="FileUploadImage" Height="22px" />
                </label>
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <CKEditor:CKEditorControl ID="txtContent" CssClass="editor1" runat="server" Height="305" Width="99%" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
        </div>
    </div>
    <div style="width: 100%; height: 35px; line-height: 35px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right; font-family: Arial; font-size: 12px;">
            <asp:CheckBox ID="ckbState" Text="  Trạng thái" runat="server" />
        </div>
    </div>
</asp:Content>
