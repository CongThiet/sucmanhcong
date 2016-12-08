<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Sell.aspx.cs" Inherits="mStore_Sell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="background-color: red; width: 100%; height: 100%; display: block;">
        <div style="width: 30%; float: left; padding-top: 0px;">
            <div style="width: 100%;">
                <div class="panel panel-default">
                    <div class="panel-heading" style="height: 92px;">
                        <div class="form-group">
                            <div class="col-sm-12" style="padding-left: 0px; padding-right: 0px;">
                                <input type="text" class="form-control" id="txtAccount" runat="server" placeholder="Thẻ khách hàng" style="text-transform: uppercase; font-weight: bold;">
                            </div>
                            <div class="col-sm-12" style="margin-top: 6px; padding-left: 0px; padding-right: 0px;">
                                <asp:Button ID="btnViewCustomer" CssClass="btn btn-primary" runat="server" Text="Xem thông tin" OnClick="btnViewCustomer_Click" />
                                &nbsp;&nbsp;
                            </div>
                        </div>
                    </div>
                    <ul class="list-group" style="height: 80px;">
                        <li class="list-group-item" style="height: 40px;">
                            <div class="col-sm-12" style="padding: 0px;">
                                <asp:Label ID="lblName" Font-Bold="true" runat="server" Text="-:-"></asp:Label>
                                <div id="balloon1" class="balloonstyle">
                                    <div style="width: 30%; float: left; text-align: justify; padding-left: 5px; padding-top: 5px;">
                                        <asp:Label ID="lblCusAvatar" Text="Ảnh minh hoạ" CssClass="MQTT_Normal_Text" runat="server"></asp:Label>
                                    </div>
                                    <div style="width: 70%; float: right; padding-left: 8px;">
                                        <%--<p style ="margin-top:0px;">Số thẻ: <% Response.Write(this.strCusAccount);%></p>--%>
                                        <p style="margin-top: 0px;">Số CMND: <% Response.Write(this.strIdCard);%></p>
                                        <p style="margin-top: -8px;">Điện thoại: <% Response.Write(this.strCusPhone);%></p>
                                        <p style="margin-top: -8px;">Địa chỉ: <% Response.Write(this.strCusAddress);%></p>
                                        <p style="margin-top: -8px;">Email: <% Response.Write(this.strCusEmail);%></p>
                                        <p style="margin-top: -8px; margin-bottom: 8px;">
                                            Loại thẻ:
                                                        <asp:CheckBox ID="ckbD1" Text="&nbsp;Đ" Enabled="false" runat="server" />&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="ckbB1" Enabled="false" Text="&nbsp;B" runat="server" />&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="ckbV1" Enabled="false" Text="&nbsp;V" runat="server" />
                                        </p>
                                        <p style="margin-top: -10px; margin-bottom: -2px;">Số dư: <% Response.Write(this.strCustomerTotalDiscountCard);%> <u>đ</u></p>
                                    </div>
                                </div>
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
            </div>
            <div style="width: 100%; background-color: red; margin-top: -10px;">
                <div class="panel panel-default">
                    <div class="panel-heading" style="height: 40px; line-height: 20px;"><b>HOÁ ĐƠN THANH TOÁN</b></div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 10px;">
                        <input enableviewstate="false" type="text" class="form-control" id="txtTotalMoney" runat="server" placeholder="TỔNG TIỀN HOÁ ĐƠN" style="font-weight: bold; text-align: right;" onkeyup="formatMoney();" />
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 0px; text-align: justify;">
                        &nbsp;&nbsp;&nbsp;Tỷ lệ giảm giá: <b><span id="txtDiscountLevel"><% Response.Write(this.strDiscount); %></span></b> %
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 5px; text-align: justify;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tích luỹ: <b><% Response.Write(this.strDiscountCard); %></b> %
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 0px; text-align: justify;">
                        &nbsp;&nbsp;&nbsp;<b>Tổng tiền giảm giá</b>
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 10px;">
                        <asp:TextBox EnableViewState="false" ID="txtTotalMoneyDiscount" CssClass="form-control" runat="server" Width="100%" Style="text-align: right; font-weight: bold;"></asp:TextBox>
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 0px; text-align: justify;">
                        &nbsp;&nbsp;&nbsp;<b>Tổng tiền phải thanh toán</b>
                    </div>
                    <div class="form-group" style="width: 100%; text-align: right; background-color: #fff; margin-bottom: 0px; padding: 8px;">
                        <asp:TextBox EnableViewState="false" ID="txtTotalMoneyPayment" CssClass="form-control" runat="server" Width="100%" Style="text-align: right; font-weight: bold;"></asp:TextBox>
                    </div>
                    <div class="form-group" style="width: 100%; text-align: justify; background-color: #fff; margin-bottom: 0px; padding: 8px;">
                        <asp:Label EnableViewState="false" ID="lblMsg1" runat="server" Text="-:-" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div style="width: 70%; float: right; padding-left: 10px; padding-top: 0px;">
            <div style="width: 100%;">
                <div class="panel panel-default">
                    <div class="panel-heading"><b>THÔNG TIN HÀNG HOÁ GIẢM GIÁ</b></div>
                    <div style="height: 133px; overflow-y: scroll;">
                        <% Response.Write(strHtml); %>
                    </div>
                </div>
            </div>

            <div style="width: 100%; margin-top: -10px;">
                <div class="panel panel-default">
                    <div class="panel-heading"><b>THÔNG TIN HÀNG HOÁ THƯỜNG</b></div>

                    <div style="height: 137px; overflow-y: scroll;">

                        <div style="width: 100%; margin-top: 1px;">
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-right: none; border-top: none; text-align: center; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtOrder1" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Text="1" Style="text-align: center;" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div style="width: 74%; float: left; border: solid 1px #f3f1f1; padding-left: 0px; border-top: none; overflow: hidden; height: 30px; line-height: 30px; text-align: center;">
                                <asp:TextBox ID="txtProductName1" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: left; padding-left: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-left: none; overflow: hidden; text-align: center; border-top: none; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtProductNumber1" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 10%; float: right; border: solid 1px #f3f1f1; overflow: hidden; height: 30px; border-top: none; line-height: 30px; text-align: right;">
                                <asp:TextBox ID="txtProductPrice1" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                        </div>

                        <div style="width: 100%; margin-top: 1px;">
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-right: none; border-top: none; text-align: center; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtOrder2" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Text="2" Style="text-align: center;" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div style="width: 74%; float: left; border: solid 1px #f3f1f1; padding-left: 0px; border-top: none; overflow: hidden; height: 30px; line-height: 30px; text-align: center;">
                                <asp:TextBox ID="txtProductName2" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: left; padding-left: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-left: none; overflow: hidden; text-align: center; border-top: none; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtProductNumber2" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 10%; float: right; border: solid 1px #f3f1f1; overflow: hidden; height: 30px; border-top: none; line-height: 30px; text-align: right;">
                                <asp:TextBox ID="txtProductPrice2" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                        </div>

                        <div style="width: 100%; margin-top: 1px;">
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-right: none; border-top: none; text-align: center; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtOrder3" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Text="3" Style="text-align: center;" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div style="width: 74%; float: left; border: solid 1px #f3f1f1; padding-left: 0px; border-top: none; overflow: hidden; height: 30px; line-height: 30px; text-align: center;">
                                <asp:TextBox ID="txtProductName3" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: left; padding-left: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-left: none; overflow: hidden; text-align: center; border-top: none; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtProductNumber3" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 10%; float: right; border: solid 1px #f3f1f1; overflow: hidden; height: 30px; border-top: none; line-height: 30px; text-align: right;">
                                <asp:TextBox ID="txtProductPrice3" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                        </div>

                        <div style="width: 100%; margin-top: 1px;">
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-right: none; border-top: none; text-align: center; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtOrder4" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Text="4" Style="text-align: center;" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div style="width: 74%; float: left; border: solid 1px #f3f1f1; padding-left: 0px; border-top: none; overflow: hidden; height: 30px; line-height: 30px; text-align: center;">
                                <asp:TextBox ID="txtProductName4" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: left; padding-left: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-left: none; overflow: hidden; text-align: center; border-top: none; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtProductNumber4" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 10%; float: right; border: solid 1px #f3f1f1; overflow: hidden; height: 30px; border-top: none; line-height: 30px; text-align: right;">
                                <asp:TextBox ID="txtProductPrice4" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                        </div>

                        <div style="width: 100%; margin-top: 1px;">
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-right: none; border-top: none; text-align: center; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtOrder5" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Text="5" Style="text-align: center;" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div style="width: 74%; float: left; border: solid 1px #f3f1f1; padding-left: 0px; border-top: none; overflow: hidden; height: 30px; line-height: 30px; text-align: center;">
                                <asp:TextBox ID="txtProductName5" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: left; padding-left: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-left: none; overflow: hidden; text-align: center; border-top: none; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtProductNumber5" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 10%; float: right; border: solid 1px #f3f1f1; overflow: hidden; height: 30px; border-top: none; line-height: 30px; text-align: right;">
                                <asp:TextBox ID="txtProductPrice5" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                        </div>

                        <div style="width: 100%; margin-top: 1px;">
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-right: none; border-top: none; text-align: center; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtOrder6" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Text="6" Style="text-align: center;" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div style="width: 74%; float: left; border: solid 1px #f3f1f1; padding-left: 0px; border-top: none; overflow: hidden; height: 30px; line-height: 30px; text-align: center;">
                                <asp:TextBox ID="txtProductName6" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: left; padding-left: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-left: none; overflow: hidden; text-align: center; border-top: none; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtProductNumber6" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 10%; float: right; border: solid 1px #f3f1f1; overflow: hidden; height: 30px; border-top: none; line-height: 30px; text-align: right;">
                                <asp:TextBox ID="txtProductPrice6" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                        </div>

                        <div style="width: 100%; margin-top: 1px;">
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-right: none; border-top: none; text-align: center; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtOrder7" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Text="7" Style="text-align: center;" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div style="width: 74%; float: left; border: solid 1px #f3f1f1; padding-left: 0px; border-top: none; overflow: hidden; height: 30px; line-height: 30px; text-align: center;">
                                <asp:TextBox ID="txtProductName7" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: left; padding-left: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-left: none; overflow: hidden; text-align: center; border-top: none; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtProductNumber7" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 10%; float: right; border: solid 1px #f3f1f1; overflow: hidden; height: 30px; border-top: none; line-height: 30px; text-align: right;">
                                <asp:TextBox ID="txtProductPrice7" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                        </div>

                        <div style="width: 100%; margin-top: 1px;">
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-right: none; border-top: none; text-align: center; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtOrder8" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Text="8" Style="text-align: center;" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div style="width: 74%; float: left; border: solid 1px #f3f1f1; padding-left: 0px; border-top: none; overflow: hidden; height: 30px; line-height: 30px; text-align: center;">
                                <asp:TextBox ID="txtProductName8" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: left; padding-left: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-left: none; overflow: hidden; text-align: center; border-top: none; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtProductNumber8" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 10%; float: right; border: solid 1px #f3f1f1; overflow: hidden; height: 30px; border-top: none; line-height: 30px; text-align: right;">
                                <asp:TextBox ID="txtProductPrice8" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                        </div>

                        <div style="width: 100%; margin-top: 1px;">
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-right: none; border-top: none; text-align: center; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtOrder9" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Text="9" Style="text-align: center;" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div style="width: 74%; float: left; border: solid 1px #f3f1f1; padding-left: 0px; border-top: none; overflow: hidden; height: 30px; line-height: 30px; text-align: center;">
                                <asp:TextBox ID="txtProductName9" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: left; padding-left: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-left: none; overflow: hidden; text-align: center; border-top: none; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtProductNumber9" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 10%; float: right; border: solid 1px #f3f1f1; overflow: hidden; height: 30px; border-top: none; line-height: 30px; text-align: right;">
                                <asp:TextBox ID="txtProductPrice9" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                        </div>

                        <div style="width: 100%; margin-top: 1px;">
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-right: none; border-top: none; text-align: center; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtOrder10" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Text="10" Style="text-align: center;" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div style="width: 74%; float: left; border: solid 1px #f3f1f1; padding-left: 0px; border-top: none; overflow: hidden; height: 30px; line-height: 30px; text-align: center;">
                                <asp:TextBox ID="txtProductName10" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: left; padding-left: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 8%; float: left; border: solid 1px #f3f1f1; border-left: none; overflow: hidden; text-align: center; border-top: none; height: 30px; line-height: 30px;">
                                <asp:TextBox ID="txtProductNumber10" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                            <div style="width: 10%; float: right; border: solid 1px #f3f1f1; overflow: hidden; height: 30px; border-top: none; line-height: 30px; text-align: right;">
                                <asp:TextBox ID="txtProductPrice10" CssClass="tvsInput" runat="server" Width="100%" Height="26px" Style="text-align: right; padding-right: 5px; color: #000;"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div style="width: 100%;">
                <input type="password" readonly="readonly" class="form-control" id="txtOTPCode" runat="server" placeholder="Mã OTP" />
            </div>

            <div style="width: 100%; margin-top: 12px;">
                <div style="width: 21%; float: left;">
                    <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Style="height: 74px;" Text="Hóa đơn mới&nbsp;" OnClick="btnAdd_Click" />
                </div>
                <div style="width: 21%; float: left;">
                    <input type="button" id="btnCalTotalMoney" class="btn btn-success" style="height: 74px;" value="&nbsp;&nbsp;&nbsp;&nbsp;Tính tiền&nbsp;&nbsp;&nbsp;" onclick="calTotalMoney()" />
                </div>
                <div style="width: 25%; float: left;">
                    <asp:Button ID="btnSave" Enabled="false" CssClass="btn btn-primary" runat="server" Text="&nbsp;Thanh toán tiền mặt&nbsp;&nbsp;&nbsp;" OnClick="btnSaveBill_Click" />
                    <br />
                    <asp:Button ID="btnSaveByCard" Enabled="false" CssClass="btn btn-primary" Style="margin-top: 5px;" runat="server" Text="&nbsp;Thanh toán thẻ SMC&nbsp;&nbsp;" OnClick="btnSaveByCard_Click" />
                    <br />
                </div>
                <div style="width: 10%; float: left;">
                </div>
                <div style="width: 23%; float: right; text-align: right;">
                    <input type="button" id="btnPrint" class="btn btn-success" style="height: 74px;" value="&nbsp;&nbsp;In hóa đơn&nbsp;&nbsp;" />
                </div>
            </div>

        </div>
    </div>
    <input type="hidden" id="txtTotalItem" name="txtTotalItem" runat="server" />
    <script type="text/javascript">
        function calMoney() {
            var totalItem = document.getElementById('ContentPlaceHolder1_txtTotalItem').value;
            var totalMoney = 0;
            for (var i = 0; i < totalItem; i++) {
                totalMoney += ((document.getElementById('txtNumber' + i).value).replace(',', '') * 1) * ((document.getElementById('txtPrice' + i).value).replace(',', '') * 1);
            }

            document.getElementById('ContentPlaceHolder1_txtTotalMoneyDiscount').value = totalMoney.toLocaleString('en-US', { minimumFractionDigits: 0 });
        }

        function MyNumberFormat(object) {
            var totalMoney = document.getElementById(object).value * 1;
            document.getElementById(object).value = totalMoney.toLocaleString('en-US', { minimumFractionDigits: 0 });
        }

        function formatMoney() {
            var totalMoneyBill = 0;
            totalMoneyBill = new Number((document.getElementById('ContentPlaceHolder1_txtTotalMoney').value).replace(',', '').trim().replace(',', '').replace(',', '').replace(',', '').replace(',', '')) * 1;

            if (!isNaN(totalMoneyBill)) {
                document.getElementById('ContentPlaceHolder1_txtTotalMoney').value = totalMoneyBill.toLocaleString('en-US', { minimumFractionDigits: 0 });
            }
        }

        function calTotalMoney() {
            document.getElementById('ContentPlaceHolder1_lblMsg1').textContent = '-:-';

            if (document.getElementById('ContentPlaceHolder1_txtTotalMoney').value.trim() == '') {
                document.getElementById('ContentPlaceHolder1_lblMsg1').textContent = 'Chưa xác định tổng tiền đơn hàng';
                document.getElementById("ContentPlaceHolder1_txtTotalMoney").focus();
                return;
            }
            var TotalMoney = (document.getElementById('ContentPlaceHolder1_txtTotalMoney').value).replace(',', '') * 1;

            var totalItem = document.getElementById('ContentPlaceHolder1_txtTotalItem').value;
            var totalMoney = 0;
            for (var i = 0; i < totalItem; i++) {
                totalMoney += ((document.getElementById('txtNumber' + i).value).replace(',', '') * 1) * ((document.getElementById('txtPrice' + i).value).replace(',', '') * 1);
            }

            document.getElementById('ContentPlaceHolder1_txtTotalMoneyDiscount').value = totalMoney.toLocaleString('en-US', { minimumFractionDigits: 0 });

            if (document.getElementById('ContentPlaceHolder1_txtTotalMoneyDiscount').value.trim() == '' || document.getElementById('ContentPlaceHolder1_txtTotalMoneyDiscount').value.trim() == '0') {
                document.getElementById('ContentPlaceHolder1_lblMsg1').textContent = 'Chưa xác định tổng tiền giảm giá';
                document.getElementById("ContentPlaceHolder1_txtTotalMoneyDiscount").focus();
                return;
            }
            if (document.getElementById('txtDiscountLevel').textContent.trim() == '' || document.getElementById('txtDiscountLevel').textContent.trim() == '0' || document.getElementById('txtDiscountLevel').textContent.trim() == '-') {
                document.getElementById('ContentPlaceHolder1_lblMsg1').textContent = 'Chưa xác định mức giảm giá của cửa hàng';
                document.getElementById("txtDiscountLevel").focus();
                return;
            }

            //Kiem tra tong tien hoa don co nho hon tong tien giam gia khong?
            if (document.getElementById('ContentPlaceHolder1_txtTotalMoneyDiscount').value.replace(',', '') * 1 > TotalMoney) {
                document.getElementById('ContentPlaceHolder1_lblMsg1').textContent = 'Tổng tiền chiết khấu lớn hơn tổng tiền hoá đơn';
                return;
            }
            var totalMoneyBill = 0;
            var tmpTodalMoneyDiscount = 0;

            totalMoneyBill = new Number((document.getElementById('ContentPlaceHolder1_txtTotalMoney').value).replace(',', '').trim().replace(',', '').replace(',', '').replace(',', '').replace(',', '')) * 1;
            tmpTodalMoneyDiscount = (document.getElementById('ContentPlaceHolder1_txtTotalMoneyDiscount').value.replace(',', '').replace(',', '').replace(',', '').replace(',', '').replace(',', '') * 1) * document.getElementById('txtDiscountLevel').textContent.trim() / 100;

            document.getElementById('ContentPlaceHolder1_txtTotalMoneyPayment').value = (totalMoneyBill - tmpTodalMoneyDiscount).toLocaleString('en-US', { minimumFractionDigits: 0 });
            document.getElementById('ContentPlaceHolder1_btnSave').disabled = false;

        }
    </script>
</asp:Content>

