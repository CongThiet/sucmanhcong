<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="mStore_History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; margin-top: 0px;">
        <div style="width: 5%; float: left; border: solid 1px #f3f1f1; border-right: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
            TT   
        </div>
        <div style="width: 18%; float: left; border: solid 1px #f3f1f1; font-weight: bold; padding-left: 6px; height: 30px; line-height: 30px; color: #000; text-align: center;">
            Ngày, giờ giao dịch
        </div>
        <div style="width: 10%; float: left; border: solid 1px #f3f1f1; font-weight: bold; border-left: none; text-align: center; height: 30px; line-height: 30px; color: #000;">
            Tổng tiền
        </div>
        <div style="width: 10%; float: left; border: solid 1px #f3f1f1; border-left: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
            Tiền CK
        </div>
        <div style="width: 5%; float: left; border: solid 1px #f3f1f1; border-left: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
            CK(%)
        </div>
        <div style="width: 5%; float: left; border: solid 1px #f3f1f1; border-left: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
            TL(%)
        </div>
        <div style="width: 5%; float: left; border: solid 1px #f3f1f1; border-left: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
            QC(%)
        </div>
        <div style="width: 10%; float: left; border: solid 1px #f3f1f1; border-left: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
            Thanh toán
        </div>
        <div style="width: 27%; float: left; border: solid 1px #f3f1f1; border-left: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
            Ghi chú
        </div>
        <div style="width: 5%; float: left; border: solid 1px #f3f1f1; border-left: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
            &nbsp;
        </div>
    </div>
    <% Response.Write(this.strHtml); %>
</asp:Content>

