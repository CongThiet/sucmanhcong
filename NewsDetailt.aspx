<%@ Page Title="TIN TỨC" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewsDetailt.aspx.cs" Inherits="NewsDetailt" %>

<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div style="width: 92%; margin: auto; display: table; margin-bottom: 20px; margin-top: 10px;">
            <div class="row">
                <div class="col-md-9" style="float: left; width: 75%; height: 100%; vertical-align: top; text-align: justify;">
                    <h3 style="text-align: justify; font-family: Arial; font-size: 16px; font-weight: bold; padding-top: 5px;"><a href="/">TRANG CHỦ</a> >> <a href="#">TIN TỨC</a></h3>
                    <hr style="width: 98%; color: #00ffff;" />
                    <div style="width: 98%; text-align: justify; margin-top:10px;">
                        <h3 style="font-family: Arial; font-size: 16px; font-weight: bold; text-align: justify;"><% Response.Write(this.objTable.Rows[0]["Title"].ToString()); %></h3>
                        
                        <div style="font-family: Arial; font-size: 14.5px; font-weight: bold; text-align: justify; margin-top: 15px; margin-bottom: 15px; color: #252726;">
                            <% Response.Write(this.objTable.Rows[0]["ShortContent"].ToString()); %>
                        </div>
                        <% Response.Write(this.objTable.Rows[0]["Content"].ToString()); %>
                    </div>
                </div>
                <div class="col-md-3" style="float: right; width: 25%; height: 100%; display: table;">

                    <h3 style="font-family: Arial; font-size: 18px; font-weight: bold; margin-top: 26px; margin-bottom:13px;">TIN LIÊN QUAN</h3>

                    <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal" RepeatColumns="1" ItemStyle-BorderStyle="None" Width="100%" Style="margin-left: -10px;">
                        <ItemTemplate>
                            <div class ="NewsRightLink" style ="font-family:Arial; font-size:15px; font-weight:bold; padding-top:5px; padding-bottom:5px; text-align:justify;">
                                <a href = "NewsDetailt.aspx?id=<%# Eval("Id") %>"><%# Eval("Title") %><span style ="font-weight:normal; font-style:italic;">(<%# Eval("DayCreate1") %>)</span></a>
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

