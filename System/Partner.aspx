<%@ Page Title="QUẢN TRỊ NỘI DUNG" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Partner.aspx.cs" Inherits="System_Partner" %>

<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; height: 32px; line-height: 30px; background-color: #dde8ec; font-family: Arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
        <div style="float: left;">&nbsp;&nbsp;Cửa hàng - đối tác</div>
        <div style="float: right;"><a href="PartnerEdit.aspx"><span style="border: solid 1px #f8fbfc; padding: 5px; font-size: 11px; font-weight: bold; padding-left: 20px; padding-right: 20px;">Thêm mới</span></a>&nbsp;</div>
    </div>
    <table cellpadding="0" cellspacing="0" border="0" style="margin: 0px; width: 99.9%; height: 30px;">
        <tr>
            <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 15px; color: #262626; background-color: #FFF; width: 4%;">
                <div style="float: left; font-weight: bold; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 14px; border-bottom: solid 1px #808080; border-left: solid 1px #808080;">
                    STT
                </div>
            </td>
            <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 15px; color: #fff; background-color: #FFF; width: 61%;">
                <div style="float: left; font-weight: bold; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: justify; padding-left: 5px; vertical-align: middle; font-size: 15px; border-bottom: solid 1px #808080;">
                    Tên cửa hàng
                </div>
            </td>
            <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 10%;">
                <div style="float: left; font-weight: bold; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: justify; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080; font-weight: bold;">
                    Mã khách hàng
                </div>
            </td>
            <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 5%;">
                <div style="float: left; font-weight: bold; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080; font-weight: bold;">
                    CK
                </div>
            </td>
            <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 5%;">
                <div style="float: left; font-weight: bold; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080; font-weight: bold;">
                    T.T
                </div>
            </td>
            <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 5%;">
                <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080; font-weight: bold;">
                    &nbsp;
                </div>
            </td>
            <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 5%;">
                <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080; font-weight: bold;">
                    &nbsp;
                </div>
            </td>
             <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 4%;">
                <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080; border-right: solid 1px #808080; font-weight: bold;">
                    <img src ="/img/info.png" alt = "Thong tin" style ="margin-top:2px;" />
                </div>
            </td>
        </tr>
    </table>
    <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal" RepeatColumns="1"
        Width="100%">
        <ItemTemplate>
            <table cellpadding="0" cellspacing="0" border="0" style="margin: 0px; width: 99.9%; height: 30px;">
                <tr>
                    <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 15px; color: #262626; background-color: #FFF; width: 4%;">
                        <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 14px; border-bottom: solid 1px #808080; border-left: solid 1px #808080;">
                            <%# Eval("TT") %>
                        </div>
                    </td>
                    <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 15px; color: #fff; background-color: #FFF; width: 61%;">
                        <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: justify; padding-left: 5px; vertical-align: middle; font-size: 15px; border-bottom: solid 1px #808080;">
                            <a style="display: block; vertical-align: middle;" href="PartnerProduct.aspx?Id=<%# Eval("Id") %>">
                                <%# Eval("Name") %>
                            </a>
                        </div>
                    </td>
                    <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 10%;">
                        <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: justify; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080;">
                            <%# Eval("Account") %>
                        </div>
                    </td>
                    <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 5%;">
                        <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080;">
                            <%# Eval("Discount") %>
                        </div>
                    </td>
                    <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 5%;">
                        <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080; font-weight: bold;">
                            <%# Eval("State1") %>
                        </div>
                    </td>
                    <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 5%;">
                        <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080; font-weight: bold;">
                            <a href="PartnerEdit.aspx?Id=<%# Eval("Id") %>">Sửa
                            </a>
                        </div>
                    </td>
                    <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 5%;">
                        <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080; font-weight: bold;">
                            <a href="#">Xóa
                            </a>
                        </div>
                    </td>
                     <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 13px; color: #262626; background-color: #FFF; width: 4%;">
                        <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; vertical-align: middle; font-size: 13px; border-bottom: solid 1px #808080; border-right: solid 1px #808080; font-weight: bold;">
                            <a href="PartnerInfo.aspx?Id=<%# Eval("Id") %>">
                                <img src ="/img/info.png" alt = "Thong tin" style ="margin-top:2px;" />
                            </a>
                        </div>
                    </td>
                </tr>
            </table>
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
</asp:Content>

