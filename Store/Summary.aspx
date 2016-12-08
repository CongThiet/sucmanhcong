<%@ Page Title="THỐNG KÊ" Language="C#" MasterPageFile="~/Store.master" AutoEventWireup="true" CodeFile="Summary.aspx.cs" Inherits="Store_Summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" style = "width:100%;">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><b>THÔNG TIN TÍCH LUỸ</b></h3>
                        </div>
                         <ul class="list-group">
                            <li class="list-group-item">Doanh số trong ngày :
                                <asp:Label ID="lblDSInDay" runat="server" Text="0" ForeColor="Black"></asp:Label></li>
                            <li class="list-group-item">Doanh số trong tuần :
                                <asp:Label ID="lblDSInWeek" runat="server" Text="0" ForeColor="Black"></asp:Label></li>
                              <li class="list-group-item">Doanh số trong tháng :
                                <asp:Label ID="lblDSInMonth" runat="server" Text="0" ForeColor="Black"></asp:Label></li>
                             <li class="list-group-item">Tổng chiết khấu khách hàng :
                                <asp:Label ID="lblTotalDiscount" runat="server" Text="0" ForeColor="Black"></asp:Label></li>
                             <li class="list-group-item">Tổng chiết khấu tích luỷ thẻ :
                                <asp:Label ID="lblTotalDiscountCard" runat="server" Text="0" ForeColor="Black"></asp:Label></li>
                             <li class="list-group-item">Tổng chiết khấu cho quảng cáo :
                                <asp:Label ID="lblTotalDiscountAdv" runat="server" Text="0" ForeColor="Black"></asp:Label></li>
                            <li class="list-group-item">Doanh số cân đối :
                                <asp:Label ID="lblDSPayment" runat="server" Text="0" ForeColor="Black"></asp:Label></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

