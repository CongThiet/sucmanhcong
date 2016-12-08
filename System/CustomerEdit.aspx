<%@ Page Title="QUẢN TRỊ NỘI DUNG" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustomerEdit.aspx.cs" Inherits="CustomerEdit" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; height: 32px; line-height: 30px; background-color: #dde8ec; font-family: Arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
        <div style="float: left; width: 12%;">&nbsp;&nbsp;Thêm thành viên</div>
        <div style="float: right; width: 87.5%;">

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
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Họ tên :
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtName" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Địa chỉ :
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtAddress" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12.5%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Điện thoại :
        </div>
        <div style="width: 13%; height: 30px; line-height: 30px; float: left;">
            <asp:TextBox ID="txtPhone" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; text-align: justify;"></asp:TextBox>
        </div>

        <div style="width: 7%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;Ngày sinh :
        </div>
        <div style="width: 10%; height: 30px; line-height: 30px; float: left;">
            <asp:TextBox ID="txtBirthday" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; text-align: justify;"></asp:TextBox>
        </div>
        <div style="width: 8%; height: 30px; line-height: 30px; float: left; padding-left:5px;">
            dd/MM/yyyy
        </div>
        <div style="width: 5%; height: 30px; line-height: 30px; float: left; padding-left:20px;">
            Email :
        </div>
        <div style="width: 25%; height: 30px; line-height: 30px; float: left;">
            <asp:TextBox ID="txtEmail" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; text-align: justify;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Số CMND :
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtIdCard" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;Mã số thẻ :
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:TextBox ID="txtAccount" runat="server" ReadOnly = "true" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial;"></asp:TextBox>
        </div>
    </div>

    <div style="width: 100%; height: 150px; line-height: 150px; margin-top: 5px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;
            Ảnh đại diện :
            <br />
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:Label ID="lblImg1" Text="Ảnh minh hoạ" CssClass="MQTT_Normal_Text" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="txtAvatar" runat="server" Width="10px" Visible="false"></asp:TextBox>
            <label class="file-upload" style ="margin-top:-12px;">
                <span><strong>Upload Image</strong></span>
            <asp:FileUpload ID="upImage1" runat="server" Width="100px" CssClass="FileUploadImage" Height="22px" />
                </label>
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

    <div style="width: 100%; height: 30px; line-height: 30px;">
        <div style="width: 12%; height: 30px; line-height: 30px; float: left; font-size: 13px; font-family: Arial;">
            &nbsp;&nbsp;
        </div>
        <div style="width: 87.5%; height: 30px; line-height: 30px; float: right;">
            <asp:Label ID="lblMsg" runat="server" Style="height: 22px; line-height: 22px; width: 99%; font-size: 13px; font-family: Arial; color:red"></asp:Label>
        </div>
    </div>

</asp:Content>
