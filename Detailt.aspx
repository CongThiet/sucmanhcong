<%@ Page Title="THÔNG TIN CẦN BIẾT" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Detailt.aspx.cs" Inherits="Detailt" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        #MainContent_DataList2
        {
            border:solid 0px red;
        }
    </style>
    <div class="container">
        <div style="width: 100%; margin: auto; display: table; margin-bottom: 10px; margin-top: 0px;">
            <div class="row">
                <div class="col-md-9" style="float: left; width: 75%; height: 100%; vertical-align: top; text-align: justify;">
                    <h3 style="text-align: justify; font-family: Arial; font-size: 16px; font-weight: bold; padding-top: 5px;"><a href="/">TRANG CHỦ</a> >> <a href="#">THÔNG TIN HÀNG HÓA, DỊCH VỤ</a></h3>
                    <hr style="width: 98%; color: #00ffff;" />
                    <div style="width: 100%; text-align: justify; margin-top: 0px;">
                        <% Response.Write(this.objTable.Rows[0]["Content"].ToString()); %>
                    </div>
                </div>
                <div class="col-md-3" style="float: right; width: 25%; height: 100%; vertical-align: top;">
                    <h3 style="font-family: Arial; font-size: 18px; font-weight: bold; margin-top: px; margin-bottom:13px;">SẢN PHẨM KHÁC</h3>

                    <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal" RepeatColumns="1" Width="100%" ItemStyle-BorderStyle="None" BorderStyle="Dashed" Style="margin-left: -10px;">
                        <ItemTemplate>
                            <div style="background-color: #f9faf5; height: 375px; padding: 5px; margin-bottom:15px;">
                                <a href="/detailt.aspx?id=<%# Eval("Id") %>">
                                    <img src="images/Products/<%# Eval("Image") %>" alt="San pham VIP" style="width: 253px; height: 252px;" /></a>
                                <p class ="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; height:54px; overflow:hidden; border-bottom: solid 2px #f0f0fb;">
                                    <a style="display: block; vertical-align: middle;" href="#">
                                        <%# Eval("Name") %>
                                    </a>
                                </p>
                                <div style="text-align: right; margin-top: -2px;">
                                    <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                        <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                        126
                                    </div>
                                </div>
                                <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                                    <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%# Eval("Price") %>&nbsp;<sup><u>đ</u></sup></span>
                                    <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%# Eval("Discount") %>% &nbsp;</span>
                                </p>

                                <input type="button" value="Đã mua: 208" style="margin-top: -82px; margin-left:155px; font-size:12px; background-color :#ff7a00; border-color:#ff7a00;" class="btn btn-success" />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <table width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 5px; background-color: #daf2a5; height: 26px;"
                        id="tblABC" runat="server">
                        <tr>
                            <td>
                                <cc1:CollectionPager ID="CollectionPager2" runat="server" BackText="" FirstText="Đầu"
                                    ControlCssClass="ProductPage" LabelText="" LastText="Cuối" NextText="" UseSlider="true"
                                    ResultsFormat="" BackNextLinkSeparator="" ResultsLocation="None" BackNextLocation="None"
                                    PageNumbersSeparator="&nbsp;">
                                </cc1:CollectionPager>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

