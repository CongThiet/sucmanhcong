<%@ Page Title="QUẢN TRỊ BÁN HÀNG" Language="C#" MasterPageFile="~/Store.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="ProductCustomer.aspx.cs" Inherits="Store_ProductCustomer" %>

<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        #MainContent_DataList2 {
            border: solid 0px white;
        }
    </style>
    <div class="container" style="width: 100%;">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-4" style="padding-left: 0px;">
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
                                    <div class="col-sm-12" style ="padding:0px;">
                                        <asp:Label ID="lblName" Font-Bold="true" runat="server" Text="-:-"></asp:Label>
                                        <div id="balloon1" class="balloonstyle">
                                            <div style="width: 30%; float: left; text-align:justify; padding-left:5px; padding-top:5px;">
                                                <asp:Label ID="lblCusAvatar" Text="Ảnh minh hoạ" CssClass="MQTT_Normal_Text" runat="server"></asp:Label>
                                            </div>
                                            <div style="width: 70%; float: right; padding-left:8px;">
                                                <%--<p style ="margin-top:0px;">Số thẻ: <% Response.Write(this.strCusAccount);%></p>--%>
                                                <p style ="margin-top:0px;">Số CMND: <% Response.Write(this.strIdCard);%></p>
                                                <p style ="margin-top:-8px;">Điện thoại: <% Response.Write(this.strCusPhone);%></p>
                                                <p style ="margin-top:-8px;">Địa chỉ: <% Response.Write(this.strCusAddress);%></p>
                                                <p style ="margin-top:-8px;">Email: <% Response.Write(this.strCusEmail);%></p>
                                                <p style ="margin-top:-8px; margin-bottom:8px;">
                                                    Loại thẻ:
                                                        <asp:CheckBox ID="ckbD1" Text="&nbsp;Đ" Enabled="false" runat="server" />&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="ckbB1" Enabled="false" Text="&nbsp;B" runat="server" />&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="ckbV1" Enabled="false" Text="&nbsp;V" runat="server" />
                                                </p>
                                                <p style ="margin-top:-10px; margin-bottom:-2px;">Số dư: <% Response.Write(this.strCustomerTotalDiscountCard);%> <u>đ</u></p>
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
                        <div class="panel panel-default">
                            <div class="panel-heading"><b>HOÁ ĐƠN THANH TOÁN</b></div>
                            <div class="form-group bill_from_group">
                                <input enableviewstate="false" type="text" class="form-control" id="txtTotalMoney" runat="server" placeholder="TỔNG TIỀN HOÁ ĐƠN" style="font-weight: bold; text-align: right;" onkeyup = "formatMoney();"> <%--onblur ="MyNumberFormat('MainContent_txtTotalMoney');"--%>
                            </div>
                            <div class="form-group bill_from_group justify" style="padding: 5px;">
                                &nbsp;&nbsp;&nbsp;Tỷ lệ giảm giá: <b><span id ="txtDiscountLevel"><% Response.Write(this.strDiscount); %></span></b> %
                            </div>
                            <div class="form-group bill_from_group justify" style="padding: 5px;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tích luỹ: <b><% Response.Write(this.strDiscountCard); %></b> %
                            </div>
                            <div class="form-group bill_from_group justify" style="padding: 0px;">
                                &nbsp;&nbsp;&nbsp;<b>Tổng tiền giảm giá</b>
                            </div>
                            <div class="form-group bill_from_group">
                                <asp:TextBox EnableViewState="false" ID="txtTotalMoneyDiscount" CssClass="form-control" runat="server" Width="100%" Style="text-align: right; font-weight: bold;"></asp:TextBox>
                            </div>
                            <div class="form-group bill_from_group justify" style="padding: 0px;">
                                &nbsp;&nbsp;&nbsp;<b>Tổng tiền phải thanh toán</b>
                            </div>
                            <div class="form-group bill_from_group">
                                <asp:TextBox EnableViewState="false" ID="txtTotalMoneyPayment" CssClass="form-control" runat="server" Width="100%" Style="text-align: right; font-weight: bold;"></asp:TextBox>
                            </div>
                            <div class="form-group bill_from_group justify">
                                <asp:Label EnableViewState="false" ID="lblMsg1" runat="server" Text="-:-" ForeColor="Red"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8" style="padding-right: 0px; padding-left: 0px;">
                        <div class="row" style="padding-left: 15px; padding-right: 15px;">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <b>THÔNG TIN HÀNG HOÁ GIẢM GIÁ</b> <!--
                                    <div style="right: 0px;">
                                        <b>Tổng giảm giá: </b>
                                        <b id="out_tonggiamgia"></b>
                                    </div> -->
                                </div>
                                <div class="list_product_page">
                                    <% Response.Write(strHtml); %>                                    
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top: -10px;">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading"><b>THÔNG TIN HÀNG HOÁ THƯỜNG</b></div>

                                    <div class="list_product_page">

                                        <div class="list_product_item">
                                            <div class="list_product_item_tt">
                                                <asp:TextBox ID="txtOrder1" runat="server" class="list_product_item_bx center" Text="1" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_n">
                                                <asp:TextBox ID="txtProductName1" runat="server" class="list_product_item_bx left" Style="padding-left: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_nb">
                                                <asp:TextBox ID="txtProductNumber1" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_pr">
                                                <asp:TextBox ID="txtProductPrice1" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                        </div>
                                        
                                        <div class="list_product_item">
                                            <div class="list_product_item_tt">
                                                <asp:TextBox ID="txtOrder2" runat="server" class="list_product_item_bx center" Text="2" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_n">
                                                <asp:TextBox ID="txtProductName2" runat="server" class="list_product_item_bx left" Style="padding-left: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_nb">
                                                <asp:TextBox ID="txtProductNumber2" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_pr">
                                                <asp:TextBox ID="txtProductPrice2" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="list_product_item">
                                            <div class="list_product_item_tt">
                                                <asp:TextBox ID="txtOrder3" runat="server" class="list_product_item_bx center" Text="3" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_n">
                                                <asp:TextBox ID="txtProductName3" runat="server" class="list_product_item_bx left" Style="padding-left: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_nb">
                                                <asp:TextBox ID="txtProductNumber3" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_pr">
                                                <asp:TextBox ID="txtProductPrice3" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="list_product_item">
                                            <div class="list_product_item_tt">
                                                <asp:TextBox ID="txtOrder4" runat="server" class="list_product_item_bx center" Text="4" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_n">
                                                <asp:TextBox ID="txtProductName4" runat="server" class="list_product_item_bx left" Style="padding-left: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_nb">
                                                <asp:TextBox ID="txtProductNumber4" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_pr">
                                                <asp:TextBox ID="txtProductPrice4" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="list_product_item">
                                            <div class="list_product_item_tt">
                                                <asp:TextBox ID="txtOrder5" runat="server" class="list_product_item_bx center" Text="5" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_n">
                                                <asp:TextBox ID="txtProductName5" runat="server" class="list_product_item_bx left" Style="padding-left: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_nb">
                                                <asp:TextBox ID="txtProductNumber5" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_pr">
                                                <asp:TextBox ID="txtProductPrice5" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="list_product_item">
                                            <div class="list_product_item_tt">
                                                <asp:TextBox ID="txtOrder6" runat="server" class="list_product_item_bx center" Text="6" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_n">
                                                <asp:TextBox ID="txtProductName6" runat="server" class="list_product_item_bx left" Style="padding-left: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_nb">
                                                <asp:TextBox ID="txtProductNumber6" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_pr">
                                                <asp:TextBox ID="txtProductPrice6" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="list_product_item">
                                            <div class="list_product_item_tt">
                                                <asp:TextBox ID="txtOrder7" runat="server" class="list_product_item_bx center" Text="7" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_n">
                                                <asp:TextBox ID="txtProductName7" runat="server" class="list_product_item_bx left" Style="padding-left: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_nb">
                                                <asp:TextBox ID="txtProductNumber7" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_pr">
                                                <asp:TextBox ID="txtProductPrice7" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="list_product_item">
                                            <div class="list_product_item_tt">
                                                <asp:TextBox ID="txtOrder8" runat="server" class="list_product_item_bx center" Text="8" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_n">
                                                <asp:TextBox ID="txtProductName8" runat="server" class="list_product_item_bx left" Style="padding-left: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_nb">
                                                <asp:TextBox ID="txtProductNumber8" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_pr">
                                                <asp:TextBox ID="txtProductPrice8" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="list_product_item">
                                            <div class="list_product_item_tt">
                                                <asp:TextBox ID="txtOrder9" runat="server" class="list_product_item_bx center" Text="9" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_n">
                                                <asp:TextBox ID="txtProductName9" runat="server" class="list_product_item_bx left" Style="padding-left: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_nb">
                                                <asp:TextBox ID="txtProductNumber9" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_pr">
                                                <asp:TextBox ID="txtProductPrice9" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="list_product_item">
                                            <div class="list_product_item_tt">
                                                <asp:TextBox ID="txtOrder10" runat="server" class="list_product_item_bx center" Text="10" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_n">
                                                <asp:TextBox ID="txtProductName10" runat="server" class="list_product_item_bx left" Style="padding-left: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_nb">
                                                <asp:TextBox ID="txtProductNumber10" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                            <div class="list_product_item_pr">
                                                <asp:TextBox ID="txtProductPrice10" runat="server" class="list_product_item_bx right" Style="padding-right: 5px; color: #000;"></asp:TextBox>
                                            </div>
                                        </div>



                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12" style="margin-top: -10px;">
                                <input disabled class="form-control" id="txtOTPCode" runat="server" placeholder="Mã OTP" />
                            </div>
                        </div>
                        <div class="row" style="margin-top: 9px;">
                            <div class="col-md-2">
                            <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" style = "height:74px;" Text="Hóa đơn mới&nbsp;" OnClick="btnAdd_Click" />    
                            </div>
                            <div class="col-md-2">
                            <input type ="button" id ="btnCalTotalMoney" class = "btn btn-success" style = "height:74px;" value ="&nbsp;&nbsp;&nbsp;&nbsp;Tính tiền&nbsp;&nbsp;&nbsp;" onclick ="calTotalMoney()" runat="server" />
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="btnSave" Enabled="false" CssClass="btn btn-primary" runat="server" Text="&nbsp;Thanh toán tiền mặt&nbsp;&nbsp;&nbsp;" OnClick="btnSaveBill_Click" />
                                <br />
                                <asp:Button ID="btnSaveByCard" Enabled="false" CssClass="btn btn-primary" style = "margin-top:5px;" runat="server" Text="&nbsp;Thanh toán thẻ SMC&nbsp;&nbsp;" OnClick="btnSaveByCard_Click" />
                                <br />
                            </div>
                            <div class="col-md-2">
                                <!-- Bùi Hữu Tân Begin -->
                                <input type ="button" ID ="btnPrint" class = "btn btn-success btn-lg" data-toggle="modal" data-target="#myModal" style = "height:74px;" value ="&nbsp;&nbsp;In hóa đơn&nbsp;&nbsp;" disabled runat="server" />
                                
                                <!-- Modal -->
                                <div id="myModal" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Hóa đơn thanh toán</h4>
                                            </div>
                                            <div id="out_text" class="modal-body">
                                                <h1><% Response.Write(this.strName.ToUpper()); %></h1>
                                                <p><% Response.Write(this.strAddress); %></p>
                                                <p>Điện thoại: <% Response.Write(this.strPhone); %></p><br/>
                                                <h3>Hóa đơn thanh toán</h3>
                                                <p>Khách hàng: <% Response.Write(this.strCusName); %></p>
                                                <p>Mã số thẻ: <% Response.Write(this.strIdCard); %></p>
                                                <p>Điện thoại: <% Response.Write(this.strCusPhone); %></p><br/>
                                                <h3>Hàng hóa giảm giá</h3>
                                                <table id="tbl_hgg" class="table-bordered">
                                                    <tr>
                                                        <th>STT</th>
                                                        <th>Hàng hóa</th>
                                                        <th>Số lượng</th>
                                                        <th>Đơn giá</th>
                                                        <th>TT</th>
                                                    </tr>
                                                    <% Response.Write(this.strhtmlbill); %>
                                                </table><br/>
                                                <p>Tổng tiền hàng: <a id="tongtienhang" runat="server"></a></p>
                                                <p>Chiết khấu: <a id="tonggiamgia" runat="server"></a></p>
                                                <p>Tổng tiền thanh toán: <a id="tienphaitra" runat="server"></a></p>
                                                <br/>
                                                <p>Cảm ơn!</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" onclick="PrintElem('out_text','<% Response.Write(this.strName.ToUpper()); %>');">Print</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <!-- end -->
                            </div>
                            <br />
                        </div>
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type ="hidden" id = "txtTotalItem" name = "txtTotalItem" runat = "server">
    <script type ="text/javascript">
        function calMoney() {
            var totalItem = document.getElementById('MainContent_txtTotalItem').value;
            var totalMoney = 0;
            for (var i = 0; i < totalItem; i++)
            {
                totalMoney += ((document.getElementById('txtNumber' + i).value).replace('.', '') * 1) * ((document.getElementById('txtPrice' + i).value).replace('.', '') * 1);
            }

            document.getElementById('MainContent_txtTotalMoneyDiscount').value = totalMoney.toLocaleString('en-US', { minimumFractionDigits: 0 });
        }

        function MyNumberFormat(object) {
            var totalMoney = document.getElementById(object).value*1;
            document.getElementById(object).value = totalMoney.toLocaleString('en-US', { minimumFractionDigits: 0 });
        }

        function formatMoney()
        {
            var totalMoneyBill = 0;
            totalMoneyBill = new Number((document.getElementById('MainContent_txtTotalMoney').value).replace(',', '').trim().replace(',', '').replace(',', '').replace(',', '').replace(',', '')) * 1;

            if (!isNaN(totalMoneyBill))
            {
                document.getElementById('MainContent_txtTotalMoney').value = totalMoneyBill.toLocaleString('en-US', { minimumFractionDigits: 0 });
            }
        }

        function calTotalMoney()
        {
            document.getElementById('MainContent_lblMsg1').textContent = '-:-';
            
            if (document.getElementById('MainContent_txtTotalMoney').value.trim() == '')
            {
                document.getElementById('MainContent_lblMsg1').textContent = 'Chưa xác định tổng tiền đơn hàng';
                document.getElementById("MainContent_txtTotalMoney").focus();
                return;
            }
            var TotalMoney = (document.getElementById('MainContent_txtTotalMoney').value).replace(',', '') * 1;

 
            var totalItem = document.getElementById('MainContent_txtTotalItem').value;
            var totalMoney = 0;
            for (var i = 0; i < totalItem; i++) {

                totalMoney += ((document.getElementById('txtNumber' + i).value).replace('.', '') * 1) * ((document.getElementById('txtPrice' + i).value).replace('.', '') * 1);

            }
            
            //document.getElementById('out_tonggiamgia').innerText = totalMoney.toString();
            

            //console.log(totalMoney.toString());

            document.getElementById('MainContent_txtTotalMoneyDiscount').value = totalMoney.toLocaleString('en-US', { minimumFractionDigits: 0 });

            if (document.getElementById('MainContent_txtTotalMoneyDiscount').value.trim() == '' || document.getElementById('MainContent_txtTotalMoneyDiscount').value.trim() == '0') {
                document.getElementById('MainContent_lblMsg1').textContent = 'Chưa xác định tổng tiền giảm giá';
                document.getElementById("MainContent_txtTotalMoneyDiscount").focus();
                return;
            }
            if (document.getElementById('txtDiscountLevel').textContent.trim() == '' || document.getElementById('txtDiscountLevel').textContent.trim() == '0' || document.getElementById('txtDiscountLevel').textContent.trim() == '-') {
                document.getElementById('MainContent_lblMsg1').textContent = 'Chưa xác định mức giảm giá của cửa hàng';
                document.getElementById("txtDiscountLevel").focus();
                return;
            }
            //console.log(totalMoney.toString() + ":" + TotalMoney.toString());


            //Kiem tra tong tien hoa don co nho hon tong tien giam gia khong?
            //if (document.getElementById('MainContent_txtTotalMoneyDiscount').value.replace(',', '') * 1 > TotalMoney
            if (totalMoney > TotalMoney)
            {
                document.getElementById('MainContent_lblMsg1').textContent =  'Tổng tiền chiết khấu lớn hơn tổng tiền hoá đơn';
                return;
            }
            var totalMoneyBill = 0;
            var tmpTodalMoneyDiscount = 0;

            totalMoneyBill = new Number((document.getElementById('MainContent_txtTotalMoney').value).replace(',', '').trim().replace(',', '').replace(',', '').replace(',', '').replace(',', '')) * 1;
            tmpTodalMoneyDiscount = (document.getElementById('MainContent_txtTotalMoneyDiscount').value.replace(',', '').replace(',', '').replace(',', '').replace(',', '').replace(',', '') * 1) * document.getElementById('txtDiscountLevel').textContent.trim() / 100;

            document.getElementById('MainContent_txtTotalMoneyPayment').value = (totalMoneyBill - tmpTodalMoneyDiscount).toLocaleString('en-US', { minimumFractionDigits: 0 });
            document.getElementById('MainContent_btnSave').disabled = false;
            document.getElementById('MainContent_btnSaveByCard').disabled = false;

            document.getElementById('MainContent_btnPrint').disabled = true;
        }


    </script>
</asp:Content>

