<%@ Page Title="CẬP NHẬT HỒ SƠ" Language="C#" MasterPageFile="~/Store.master" AutoEventWireup="true" CodeFile="PartnerEdit.aspx.cs" Inherits="Store_PartnerEdit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" style="width: 100%; margin: 0px;">
        <div class="row">
            <div class="col-md-12" style="background-color: #f4f9fe; padding-top: 12px; padding-bottom: 12px;">
                <b>CẬP NHẬT HỒ SƠ</b>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 pd8l0">
                Tên cửa hàng
            </div>
            <div class="col-md-4 pdl0">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-2 pd8l0">
                Địa chỉ
            </div>
            <div class="col-md-4 pdl0">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row" style ="margin-top:10px;">
            <div class="col-md-2 pd8l0">
                Điện thoại
            </div>
            <div class="col-md-4 pdl0">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-2 pd8l0">
                Người quản lý
            </div>
            <div class="col-md-4 pdl0">
                <asp:TextBox ID="txtManager" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row" style ="margin-top:10px;">
            <div class="col-md-2 pd8l0">
                Mã số thuế
            </div>
            <div class="col-md-4 pdl0">
                <asp:TextBox ID="txtTaxCode" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-2 pd8l0">
                Ngành nghề kinh doanh
            </div>
            <div class="col-md-4 pdl0">
                <asp:DropDownList ID="ddlBusiness" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>

        <div class="row" style ="margin-top:10px;">
            <div class="col-md-2 pd8l0">
                Tài khoản
            </div>
            <div class="col-md-4 pdl0">
                <asp:TextBox ID="txtBankAccount" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-2 pd8l0">
                 Ngân hàng
            </div>
            <div class="col-md-4 pdl0">
                <asp:TextBox ID="txtBankAccountName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row" style ="margin-top:10px;">
            <div class="col-md-12 pdl0">
                <CKEditor:CKEditorControl ID="txtContent" CssClass="editor1" runat="server" Height="305" Width="100%" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
            </div>
        </div>

        <div class="row" style ="padding:10px;">
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
    </div>
</asp:Content>

