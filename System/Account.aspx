<%@ Page Title="QUẢN TRỊ NỘI DUNG" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="title_post_from">
        <div style="float: left; width: 12%;">&nbsp;&nbsp;Tài khoản</div>
        <div style="float: right; width: 87.5%;">

            
            <div style="float: right; width: 25%; text-align: right;">
                <asp:Button ID="btn_edit" runat="server" Text="Sửa" class="btn_post_from" Style="margin-right: 6px;" OnClick="btnedit_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Thoát" class="btn_post_from" Style="margin-right: 6px;" OnClick="btnCancel_Click" />
            </div>
            <div style="float: right; text-align: right;">
                <asp:CheckBox ID="chkStatus" Text="  Trạng thái" runat="server" Enabled="false" />
            </div>
        </div>
    </div>

    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;Tài khoản :
        </div>
        <div class="main_post_from">
            <output id="txtUserName" runat="server" class="input_post_from" />
        </div>
    </div>
    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;Mật khẩu :
        </div>
        <div class="main_post_from">
            <asp:Button ID="btn_changpass" runat="server" Text="Đổi mật khẩu"  Style="margin-right: 6px;" OnClick="btn_ChangPass" />
        </div>
    </div>
    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;Tên đầy đủ :
        </div>
        <div class="main_post_from">
            <output id="txtFullName" runat="server" class="input_post_from" />
        </div>
    </div>
    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;Ugroup :
        </div>
        <div class="main_post_from">
            <output id="txtUgroup" runat="server" class="input_post_from" />
        </div>
    </div>
    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;Email :
        </div>
        <div class="main_post_from">
            <output id="txtEmail" runat="server" class="input_post_from" />
        </div>
    </div>
    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;DeptId :
        </div>
        <div class="main_post_from">
            <output id="txtDeptId" runat="server" class="input_post_from" />
        </div>
    </div>
    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;Địa chỉ :
        </div>
        <div class="main_post_from">
            <output id="txtAddress" runat="server" class="input_post_from" />
        </div>
    </div>
    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;Điện thoại :
        </div>
        <div class="main_post_from">
            <output id="txtPhone" runat="server" class="input_post_from" />
        </div>
    </div>
    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;Chức vụ :
        </div>
        <div class="main_post_from">
            <output id="txtRole" runat="server" class="input_post_from" />
        </div>
    </div>
    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;Departments :
        </div>
        <div class="main_post_from">
            <output id="txtDepartments" runat="server" class="input_post_from" />
        </div>
    </div>
    <div class="line_post_from">
        <div class="label_post_from">
            &nbsp;&nbsp;Home Page :
        </div>
        <div class="main_post_from">
            <output id="txtHomePage" runat="server" class="input_post_from" />
        </div>
    </div>
</asp:Content>
