<%@ Page Title="" Language="C#" MasterPageFile="~/Store.master" AutoEventWireup="true" CodeFile="Detailt.aspx.cs" Inherits="Store_Detailt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-6">
                <div style="font-family: Arial; font-size: 15px; font-weight: bold; text-transform: uppercase; display: table; vertical-align: middle;">
                    <% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Name"].ToString()); else Response.Write("&nbsp;"); %>
                    <br />
                    <span style="font-size: 12px; font-weight: normal;">
                        <% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Address"].ToString()); else Response.Write("&nbsp;"); %>
                    </span>
                </div>
            </div>
            <div class="col-md-6">
                <div style="float: right;">
                    <div style="float: left; margin-right: 8px;">
                        <button type="button" class="btn btn-warning">Mới cập nhật</button>
                    </div>
                    <div style="float: left; margin-right: 8px;">
                        <button type="button" class="btn btn-success">Hot nhất</button>
                    </div>
                    <div style="float: left; margin-right: 8px;">
                        <button type="button" class="btn btn-info">Giá tốt</button>
                    </div>
                    <div style="float: left; margin-right: 8px;">
                        <button type="button" class="btn btn-primary">Sắp hết hạn</button>
                    </div>
                    <div style="float: right;">
                        <button type="button" class="btn btn-secondary">Giảm giá</button>
                    </div>
                </div>
            </div>
        </div>
        <hr />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div style="width: 100%; background-color: #f6f6f6; border: solid 1px #c6c6c6;">
                    <div style="padding: 5px;">
                        <h5>THÔNG TIN LIÊN HỆ</h5>
                        Điện thoại: 0912 434 134
                        <br />
                        Email: info@sucmanhcong.com
                        <br />
                        Website:www.sucmanhcong.com
                    </div>
                     <img style ="width:98%; padding-left:5px; margin-bottom:10px;" src ="../images/Partner/<% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Image"].ToString()); else Response.Write("NpImg.jpg"); %>" alt = "Hinh dai dien" />
                    <div style ="margin-bottom:10px;">
                        <center>
                        <img src ="../images/Products/Map1.png" />
                            </center>
                    </div>
                </div>
                <br />
                <div style="border: solid 1px #f6f6f6; height: 382px;">
                    <div>
                        <img src="../images/Products/Stock-Img4.jpg" alt="San pham 1" style="width: 100%;" />
                    </div>
                    <div style="font-family: Arial; font-size: 13px; font-weight: bold; text-align: justify; padding: 5px; color: #414441; height: 45px; overflow: hidden;">
                        Uống Bia Tẹt Ga Chỉ Với 60.000 VNĐ Tại Nhà Hàng HD Beer Club
                    </div>
                    <div style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                        <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;">60,000&nbsp;<sup><u>đ</u></sup></span>
                    </div>
                    <div style="text-align: center;">
                        <div style="margin-left: 5px; float: left; width: 47%; background-color: #337ab7; color: #fff; height: 30px; line-height: 30px; display: table; vertical-align: middle;">
                            Nghệ An
                        </div>
                        <div style="margin-right: 5px; float: right; width: 47%; background-color: #ffc000; color: #fff; height: 30px; line-height: 30px; display: block; vertical-align: middle;" class ="DetailtLink" >
                            <a href = "/Store/Detailt.aspx?id=1">Chi tiết</a>
                        </div>
                    </div>
                </div>
                <br />
                <div style="border: solid 1px #f6f6f6; height: 382px;">
                    <div>
                        <img src="../images/Products/Stock-Img1.jpg" alt="San pham 1" style="width: 100%;" />
                    </div>
                    <div style="font-family: Arial; font-size: 13px; font-weight: bold; text-align: justify; padding: 5px; color: #414441; height: 45px; overflow: hidden;">
                        Lẩu Nấm Băng Chuyền Muru Tại Nhà Hàng Lẩu Nấm Muru
                    </div>
                    <div style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                        <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;">150,000&nbsp;<sup><u>đ</u></sup></span>
                    </div>
                    <div style="text-align: center;">
                        <div style="margin-left: 5px; float: left; width: 47%; background-color: #337ab7; color: #fff; height: 30px; line-height: 30px; display: table; vertical-align: middle;">
                            Nghệ An
                        </div>
                        <div style="margin-right: 5px; float: right; width: 47%; background-color: #ffc000; color: #fff; height: 30px; line-height: 30px; display: block; vertical-align: middle;" class="DetailtLink">
                            <a href="/Store/Detailt.aspx?id=1">Chi tiết</a>
                        </div>
                    </div>
                </div>
                <br />
                <div style="border: solid 1px #f6f6f6; height: 382px;">
                    <div>
                        <img src="../images/Products/Stock-Img2.jpg" alt="San pham 1" style="width: 100%;" />
                    </div>
                    <div style="font-family: Arial; font-size: 13px; font-weight: bold; text-align: justify; padding: 5px; color: #414441; height: 45px; overflow: hidden;">
                        Set nướng dành cho 6 người tại nhà hàng Khoắng Nướng
                    </div>
                    <div style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                        <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;">390,000&nbsp;<sup><u>đ</u></sup></span>
                    </div>
                    <div style="text-align: center;">
                        <div style="margin-left: 5px; float: left; width: 47%; background-color: #337ab7; color: #fff; height: 30px; line-height: 30px; display: table; vertical-align: middle;">
                            Nghệ An
                        </div>
                        <div style="margin-right: 5px; float: right; width: 47%; background-color: #ffc000; color: #fff; height: 30px; line-height: 30px; display: block; vertical-align: middle;" class ="DetailtLink" >
                            <a href = "/Store/Detailt.aspx?id=1">Chi tiết</a>
                        </div>
                    </div>
                </div>
                <br />
                <div style="border: solid 1px #f6f6f6; height: 382px;">
                    <div>
                        <img src="../images/Products/Stock-Img6.jpg" alt="San pham 1" style="width: 100%;" />
                    </div>
                    <div style="font-family: Arial; font-size: 13px; font-weight: bold; text-align: justify; padding: 5px; color: #414441; height: 45px; overflow: hidden;">
                        Set Lẩu Ếch Và 2 Suất Bê Thui Cầu Mống Dành Cho 4 Người
                    </div>
                    <div style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                        <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;">220,000&nbsp;<sup><u>đ</u></sup></span>
                    </div>
                    <div style="text-align: center;">
                        <div style="margin-left: 5px; float: left; width: 47%; background-color: #337ab7; color: #fff; height: 30px; line-height: 30px; display: table; vertical-align: middle;">
                            Nghệ An
                        </div>
                        <div style="margin-right: 5px; float: right; width: 47%; background-color: #ffc000; color: #fff; height: 30px; line-height: 30px; display: block; vertical-align: middle;" class ="DetailtLink" >
                            <a href = "/Store/Detailt.aspx?id=1">Chi tiết</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-9" style="float: left; width: 75%; height: 100%; vertical-align: top; text-align: justify;">
                <h3 style="text-align: justify; font-family: Arial; font-size: 16px; font-weight: bold; padding-top: 0px;"><% Response.Write(this.objTable.Rows[0]["Name"].ToString()); %></h3>
                <hr style="width: 98%; color: #00ffff;" />
                <div style="width: 100%; text-align: justify; margin-top: 0px;">
                    <% Response.Write(this.objTable.Rows[0]["Content"].ToString()); %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

