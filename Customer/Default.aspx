<%@ Page Title="TRANG CHỦ" Language="C#" MasterPageFile="~/Customer.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Customer_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class ="container">
        <div class ="row">
            <h3 style ="text-align:center; color:#000;">PHÂN HẠNG THẺ THÀNH VIÊN TRÊN SUCMANHCONG.COM</h3>
        </div>
        <div class ="row" style ="margin-top:30px;">
            <div class ="col-md-4">
                <div style ="width:99%; height:500px; background-color:#f6f6f6; text-align:center;">
                    <div style ="width:100%; height:115px; background-color:#42bacc; text-align:center; padding-top:50px; color:#fff; font-weight:bold; font-size:20px;">
                        THẺ HẠNG ĐỒNG
                    </div>
                     <div style ="width:100%; height:95px;text-align:center; padding-top:30px; color:#9acf1c; border-bottom:dotted 1px #fff; font-size:20px;">
                        20,000,000 đ
                    </div>
                    <div style = "width:100%;">
                        <br />
                        <br />
                        <p>
                            Được hưởng 20% chiết khấu hoá đơn
                        </p>
                        <p>
                            Được hưởng 3% tích luỹ thẻ
                        </p>
                        <p>
                            Được quyền lợi abc khác
                        </p>
                         <p>
                            Được quyền lợi abc khác
                        </p>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="btnAction1" runat="server" Text="Nâng cấp" CssClass ="btn btn-danger" Enabled = "false" />
                    </div>
                </div>
            </div>
            <div class ="col-md-4">
                <div style ="width:99%; height:500px; background-color:#f6f6f6; text-align:center;">
                    <div style ="width:100%; height:115px; background-color:#00cc7d; text-align:center; padding-top:50px; color:#fff; font-weight:bold; font-size:20px;">
                        THẺ HẠNG BẠC
                    </div>
                     <div style ="width:100%; height:95px;text-align:center; padding-top:30px; color:#9acf1c; border-bottom:dotted 1px #fff; font-size:20px;">
                        30,000,000 đ
                    </div>
                    <div style = "width:100%;">
                        <br />
                        <br />
                        <p>
                            Được hưởng 25% chiết khấu hoá đơn
                        </p>
                        <p>
                            Được hưởng 3% tích luỹ thẻ
                        </p>
                        <p>
                            Được quyền lợi abc khác
                        </p>
                         <p>
                            Được quyền lợi abc khác
                        </p>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Nâng cấp" CssClass ="btn btn-primary" />
                    </div>
                </div>
            </div>
            <div class ="col-md-4">
                <div style ="width:99%; height:500px; background-color:#f6f6f6; text-align:center;">
                    <div style ="width:100%; height:115px; background-color:#00cc7d; text-align:center; padding-top:50px; color:#fff; font-weight:bold; font-size:20px;">
                        THẺ HẠNG VÀNG
                    </div>
                     <div style ="width:100%; height:95px;text-align:center; padding-top:30px; color:#9acf1c; border-bottom:dotted 1px #fff; font-size:20px;">
                        50,000,000 đ
                    </div>
                    <div style = "width:100%;">
                        <br />
                        <br />
                        <p>
                            Được hưởng 35% chiết khấu hoá đơn
                        </p>
                        <p>
                            Được hưởng 5% tích luỹ thẻ
                        </p>
                        <p>
                            Được quyền lợi abc khác
                        </p>
                         <p>
                            Được quyền lợi abc khác
                        </p>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="Button2" runat="server" Text="Nâng cấp" CssClass ="btn btn-primary"/>
                    </div>
                </div>
            </div>
        </div>
        <div class ="row" style = "margin-top:30px;">
            <h4>Tìm hiểu thông tin thêm về các loại thẻ ...</h4>
        </div>
    </div>
</asp:Content>

