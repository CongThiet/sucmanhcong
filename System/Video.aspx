<%@ Page Title="QUẢN LÝ BANNER" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Video.aspx.cs" Inherits="Video" %>

<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style ="width:100%; height:32px; line-height:30px; background-color:#dde8ec; font-family:Arial; font-size:13px; font-weight:bold; text-transform:uppercase;">
        <div style ="float:left;">&nbsp;&nbsp;VIDEO</div>
        <div style ="float:right;"><a href ="VideoEdit.aspx"><span style ="border:solid 1px #f8fbfc; padding:5px; font-size:11px; font-weight:bold; padding-left:20px; padding-right:20px;">Thêm mới</span></a>&nbsp;</div>
    </div>
    <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal" RepeatColumns="4"
        Width="100%">
        <ItemTemplate>
            <table cellpadding="0" cellspacing="1" border="0" style="margin: 0px; width: 99.9%; height: 30px;">
                <tr>   
                    <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 15px; color: #000; background-color: #FFF; width: 100%;">
                        <div style="float: left; display: table-cell; line-height: 30px; width: 100%; height: 30px; text-align: center; padding-left: 5px; vertical-align: middle; font-size: 15px;">
                                <%# Eval("Name") %>
                        </div>
                    </td>
                </tr>
                 <tr>   
                    <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 15px; color: #000; background-color: #FFF; width: 100%;">
                        <div style="float: left; display: table-cell; line-height: 160px; width: 100%; height: 165px; text-align: center; vertical-align: middle; font-size: 15px; margin-top:10px;">
                                <%# Eval("Url") %>
                        </div>
                    </td>
                </tr>
                <tr>   
                    <td style="text-align: center; vertical-align: middle; font-family: Arial; font-size: 11px; color: #fff; background-color: #FFF; width: 100%;">
                        <div style="float: left; display: table-cell; line-height: 34px; width: 100%; height: 34px; text-align: right; vertical-align: middle; font-size: 11px; font-weight:bold;">
                            <a style="vertical-align: middle;" href="VideoEdit.aspx?Id=<%# Eval("Id") %>">
                                THAY ĐỔI
                            </a>
                            &nbsp;&nbsp;
                            <a style="vertical-align: middle;" href="#">
                                XÓA VIDEO
                            </a>
                            &nbsp;&nbsp;&nbsp;
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

