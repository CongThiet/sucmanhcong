<%@ Page Title="XEM LẠI HOÁ ĐƠN" Language="C#" MasterPageFile="~/Store.master" AutoEventWireup="true" CodeFile="ViewBill.aspx.cs" Inherits="Store_ViewBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" style="width: 100%;">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="form-group">
                            <div class="col-sm-12" style="padding-left: 0px; padding-right: 0px; font-weight: bold;">
                                THÔNG TIN KHÁCH HÀNG
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">KHÁCH HÀNG: <% Response.Write(this.strCusName.ToUpper());%></h4>
                                </div>
                                <div class="modal-body">
                                    <div style="width: 100%; height: 200px;">
                                        <div style="width: 35%; float: left;">
                                            <asp:Label ID="lblCusAvatar" Text="Ảnh minh hoạ" CssClass="MQTT_Normal_Text" runat="server"></asp:Label>
                                        </div>
                                        <div style="width: 65%; float: right;">
                                            <p>Số thẻ: <% Response.Write(this.strCusAccount);%></p>
                                            <p>Số CMND: <% Response.Write(this.strIdCard);%></p>
                                            <p>Điện thoại: <% Response.Write(this.strCusPhone);%></p>
                                            <p>Địa chỉ: <% Response.Write(this.strCusAddress);%></p>
                                            <p>Email: <% Response.Write(this.strCusEmail);%></p>
                                            <p>
                                                Loại thẻ:
                                                        <asp:CheckBox ID="ckbD1" Text="&nbsp;Đ" Enabled="false" runat="server" />&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="ckbB1" Enabled="false" Text="&nbsp;B" runat="server" />&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="ckbV1" Enabled="false" Text="&nbsp;V" runat="server" />
                                            </p>
                                            <p>Số dư: <% Response.Write(this.strCustomerTotalDiscountCard);%> <u>đ</u></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- End Modal -->

                    <ul class="list-group" style="height: 120px;">
                        <li class="list-group-item" style="height: 40px;">
                            <div class="col-sm-12">
                                <asp:Label ID="lblAccount" Font-Bold="true" runat="server" Text="-:-"></asp:Label>
                            </div>
                        </li>
                        <li class="list-group-item" style="height: 40px;">
                            <div class="col-sm-12">
                                <asp:Label ID="lblName" Font-Bold="true" runat="server" Text="-:-"></asp:Label>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="col-sm-4">
                                <asp:CheckBox ID="ckbD" Enabled="false" Text="&nbsp;Đ" runat="server" />
                            </div>
                            <div class="col-sm-4">
                                <asp:CheckBox ID="ckbB" Enabled="false" Text="&nbsp;B" runat="server" />
                            </div>
                            <div class="col-sm-4">
                                <asp:CheckBox ID="ckbV" Enabled="false" Text="&nbsp;V" runat="server" />
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading"><b>HOÁ ĐƠN THANH TOÁN</b></div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 15px;">
                        <input enableviewstate="false" type="text" class="form-control" id="txtTotalMoney" runat="server" placeholder="TỔNG TIỀN HOÁ ĐƠN" style="font-weight: bold; text-align: right;">
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 5px; text-align: justify;">
                        &nbsp;&nbsp;&nbsp;Tỷ lệ giảm giá: <b><% Response.Write(this.strDiscount); %></b> %
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 5px; text-align: justify;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tích luỹ: <b><% Response.Write(this.strDiscountCard); %></b> % - Quảng cáo : <b><% Response.Write(this.strDiscountAdv); %></b> %
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 5px; text-align: justify;">
                        &nbsp;&nbsp;&nbsp;<b>Tổng tiền giảm giá</b>
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 15px;">
                        <asp:TextBox EnableViewState="false" ID="txtTotalMoneyDiscount" CssClass="form-control" runat="server" Width="100%" Style="text-align: right; font-weight: bold;"></asp:TextBox>
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 5px; text-align: justify;">
                        &nbsp;&nbsp;&nbsp;<b>Tổng tiền phải thanh toán</b>
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 15px;">
                        <asp:TextBox EnableViewState="false" ID="txtTotalMoneyPayment" CssClass="form-control" runat="server" Width="100%" Style="text-align: right; font-weight: bold;"></asp:TextBox>
                    </div>
                    <div class="form-group" style="width: 100%; text-align: justify; background-color: #fff; margin-bottom: 0px; padding: 15px;">
                        <asp:Label EnableViewState="false" ID="lblMsg1" runat="server" Text="-:-" ForeColor="Black"></asp:Label>
                    </div>
                </div>

            </div>
            <div class="col-md-8">
                <div class="row" style="padding-left: 15px; padding-right: 15px;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><b>THÔNG TIN HÀNG HOÁ GIẢM GIÁ</b></div>
                        <div style="width: 100%;">
                            <div style="width: 5%; float: left; text-align: center; padding: 3px; font-weight: bold; color: #000; font-size: 13px; background-color: #f2f7fc;">
                                TT
                            </div>
                            <div style="width: 65%; float: left; text-align: justify; padding: 3px; font-weight: bold; color: #000; font-size: 13px; background-color: #f2f7fc;">
                                Hàng hoá
                            </div>
                            <div style="width: 15%; float: left; text-align: right; padding: 3px; font-weight: bold; color: #000; font-size: 13px; background-color: #f2f7fc;">
                                Số lượng
                            </div>
                            <div style="width: 15%; float: left; text-align: right; padding: 3px; font-weight: bold; color: #000; font-size: 13px; background-color: #f2f7fc;">
                                Đơn giá
                            </div>
                        </div>
                        <div style="height: 210px; overflow-y: scroll; border:solid 1px #fff;">
                            <% Response.Write(strHtml); %>
                        </div>
                    </div>
                </div>

                <div class="row" style="padding-left: 15px; padding-right: 15px;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><b>THÔNG TIN HÀNG HOÁ THƯỜNG</b></div>
                        <div style="width: 100%;">
                            <div style="width: 5%; float: left; text-align: center; padding: 3px; font-weight: bold; color: #000; font-size: 13px; background-color: #f2f7fc;">
                                TT
                            </div>
                            <div style="width: 65%; float: left; text-align: justify; padding: 3px; font-weight: bold; color: #000; font-size: 13px; background-color: #f2f7fc;">
                                Hàng hoá
                            </div>
                            <div style="width: 15%; float: left; text-align: right; padding: 3px; font-weight: bold; color: #000; font-size: 13px; background-color: #f2f7fc;">
                                Số lượng
                            </div>
                            <div style="width: 15%; float: left; text-align: right; padding: 3px; font-weight: bold; color: #000; font-size: 13px; background-color: #f2f7fc;">
                                Đơn giá
                            </div>
                        </div>
                        <div style="height: 210px; overflow-y: scroll; border:solid 1px #fff;">
                            <% Response.Write(strHtml1); %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

