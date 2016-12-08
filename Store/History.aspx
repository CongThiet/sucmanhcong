<%@ Page Title="LỊCH SỬ GIAO DỊCH" Language="C#" MasterPageFile="~/Store.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="Store_History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" style="width: 100%;">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div style="width: 100%; margin-top: 0px;">
                        <div class="table_header_item" style="width: 5%;">
                            TT   
                        </div>
                        <div class="table_header_item1" style="width: 18%;">
                            Ngày, giờ giao dịch
                        </div>
                        <div class="table_header_item2" style="width: 10%;">
                            Tổng tiền
                        </div>
                        <div class="table_header_item2" style="width: 10%;">
                            Tiền CK
                        </div>
                        <div class="table_header_item2" style="width: 5%;">
                            CK(%)
                        </div>
                        <div class="table_header_item2" style="width: 5%;">
                            TL(%)
                        </div>
                        <div class="table_header_item2" style="width: 5%;">
                            QC(%)
                        </div>
                        <div class="table_header_item2" style="width: 10%;">
                            Thanh toán
                        </div>
                        <div class="table_header_item2" style="width: 27%;">
                            Ghi chú
                        </div>
                        <div class="table_header_item2" style="width: 5%;">
                            &nbsp;
                        </div>
                    </div>
                    <% Response.Write(this.strHtml); %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

