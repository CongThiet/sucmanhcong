<%@ Page Title="CẬP NHẬT SẢN PHẨM" Language="C#" MasterPageFile="~/Store.master" AutoEventWireup="true" CodeFile="ProductEdit.aspx.cs" Inherits="Store_ProductEdit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <p id="outtext" runat="server"></p>
    <div class="container" style ="width:100%; margin:0px; padding:0px;">
        <div class="row">
            <div class="col-md-12" style ="background-color:#f4f9fe; padding-top:12px; padding-bottom:12px;">
                <b>CẬP NHẬT THÔNG TIN SẢN PHẨM</b>
            </div>
        </div>
        <div class="row" style ="padding:10px; padding-left:0px;">
            <div class="col-md-2">
                <asp:DropDownList ID="ddlProductGroup" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-md-6">
                <asp:DropDownList ID="ddlPartner" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlBrand" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>

        <div class="row" style ="padding:10px; padding-left:0px;">
            <div class="col-md-8">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12" style ="padding:0px; padding-left:0px;">
                <CKEditor:CKEditorControl ID="txtContent" CssClass="editor1" runat="server" Height="305" Width="99%" BasePath="~/ckeditor"></CKEditor:CKEditorControl>
            </div>
        </div>

        <div class="row" style ="padding:10px; padding-left:0px;">
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
                <asp:CheckBox ID="ckbVIP" Text="&nbsp;&nbsp;Bán chạy VIP" runat="server" />
                <br />
                <asp:CheckBox ID="ckbBestSale" Text="&nbsp;&nbsp;Bán chạy %" runat="server" />
                <br />
                <asp:CheckBox ID="ckbState" Text="&nbsp;&nbsp;Trạng thái" runat="server" Enabled="false" />
            </div>
        </div>
    </div>
</asp:Content>

