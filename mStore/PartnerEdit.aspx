<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="PartnerEdit.aspx.cs" Inherits="mStore_PartnerEdit" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="background-color: #f4f9fe; padding-top: 5px; padding-bottom: 5px; padding-left: 10px; width: 100%;">
        <b>CẬP NHẬT HỒ SƠ</b>
    </div>

    <div style="width: 100%; padding-top: 8px; padding-bottom: 8px;">
        <div style="padding: 8px; padding-left: 0px; width: 15%; float: left; text-align: right;">
            Tên cửa hàng : 
        </div>
        <div style="padding: 0px; padding-left: 0px; width: 35%; float: left;">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div style="padding: 8px; padding-left: 0px; width: 15%; float: left; text-align: right;">
            Địa chỉ :
        </div>
        <div style="padding: 0px; padding-left: 0px; width: 35%; float: right;">
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <br />
    <br />
    <div style="width: 100%; padding-top: 8px; padding-bottom: 8px;">
        <div style="padding: 8px; padding-left: 0px; width: 15%; float: left; text-align: right;">
            Điện thoại : 
        </div>
        <div style="padding: 0px; padding-left: 0px; width: 35%; float: left;">
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div style="padding: 8px; padding-left: 0px; width: 15%; float: left; text-align: right;">
            Người quản lý :
        </div>
        <div style="padding: 0px; padding-left: 0px; width: 35%; float: right;">
            <asp:TextBox ID="txtManager" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <br />
    <br />
    <div style="width: 100%; padding-top: 8px; padding-bottom: 8px;">
        <div style="padding: 8px; padding-left: 0px; width: 15%; float: left; text-align: right;">
            Mã số thuế : 
        </div>
        <div style="padding: 0px; padding-left: 0px; width: 35%; float: left;">
            <asp:TextBox ID="txtTaxCode" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div style="padding: 8px; padding-left: 0px; width: 15%; float: left; text-align: right;">
            Ngành nghề kinh doanh :
        </div>
        <div style="padding: 0px; padding-left: 0px; width: 35%; float: right;">
            <asp:DropDownList ID="ddlBusiness" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
    </div>
    <br />
    <br />
    <div style="width: 100%; padding-top: 8px; padding-bottom: 8px;">
        <div style="padding: 8px; padding-left: 0px; width: 15%; float: left; text-align: right;">
            Tài khoản : 
        </div>
        <div style="padding: 0px; padding-left: 0px; width: 35%; float: left;">
            <asp:TextBox ID="txtBankAccount" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div style="padding: 8px; padding-left: 0px; width: 15%; float: left; text-align: right;">
            Ngân hàng :
        </div>
        <div style="padding: 0px; padding-left: 0px; width: 35%; float: right;">
            <asp:TextBox ID="txtBankAccountName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <br />
    <br />
    <div style="width: 100%; padding-top: 8px; padding-bottom: 8px;">
        <CKEditor:CKEditorControl ID="txtContent" CssClass="editor1" runat="server" Height="305" Width="100%" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
    </div>
     <br />
    <br />
    <div style="width: 100%; padding-top: 8px; padding-bottom: 8px;">
            <div class="col-md-2">
                <asp:Button ID="btnSave" runat="server" Text="Ghi nhận" CssClass="btn btn-danger" OnClick="btnSave_Click" />
            </div>
            <div class="col-md-2">
                 <br />
                Ảnh đại diện (253x252)
            <br />
                <asp:Label ID="lblImg1" Text="Ảnh minh hoạ" Style ="height:100px;" runat="server"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="txtImage" runat="server" Width="10px" Visible="false"></asp:TextBox>
                <label class="file-upload" style="margin-top: -12px;">
                    <span><strong>Upload Image</strong></span>
                    <asp:FileUpload ID="upImage1" runat="server" Width="100px" CssClass="FileUploadImage" Height="22px" />
                </label>
            </div>
            <div class="col-md-2">
                <asp:CheckBox ID="ckbVIP" Text="&nbsp;&nbsp;Bán chạy VIP" runat="server" Enabled="False" />
                <br />
                <asp:CheckBox ID="ckbBestSale" Text="&nbsp;&nbsp;Bán chạy %" runat="server" Enabled="False" />
                <br />
                <asp:CheckBox ID="ckbState" Text="&nbsp;&nbsp;Trạng thái" runat="server" Enabled="False" />
            </div>
        </div>

</asp:Content>

