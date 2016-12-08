<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="mStore_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><b>THÔNG TIN CỬA HÀNG</b></div>
        <!-- List group -->
        <ul class="list-group">
            <li class="list-group-item">Tên cửa hàng: <% Response.Write(strName); %></li>
            <li class="list-group-item">Địa chỉ: <% Response.Write(strAddress); %></li>
            <li class="list-group-item">Điện thoại: <% Response.Write(strPhone); %></li>
            <li class="list-group-item">Địa chỉ email: <% Response.Write(strEmail); %></li>
            <li class="list-group-item">Mã số thuế: <% Response.Write(strTaxcode); %></li>
            <li class="list-group-item">Tài khoản cửa hàng: <% Response.Write(strAccount); %></li>
            <li class="list-group-item">Số tài khoản: <% Response.Write(strBankAccount); %></li>
            <li class="list-group-item">Ngân hàng: <% Response.Write(strBankAccountName); %></li>
        </ul>
    </div>
</asp:Content>

