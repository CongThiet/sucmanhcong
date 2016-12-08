<%@ Page Title="DOANH SỐ" Language="C#" MasterPageFile="~/Customer.master" AutoEventWireup="true" CodeFile="CustomerBill.aspx.cs" Inherits="Customer_CustomerBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-3">
                <div style="width: 100%; color: #fff;" class="TVS-Col-md20">
                    <a href="#"><B>DOANH SỐ GIAO DỊCH</B></a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2">
                    <a href="#">+ Doanh số trong ngày: <% Response.Write(this.strDSInDay); %></a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2">
                    <a href="#">+ Doanh số trong tuần: <% Response.Write(this.strDSInWeek); %></a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2">
                    <a href="#">+ Doanh số trong tháng: <% Response.Write(this.strDSInMonth); %></a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2">
                    <a href="#">+ Tổng doanh số: <% Response.Write(this.strDSTotal); %></a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2">
                    <a href="#">+ Doanh số đã cân đối</a>
                </div>
                <div style="width: 100%; color: #fff;" class="TVS-Col-md2">
                    <a href="#">+ Tích luỹ thẻ: <% Response.Write(this.strDSCard); %></a>
                </div>
            </div>
            <div class="col-md-9">
                <div style="width: 100%; margin-top:0px;">
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
                    <div style="width: 10%; float: left; border: solid 1px #f3f1f1; border-left: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
                        Thanh toán
                    </div>
                    <div style="width: 32%; float: left; border: solid 1px #f3f1f1; border-left: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
                        Ghi chú
                    </div>
                    <div style="width: 5%; float: right; border: solid 1px #f3f1f1; border-left: none; text-align: center; font-weight: bold; height: 30px; line-height: 30px; color: #000;">
                        -:-
                    </div>
                </div>
                <% Response.Write(this.strHtml); %>
            </div>
        </div>
    </div>
</asp:Content>

