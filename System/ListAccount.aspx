<%@ Page Title="QUẢN TRỊ NỘI DUNG" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListAccount.aspx.cs" Inherits="System_ListAccount" %>

<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; height: 32px; line-height: 30px; background-color: #dde8ec; font-family: Arial; font-size: 13px; font-weight: bold; text-transform: uppercase;">
        <div style="float: left;">&nbsp;&nbsp;Danh sách nhóm tài khoản</div>
        <div style="float: right;"><a href="AccountAdd.aspx"><span style="border: solid 1px #f8fbfc; padding: 5px; font-size: 11px; font-weight: bold; padding-left: 20px; padding-right: 20px;">Thêm mới</span></a>&nbsp;</div>
    </div>
    <table cellpadding="0" cellspacing="0" border="0" style="margin: 0px; width: 99.9%; height: 30px;">
        <tr>
            <td class="head_table_item" style="width: 4%;">
                <div class="head_table_item_mg">
                    STT
                </div>
            </td>
            <td class="head_table_item" style="width: 56%;">
                <div class="head_table_item_mg">
                    Tài khoản
                </div>
            </td>
            <td class="head_table_item" style="width: 10%;">
                <div class="head_table_item_mg">
                    Tên đầy đủ
                </div>
            </td>
            
            <!--
            <td class="head_table_item" style="width: 10%;">
                <div class="head_table_item_mg">
                    Email
                </div>
            </td>
            -->

            <td class="head_table_item" style="width: 5%;">
                <div class="head_table_item_mg">
                    &nbsp;
                </div>
            </td>
            <td class="head_table_item" style="width: 5%;">
                <div class="head_table_item_mg">
                    &nbsp;
                </div>
            </td>
            <td class="head_table_item" style="width: 4%;">
                <div class="head_table_item_mg">
                    &nbsp;
                </div>
            </td>
        </tr>
    </table>
    <asp:DataList ID="dtlGroupAcc" runat="server" RepeatDirection="Horizontal" RepeatColumns="1"
        Width="100%">
        <ItemTemplate>
            <table cellpadding="0" cellspacing="0" border="0" style="margin: 0px; width: 99.9%; height: 30px;">
                <tr>
                    <td class="page_table_item" style="width: 4%;">
                        <div class="page_table_item center">
                            <%# Eval("TT") %>
                        </div>
                    </td>
                    <td class="page_table_item" style="width: 56%;">
                        <div class="page_table_item_mg">
                            <a style="display: block; vertical-align: middle;" href="Account.aspx?Id=<%# Eval("Id") %>">
                                <%# Eval("UserName") %>
                            </a>
                        </div>
                    </td>
                    <td class="page_table_item" style="width: 10%;">
                        <div class="page_table_item_mg center">
                            <a style="display: block; vertical-align: middle;" href="#">
                                <%# Eval("FullName") %>
                            </a>
                        </div>
                    </td>
                    <!--
                    <td class="page_table_item" style="width: 10%;">
                        <div class="page_table_item_mg">
                            <a style="display: block; vertical-align: middle;" href="#">
                                <%# Eval("Email") %>
                            </a>
                        </div>
                    </td> 
                    -->
                    <td class="page_table_item" style="width: 5%;">
                        <div class="page_table_item_mg center">
                            <a href="AccountEdit.aspx?Id=<%# Eval("Id") %>">Sửa
                            </a>
                        </div>
                    </td>
                    <td class="page_table_item" style="width: 5%;">
                        <div class="page_table_item_mg center">
                            <a href="AccountDel.aspx?Id=<%# Eval("Id") %>">Xóa
                            </a>
                        </div>
                    </td>
                    <td class="page_table_item" style="width: 4%;">
                        <div class="page_table_item_mg center">
                            <a href="Account.aspx?Id=<%# Eval("Id") %>">
                                <img src="/img/info.png" alt="Thông tin" style="margin-top: 2px;" />
                            </a>
                        </div>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" class="footer_table"
        id="tblABC" runat="server">
        <tr>
            <td>
                <cc1:CollectionPager ID="cpGroupAcc" runat="server" BackText="" FirstText="Đầu"
                    ControlCssClass="ProductPage" LabelText="" LastText="Cuối" NextText="" UseSlider="true"
                    ResultsFormat="" BackNextLinkSeparator="" ResultsLocation="None" BackNextLocation="None"
                    PageNumbersSeparator="&nbsp;">
                </cc1:CollectionPager>
            </td>
        </tr>
    </table>
</asp:Content>