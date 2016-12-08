<%@ Page Title="TRANG CHỦ" Language="C#" MasterPageFile="~/mCustomer.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="mCustomer_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="row" style="font-size: 12px; text-align: center; font-weight: bold; padding: 10px;">
            PHÂN HẠNG THẺ THÀNH VIÊN TRÊN SUCMANHCONG.COM
        </div>
        <div class="row" style = "border:solid 1px #42bacc;">
            <div style="width: 100%; height: 45px; background-color: #42bacc; text-align: center; padding-top: 8px; color: #fff; font-weight: bold; font-size: 20px;">
                THẺ HẠNG ĐỒNG
            </div>
            <div style="width: 100%; height: 50px; text-align: center; padding-top: 10px; color: #9acf1c; border-bottom: dotted 1px #fff; font-size: 20px;">
                30,000 đ
            </div>
            <div style="width: 100%; padding-left:10px;">
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
                <asp:Button ID="btnAction1" runat="server" Text="Nâng cấp" CssClass="btn btn-danger" Enabled="false" />
                <br />
                <br />
            </div>
        </div>
        <br />
         <div class="row" style = "border:solid 1px #00cc7d;">
            <div style="width: 100%; height: 45px; background-color: #00cc7d; text-align: center; padding-top: 8px; color: #fff; font-weight: bold; font-size: 20px;">
                THẺ HẠNG BẠC
            </div>
            <div style="width: 100%; height: 50px; text-align: center; padding-top: 10px; color: #9acf1c; border-bottom: dotted 1px #fff; font-size: 20px;">
                360,000 đ
            </div>
            <div style="width: 100%; padding-left:10px;">
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
                <asp:Button ID="Button1" runat="server" Text="Nâng cấp" CssClass="btn btn-primary" Enabled="false" />
                <br />
                <br />
            </div>
        </div>
        <br />
         <div class="row" style = "border:solid 1px #00cc7d;">
            <div style="width: 100%; height: 45px; background-color: #00cc7d; text-align: center; padding-top: 8px; color: #fff; font-weight: bold; font-size: 20px;">
                THẺ HẠNG VÀNG
            </div>
            <div style="width: 100%; height: 50px; text-align: center; padding-top: 10px; color: #9acf1c; border-bottom: dotted 1px #fff; font-size: 20px;">
                1,000,000 đ
            </div>
            <div style="width: 100%; padding-left:10px;">
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
                <asp:Button ID="Button2" runat="server" Text="Nâng cấp" CssClass="btn btn-primary" Enabled="false" />
                <br />
                <br />
            </div>
        </div>
        <br />
    </div>
</asp:Content>

