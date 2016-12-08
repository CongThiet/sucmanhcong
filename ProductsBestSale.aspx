<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductsBestSale.aspx.cs" Inherits="ProductsBestSale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-6">
                <div style="font-family: Arial; font-size: 15px; font-weight: bold; text-transform: uppercase; display: table; vertical-align: middle;">
                    SẢN PHẨM BÁN CHẠY
                    <br />
                    <span style="font-size: 12px; font-weight: normal;">
                        Hiện tại có 1,123 sản phẩm
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
            <div class="sanpham">
                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[0]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[0]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                122
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[0]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[0]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 123" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[1]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[1]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                328
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[1]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[1]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 58" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[2]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[2]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                53
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[2]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <%--<span style ="background-image:url('/images/DiscountBg.png'); background-repeat:no-repeat; font-size:20px; color:#fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[2]["Discount"].ToString()); %>% &nbsp;</span>--%>
                        </p>

                        <input type="button" value="Đã mua: 88" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[3]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[3]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[3]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[3]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                126
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[3]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[3]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 208" style="margin-top: -46px;" />
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="sanpham">
                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[0]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[0]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                122
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[0]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[0]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 123" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[1]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[1]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                328
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[1]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[1]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 58" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[2]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[2]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                53
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[2]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <%--<span style ="background-image:url('/images/DiscountBg.png'); background-repeat:no-repeat; font-size:20px; color:#fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[2]["Discount"].ToString()); %>% &nbsp;</span>--%>
                        </p>

                        <input type="button" value="Đã mua: 88" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[3]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[3]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[3]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[3]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                126
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[3]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[3]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 208" style="margin-top: -46px;" />
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="sanpham">
                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[0]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[0]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                122
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[0]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[0]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 123" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[1]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[1]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                328
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[1]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[1]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 58" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[2]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[2]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                53
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[2]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <%--<span style ="background-image:url('/images/DiscountBg.png'); background-repeat:no-repeat; font-size:20px; color:#fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[2]["Discount"].ToString()); %>% &nbsp;</span>--%>
                        </p>

                        <input type="button" value="Đã mua: 88" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[3]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[3]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[3]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[3]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                126
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[3]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[3]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 208" style="margin-top: -46px;" />
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="sanpham">
                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[0]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[0]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                122
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[0]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[0]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 123" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[1]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[1]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                328
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[1]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[1]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 58" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[2]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[2]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                53
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[2]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <%--<span style ="background-image:url('/images/DiscountBg.png'); background-repeat:no-repeat; font-size:20px; color:#fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[2]["Discount"].ToString()); %>% &nbsp;</span>--%>
                        </p>

                        <input type="button" value="Đã mua: 88" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[3]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[3]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[3]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[3]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                126
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[3]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[3]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 208" style="margin-top: -46px;" />
                    </div>
                </div>

            </div>
        </div>
        <div class="row">
            <div class="sanpham">
                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[0]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[0]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                122
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[0]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[0]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 123" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[1]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[1]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                328
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[1]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[1]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 58" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[2]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[2]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                53
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[2]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <%--<span style ="background-image:url('/images/DiscountBg.png'); background-repeat:no-repeat; font-size:20px; color:#fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[2]["Discount"].ToString()); %>% &nbsp;</span>--%>
                        </p>

                        <input type="button" value="Đã mua: 88" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[3]["Id"].ToString()); %>">
                            <img src="images/Products/<%Response.Write(this.objTableProductVIP.Rows[3]["Image"].ToString()); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%Response.Write(this.objTableProductVIP.Rows[3]["Id"].ToString()); %>"><%Response.Write(this.objTableProductVIP.Rows[3]["Name"].ToString()); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                126
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%Response.Write(this.objTableProductVIP.Rows[3]["Price"].ToString()); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%Response.Write(this.objTableProductVIP.Rows[3]["Discount"].ToString()); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 208" style="margin-top: -46px;" />
                    </div>
                </div>

            </div>
        </div>

    </div>
</asp:Content>

