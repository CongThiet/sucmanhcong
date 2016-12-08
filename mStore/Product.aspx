<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="mStore_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style ="width:100%; height:30px;">
        <div style="text-align: center; float:left; width:5%; height:30px; line-height:22px; font-weight:bold;" class ="tvsRowHeader">TT</div>
        <div style="text-align: justify; float:left; width:87%;height:30px; line-height:22px; font-weight:bold;" class ="tvsRowHeader">HÀNG HÓA, DỊCH VỤ</div>
        <div style="text-align: center; float:right; width:8%;height:30px; line-height:22px; font-weight:bold;" class ="tvsRowHeader"></div>
    </div>
    <% Response.Write(this.strHtml); %>
</asp:Content>

