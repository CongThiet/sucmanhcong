<%@ Page Title="SUCMANGCONG" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="top_main">
            <div class="row">
                <div class="col-md-12">
                    <div class="slide">
                        <script type="text/javascript" src="js/jssor.slider-21.1.5.min.js"></script>
                        <!-- use jssor.slider-21.1.5.debug.js instead for debug -->

                        <script>
                            jssor_1_slider_init = function () {

                                var jssor_1_SlideoTransitions = [
                                  [{ b: 0, d: 1140, y: -290, e: { y: 27 } }],
                                  [{ b: 0, d: 1000, y: 185 }, { b: 1000, d: 500, o: -1 }, { b: 1500, d: 500, o: 1 }, { b: 2000, d: 1500, r: 360 }, { b: 3500, d: 1000, rX: 30 }, { b: 4500, d: 500, rX: -30 }, { b: 5000, d: 1000, rY: 30 }, { b: 6000, d: 500, rY: -30 }, { b: 6500, d: 500, sX: 1 }, { b: 7000, d: 500, sX: -1 }, { b: 7500, d: 500, sY: 1 }, { b: 8000, d: 500, sY: -1 }, { b: 8500, d: 500, kX: 30 }, { b: 9000, d: 500, kX: -30 }, { b: 9500, d: 500, kY: 30 }, { b: 10000, d: 500, kY: -30 }, { b: 10500, d: 500, c: { x: 87.50, t: -87.50 } }, { b: 11000, d: 500, c: { x: -87.50, t: 87.50 } }],
                                  [{ b: 0, d: 1140, x: 410, e: { x: 27 } }],
                                  [{ b: -1, d: 1, o: -1 }, { b: 0, d: 600, o: 1, e: { o: 5 } }],
                                  [{ b: -1, d: 1, c: { x: 175.0, t: -175.0 } }, { b: 0, d: 800, c: { x: -175.0, t: 175.0 }, e: { c: { x: 7, t: 7 } } }],
                                  [{ b: -1, d: 1, o: -1 }, { b: 0, d: 600, x: -570, o: 1, e: { x: 6 } }],
                                  [{ b: -1, d: 1, o: -1, r: -180 }, { b: 0, d: 800, o: 1, r: 180, e: { r: 7 } }],
                                  [{ b: 0, d: 1000, y: 80, e: { y: 24 } }, { b: 1000, d: 1100, x: 570, y: 170, o: -1, r: 30, sX: 9, sY: 9, e: { x: 2, y: 6, r: 1, sX: 5, sY: 5 } }],
                                  [{ b: 2000, d: 1140, rY: 30 }],
                                  [{ b: 0, d: 500, x: -105 }, { b: 500, d: 500, x: 230 }, { b: 1000, d: 500, y: -120 }, { b: 1500, d: 500, x: -70, y: 120 }, { b: 2600, d: 500, y: -80 }, { b: 3100, d: 900, y: 160, e: { y: 24 } }],
                                  [{ b: 0, d: 1000, o: -0.4, rX: 2, rY: 1 }, { b: 1000, d: 1000, rY: 1 }, { b: 2000, d: 1000, rX: -1 }, { b: 3000, d: 1000, rY: -1 }, { b: 4000, d: 1000, o: 0.4, rX: -1, rY: -1 }]
                                ];

                                var jssor_1_options = {
                                    $AutoPlay: true,
                                    $Idle: 2000,
                                    $CaptionSliderOptions: {
                                        $Class: $JssorCaptionSlideo$,
                                        $Transitions: jssor_1_SlideoTransitions,
                                        $Breaks: [
                                          [{ d: 2000, b: 1000 }]
                                        ]
                                    },
                                    $ArrowNavigatorOptions: {
                                        $Class: $JssorArrowNavigator$
                                    },
                                    $BulletNavigatorOptions: {
                                        $Class: $JssorBulletNavigator$
                                    }
                                };

                                var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

                                //responsive code begin
                                //you can remove responsive code if you don't want the slider scales while window resizing
                                function ScaleSlider() {
                                    var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                                    if (refSize) {
                                        refSize = Math.min(refSize, 1140);
                                        jssor_1_slider.$ScaleWidth(refSize);
                                    }
                                    else {
                                        window.setTimeout(ScaleSlider, 30);
                                    }
                                }
                                ScaleSlider();
                                $Jssor$.$AddEvent(window, "load", ScaleSlider);
                                $Jssor$.$AddEvent(window, "resize", ScaleSlider);
                                $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
                                //responsive code end
                            };
                        </script>

                        <style>
                            /* jssor slider bullet navigator skin 01 css */
                            /*
                            .jssorb01 div           (normal)
                            .jssorb01 div:hover     (normal mouseover)
                            .jssorb01 .av           (active)
                            .jssorb01 .av:hover     (active mouseover)
                            .jssorb01 .dn           (mousedown)
                            */
                            .jssorb01 {
                                position: absolute;
                            }

                                .jssorb01 div, .jssorb01 div:hover, .jssorb01 .av {
                                    position: absolute;
                                    /* size of bullet elment */
                                    width: 12px;
                                    height: 12px;
                                    filter: alpha(opacity=70);
                                    opacity: .7;
                                    overflow: hidden;
                                    cursor: pointer;
                                    border: #000 1px solid;
                                }

                                .jssorb01 div {
                                    background-color: gray;
                                }

                                    .jssorb01 div:hover, .jssorb01 .av:hover {
                                        background-color: #d3d3d3;
                                    }

                                .jssorb01 .av {
                                    background-color: #fff;
                                }

                                .jssorb01 .dn, .jssorb01 .dn:hover {
                                    background-color: #555555;
                                }

                            /* jssor slider arrow navigator skin 02 css */
                            /*
                            .jssora02l                  (normal)
                            .jssora02r                  (normal)
                            .jssora02l:hover            (normal mouseover)
                            .jssora02r:hover            (normal mouseover)
                            .jssora02l.jssora02ldn      (mousedown)
                            .jssora02r.jssora02rdn      (mousedown)
                            */
                            .jssora02l, .jssora02r {
                                display: block;
                                position: absolute;
                                /* size of arrow element */
                                width: 55px;
                                height: 55px;
                                cursor: pointer;
                                background: url('img/a02.png') no-repeat;
                                overflow: hidden;
                            }

                            .jssora02l {
                                background-position: -3px -33px;
                            }

                            .jssora02r {
                                background-position: -63px -33px;
                            }

                            .jssora02l:hover {
                                background-position: -123px -33px;
                            }

                            .jssora02r:hover {
                                background-position: -183px -33px;
                            }

                            .jssora02l.jssora02ldn {
                                background-position: -3px -33px;
                            }

                            .jssora02r.jssora02rdn {
                                background-position: -63px -33px;
                            }
                        </style>

                        <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 1140px; height: 238px; overflow: hidden; visibility: hidden;">
                            <!-- Loading Screen -->
                            <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
                                <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                                <div style="position: absolute; display: block; background: url('img/loading.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
                            </div>
                            <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 1140px; height: 238px; overflow: hidden;">
                                <div data-p="112.50" style="display: none;">
                                    <img data-u="image" src="images/slide.jpg" />
                                    <div data-u="caption" data-t="0" style="position: absolute; top: 320px; left: 30px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.5); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center; font-size: 18px;">SUCMANHCONG.COM - SLIDE DEMO</div>
                                </div>
                                <div data-p="112.50" style="display: none;">
                                    <img data-u="image" src="images/slide.jpg" />
                                    <div data-u="caption" data-t="1" data-3d="1" style="position: absolute; top: -50px; left: 125px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.5); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center; font-size: 18px;">SUCMANHCONG.COM - SLIDE DEMO</div>
                                </div>
                                <div data-p="112.50" style="display: none;">
                                    <img data-u="image" src="images/slide.jpg" />
                                    <div data-u="caption" data-t="2" style="position: absolute; top: 30px; left: -380px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.5); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center; font-size: 18px;">SUCMANHCONG.COM - SLIDE DEMO</div>
                                </div>
                                <div data-p="112.50" style="display: none;">
                                    <img data-u="image" src="images/slide.jpg" />
                                    <div data-u="caption" data-t="3" style="position: absolute; top: 30px; left: 30px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.5); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center; font-size: 18px;">SUCMANHCONG.COM - SLIDE DEMO</div>
                                </div>
                                <div data-p="112.50" style="display: none;">
                                    <img data-u="image" src="images/slide.jpg" />
                                    <div data-u="caption" data-t="4" style="position: absolute; top: 30px; left: 30px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.6); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center; font-size: 18px;">SUCMANHCONG.COM - SLIDE DEMO</div>
                                </div>
                                <div data-p="112.50" style="display: none;">
                                    <img data-u="image" src="images/slide.jpg" />
                                    <div data-u="caption" data-t="5" style="position: absolute; top: 30px; left: 600px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.5); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center;">SUCMANHCONG.COM - SLIDE DEMO</div>
                                </div>
                                <div data-p="112.50" style="display: none;">
                                    <img data-u="image" src="images/slide.jpg" />
                                    <div data-u="caption" data-t="6" style="position: absolute; top: 30px; left: 30px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.5); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center;">SUCMANHCONG.COM - SLIDE DEMO</div>
                                </div>
                                <div data-b="0" data-p="112.50" style="display: none;">
                                    <img data-u="image" src="images/slide.jpg" />
                                    <div data-u="caption" data-t="7" style="position: absolute; top: -50px; left: 30px; width: 350px; height: 30px; background-color: rgba(235,81,0,0.5); font-size: 20px; color: #ffffff; line-height: 30px; text-align: center;">SUCMANHCONG.COM - SLIDE DEMO</div>
                                </div>
                                <div data-p="112.50" style="display: none;">
                                    <img data-u="image" src="images/slide.jpg" />
                                    <div data-u="caption" data-t="8" data-3d="1" style="position: absolute; top: 25px; left: 150px; width: 250px; height: 250px; background-color: rgba(40,177,255,0.6); overflow: hidden;">
                                        <div data-u="caption" data-t="9" style="position: absolute; top: 100px; left: 25px; width: 200px; height: 50px; font-size: 24px; line-height: 50px;">SUCMANHCONG.COM - SLIDE DEMO</div>
                                    </div>
                                </div>
                            </div>
                            <!-- Bullet Navigator -->
                            <div data-u="navigator" class="jssorb01" style="bottom: 16px; right: 16px;">
                                <div data-u="prototype" style="width: 12px; height: 12px;"></div>
                            </div>
                            <!-- Arrow Navigator -->
                            <span data-u="arrowleft" class="jssora02l" style="top: 0px; left: 8px; width: 55px; height: 55px;" data-autocenter="2"></span>
                            <span data-u="arrowright" class="jssora02r" style="top: 0px; right: 8px; width: 55px; height: 55px;" data-autocenter="2"></span>
                        </div>

                        <script>
                            jssor_1_slider_init();
                        </script>
                        <!-- #endregion Jssor Slider End -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="menu">
                    <a href="/ProductsVIP.aspx"><i class="glyphicon glyphicon-th-list"></i>
                        <br />
                        <span style="margin-top: -20px; font-size: 11px; font-family: Arial; font-weight: bold; text-transform: uppercase; color: #01a44b;">
                            SẢN PHẨM VIP</span>

                    </a>
                    <a href="/ProductsBestSale.aspx"><i class="glyphicon glyphicon-th"></i>
                        <br />
                        <span style="margin-top: -20px; font-size: 11px; font-family: Arial; font-weight: bold; text-transform: uppercase; color: #01a44b;">
                            SẢN PHẨM BÁN CHẠY</span>

                    </a>
                    <a href="/StoreVIP.aspx"><i class="glyphicon glyphicon-tower"></i>
                        <br />
                        <span style="margin-top: -20px; font-size: 11px; font-family: Arial; font-weight: bold; text-transform: uppercase; color: #01a44b;">CỬA HÀNG VIP</span></a>
                    <a href="StoreBestSale.aspx"><i class="glyphicon glyphicon-tasks"></i>
                        <br />
                        <span style="margin-top: -20px; font-size: 11px; font-family: Arial; font-weight: bold; text-transform: uppercase; color: #01a44b;">CỬA HÀNG BÁN CHẠY</span></a>
                    <a href=""><i class="glyphicon glyphicon-check"></i>
                        <br />
                        <span style="margin-top: -20px; font-size: 11px; font-family: Arial; font-weight: bold; text-transform: uppercase; color: #01a44b;">ĐỒNG THƯƠNG HIỆU</span></a>
                    <a href=""><i class="glyphicon glyphicon-stats"></i>
                        <br />
                        <span style="margin-top: -20px; font-size: 11px; font-family: Arial; font-weight: bold; text-transform: uppercase; color: #01a44b;">THƯƠNG HIỆU NỔI BẬT</span></a>
                    <a href=""><i class="glyphicon glyphicon-home"></i>
                        <br />
                        <span style="margin-top: -20px; font-size: 11px; font-family: Arial; font-weight: bold; text-transform: uppercase; color: #01a44b;">CHÚNG TÔI</span></a>
                    <a href=""><i class="glyphicon glyphicon-book"></i>
                        <br />
                        <span style="margin-top: -20px; font-size: 11px; font-family: Arial; font-weight: bold; text-transform: uppercase; color: #01a44b;">ĐÀO TẠO</span></a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="phan1">
                <div class="col-md-3">
                    <h2 class="StoreVIPLink">
                        <a href="ProductsVIP.aspx">SẢN PHẨM BÁN CHẠY VIP</a>
                    </h2>
                </div>
                <div class="col-md-9">
                    &nbsp;
                </div>
            </div>
        </div>

        <div class="row">
            <div class="sanpham">
                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<% if (this.objTableProductVIP.Rows.Count > 0) Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); else Response.Write("0"); %>">
                            <img src="images/Products/<% if (this.objTableProductVIP.Rows.Count > 0) Response.Write(this.objTableProductVIP.Rows[0]["Image"].ToString()); else Response.Write("NoImg.png"); %>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<% if (this.objTableProductVIP.Rows.Count > 0) Response.Write(this.objTableProductVIP.Rows[0]["Id"].ToString()); else Response.Write("0"); %>"><%if (this.objTableProductVIP.Rows.Count > 0) Response.Write(this.objTableProductVIP.Rows[0]["Name"].ToString()); else Response.Write(""); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                122
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><% if (this.objTableProductVIP.Rows.Count > 0) Response.Write(this.objTableProductVIP.Rows[0]["Price"].ToString()); else Response.Write("0"); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<% if (this.objTableProductVIP.Rows.Count > 0) Response.Write(this.objTableProductVIP.Rows[0]["Discount"].ToString()); else Response.Write("0"); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 123" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%if (this.objTableProductVIP.Rows.Count > 1) Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); else Response.Write("0"); %>">
                            <img src="images/Products/<% if (this.objTableProductVIP.Rows.Count > 1) Response.Write(this.objTableProductVIP.Rows[1]["Image"].ToString()); else Response.Write("NoImg.png");%>" alt="San pham VIP" /></a>
                        <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; border-bottom: solid 2px #f0f0fb;">
                            <a href="/detailt.aspx?id=<%if (this.objTableProductVIP.Rows.Count > 1) Response.Write(this.objTableProductVIP.Rows[1]["Id"].ToString()); else Response.Write("0");%>"><%if (this.objTableProductVIP.Rows.Count > 1) Response.Write(this.objTableProductVIP.Rows[1]["Name"].ToString()); else Response.Write(""); %></a>
                        </p>
                        <div style="text-align: right; margin-top: -2px;">
                            <div style="font-family: Arial; font-size: 12px; color: #00a84b; font-weight: normal; padding-top: 0px; padding-left: 25px;">
                                <img src="images/User.png" alt="So nguoi thich" style="width: 20px; margin-top: -8px;" />
                                328
                            </div>
                        </div>
                        <p style="font-family: Arial; font-size: 14px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; margin-top: -4px;">
                            <span style="font-family: Arial; font-size: 22px; color: #00a84b; font-weight: normal;"><%if (this.objTableProductVIP.Rows.Count > 1) Response.Write(this.objTableProductVIP.Rows[1]["Price"].ToString()); else Response.Write("0"); %>&nbsp;<sup><u>đ</u></sup></span>
                            <span style="background-image: url('/images/DiscountBg.png'); background-repeat: no-repeat; font-size: 20px; color: #fff;">&nbsp; -<%if (this.objTableProductVIP.Rows.Count > 1) Response.Write(this.objTableProductVIP.Rows[1]["Discount"].ToString()); else Response.Write("0"); %>% &nbsp;</span>
                        </p>

                        <input type="button" value="Đã mua: 58" style="margin-top: -46px;" />
                    </div>
                </div>

                <div class="col-md-3">
                    <div style="background-color: #f9faf5; height: 375px; padding: 5px;">
                        <a href="/detailt.aspx?id=<%if (this.objTableProductVIP.Rows.Count > 2) Response.Write(this.objTableProductVIP.Rows[2]["Id"].ToString()); else Response.Write("0");%>">
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

        <div class="part">
            <div class="row">
                <div class="col-md-3">
                    <h2 class="StoreVIPLink">
                        <a href="ProductsBestSale.aspx">SẢN PHẨM BÁN CHẠY %</a>
                    </h2>
                </div>

                <div class="line">
                    <div class="col-md-7">
                        <img src="images/line.jpg" alt="" />
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="sotrang">
                        <table>
                            <tr>
                                <td><a href=""><i class="fa fa-angle-left"></i></a></td>
                                <td><a href="">1</a></td>
                                <td><a href="">2</a></td>
                                <td><a href="">3</a></td>
                                <td><a href=""><i class="fa fa-angle-right"></i></a></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="sanpham">
                    <asp:DataList ID="dtlBestSale" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" Width="100%" ItemStyle-BorderStyle="None">
                        <ItemTemplate>
                            <div style="background-color: #f9faf5; height: 375px; padding: 5px; margin-bottom: 15px; width: 98%;">
                                <a href="/detailt.aspx?id=<%# Eval("Id") %>">
                                    <img src="images/Products/<%# Eval("Image") %>" alt="San pham VIP" style="width: 253px; height: 252px; margin-left: 2px;" /></a>
                                <p class="ProductLink" style="font-family: Arial; font-size: 15px; font-weight: bold; color: #50505a; padding: 5px; text-align: justify; height: 54px; overflow: hidden; border-bottom: solid 2px #f0f0fb;">
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

                                <input type="button" value="Đã mua: 208" style="margin-top: -42px; margin-left: 155px; font-size: 12px; background-color: #ff7a00; border-color: #ff7a00;" class="btn btn-success" />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>

        <div class="part">
            <div class="row">
                <div class="col-md-3">
                    <h2 class="StoreVIPLink">
                        <a href = "StoreVIP.aspx">CỬA HÀNG BÁN CHẠY VIP</a>
                    </h2>
                </div>
                <div class="line">
                    <div class="col-md-7">
                        <img src="images/line.jpg" alt="" />
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="sotrang">
                        <table>
                            <tr>
                                <td><a href=""><i class="fa fa-angle-left"></i></a></td>
                                <td><a href="">1</a></td>
                                <td><a href="">2</a></td>
                                <td><a href="">3</a></td>
                                <td><a href=""><i class="fa fa-angle-right"></i></a></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="sanpham">
                     <div class="col-md-3">
                            <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Id"].ToString()); else Response.Write("0"); %>">
                                <img src="images/Partner/<% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Image"].ToString()); else Response.Write("noImg.png"); %>" alt="" />
                            </a>
                            <h4 style="font-size: 18px; font-weight: bold; color: #505068; font-family: Arial;">
                                <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Id"].ToString()); else Response.Write("0"); %>">
                                    <% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Name"].ToString()); else Response.Write("&nbsp;"); %>
                                </a>
                            </h4>
                            <p style ="text-align:justify;">
                                <% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Address"].ToString()); else Response.Write("&nbsp;"); %>
                            </p>
                            <p>Điện thoại: <% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Phone"].ToString()); else Response.Write("&nbsp;"); %></p>
                        </div>

                        <div class="col-md-3">
                            <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Id"].ToString()); else Response.Write("0"); %>">
                                <img src="images/Partner/<% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Image"].ToString()); else Response.Write("noImg.png"); %>" alt="" />
                            </a>
                            <h4 style="font-size: 18px; font-weight: bold; color: #505068; font-family: Arial;">
                                <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Id"].ToString()); else Response.Write("0"); %>">
                                    <% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Name"].ToString()); else Response.Write("&nbsp;"); %>
                                </a>
                            </h4>
                            <p style ="text-align:justify;">
                                <% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Address"].ToString()); else Response.Write("&nbsp;"); %>
                            </p>
                            <p>Điện thoại: <% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Phone"].ToString()); else Response.Write("&nbsp;"); %></p>
                        </div>
                        
                        <div class="col-md-3">
                            <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Id"].ToString()); else Response.Write("0"); %>">
                                <img src="images/Partner/<% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Image"].ToString()); else Response.Write("noImg.png"); %>" alt="" />
                            </a>
                            <h4 style="font-size: 18px; font-weight: bold; color: #505068; font-family: Arial;">
                                <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Id"].ToString()); else Response.Write("0"); %>">
                                    <% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Name"].ToString()); else Response.Write("&nbsp;"); %>
                                </a>
                            </h4>
                            <p style ="text-align:justify;">
                                <% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Address"].ToString()); else Response.Write("&nbsp;"); %>
                            </p>
                            <p>Điện thoại: <% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Phone"].ToString()); else Response.Write("&nbsp;"); %></p>
                        </div>

                        <div class="col-md-3">  
                            <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Id"].ToString()); else Response.Write("0"); %>">
                                <img src="images/Partner/<% if (this.objTablePartner.Rows.Count > 3) Response.Write(this.objTablePartner.Rows[3]["Image"].ToString()); else Response.Write("noImg.png"); %>" alt="" />
                            </a>
                            <h4 style="font-size: 18px; font-weight: bold; color: #505068; font-family: Arial;">
                                <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Id"].ToString()); else Response.Write("0"); %>">
                                    <% if (this.objTablePartner.Rows.Count > 3) Response.Write(this.objTablePartner.Rows[3]["Name"].ToString()); else Response.Write("&nbsp;"); %>
                                </a>
                            </h4>
                            <p style ="text-align:justify;">
                                <% if (this.objTablePartner.Rows.Count > 3) Response.Write(this.objTablePartner.Rows[3]["Address"].ToString()); else Response.Write("&nbsp;"); %>
                            </p>
                            <p>Điện thoại: <% if (this.objTablePartner.Rows.Count > 3) Response.Write(this.objTablePartner.Rows[3]["Phone"].ToString()); else Response.Write("&nbsp;"); %></p>
                        </div>
                </div>
            </div>

            <div class="part">
                <div class="row">
                    <div class="col-md-3">
                        <h2 class="StoreVIPLink">
                            <a href="StoreBestSale.aspx">CỬA HÀNG BÁN CHẠY</a>
                        </h2>
                    </div>
                    <div class="line">
                        <div class="col-md-7">
                            <img src="images/line.jpg" alt="" />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="sotrang">
                            <table>
                                <tr>
                                    <td><a href=""><i class="fa fa-angle-left"></i></a></td>
                                    <td><a href="">1</a></td>
                                    <td><a href="">2</a></td>
                                    <td><a href="">3</a></td>
                                    <td><a href=""><i class="fa fa-angle-right"></i></a></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="sanpham">
                        <div class="col-md-3">
                            <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Id"].ToString()); else Response.Write("0"); %>">
                                <img src="images/Partner/<% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Image"].ToString()); else Response.Write("noImg.png"); %>" alt="" />
                            </a>
                            <h4 style="font-size: 18px; font-weight: bold; color: #505068; font-family: Arial;">
                                <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Id"].ToString()); else Response.Write("0"); %>">
                                    <% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Name"].ToString()); else Response.Write("&nbsp;"); %>
                                </a>
                            </h4>
                            <p style ="text-align:justify;">
                                <% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Address"].ToString()); else Response.Write("&nbsp;"); %>
                            </p>
                            <p>Điện thoại: <% if (this.objTablePartner.Rows.Count > 0) Response.Write(this.objTablePartner.Rows[0]["Phone"].ToString()); else Response.Write("&nbsp;"); %></p>
                        </div>

                        <div class="col-md-3">
                            <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Id"].ToString()); else Response.Write("0"); %>">
                                <img src="images/Partner/<% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Image"].ToString()); else Response.Write("noImg.png"); %>" alt="" />
                            </a>
                            <h4 style="font-size: 18px; font-weight: bold; color: #505068; font-family: Arial;">
                                <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Id"].ToString()); else Response.Write("0"); %>">
                                    <% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Name"].ToString()); else Response.Write("&nbsp;"); %>
                                </a>
                            </h4>
                            <p style ="text-align:justify;">
                                <% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Address"].ToString()); else Response.Write("&nbsp;"); %>
                            </p>
                            <p>Điện thoại: <% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Phone"].ToString()); else Response.Write("&nbsp;"); %></p>
                        </div>
                        
                        <div class="col-md-3">
                            <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Id"].ToString()); else Response.Write("0"); %>">
                                <img src="images/Partner/<% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Image"].ToString()); else Response.Write("noImg.png"); %>" alt="" />
                            </a>
                            <h4 style="font-size: 18px; font-weight: bold; color: #505068; font-family: Arial;">
                                <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Id"].ToString()); else Response.Write("0"); %>">
                                    <% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Name"].ToString()); else Response.Write("&nbsp;"); %>
                                </a>
                            </h4>
                            <p style ="text-align:justify;">
                                <% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Address"].ToString()); else Response.Write("&nbsp;"); %>
                            </p>
                            <p>Điện thoại: <% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Phone"].ToString()); else Response.Write("&nbsp;"); %></p>
                        </div>

                        <div class="col-md-3">  
                            <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 1) Response.Write(this.objTablePartner.Rows[1]["Id"].ToString()); else Response.Write("0"); %>">
                                <img src="images/Partner/<% if (this.objTablePartner.Rows.Count > 3) Response.Write(this.objTablePartner.Rows[3]["Image"].ToString()); else Response.Write("noImg.png"); %>" alt="" />
                            </a>
                            <h4 style="font-size: 18px; font-weight: bold; color: #505068; font-family: Arial;">
                                <a href="/Store/?id=<% if (this.objTablePartner.Rows.Count > 2) Response.Write(this.objTablePartner.Rows[2]["Id"].ToString()); else Response.Write("0"); %>">
                                    <% if (this.objTablePartner.Rows.Count > 3) Response.Write(this.objTablePartner.Rows[3]["Name"].ToString()); else Response.Write("&nbsp;"); %>
                                </a>
                            </h4>
                            <p style ="text-align:justify;">
                                <% if (this.objTablePartner.Rows.Count > 3) Response.Write(this.objTablePartner.Rows[3]["Address"].ToString()); else Response.Write("&nbsp;"); %>
                            </p>
                            <p>Điện thoại: <% if (this.objTablePartner.Rows.Count > 3) Response.Write(this.objTablePartner.Rows[3]["Phone"].ToString()); else Response.Write("&nbsp;"); %></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="part">
                <div class="row">
                    <div class="col-md-3">
                        <h2 style="font-family: Arial; font-size: 18px; font-weight: bold; color: black; padding-top: 18px; padding-left: 25px; color: #4e4e57;">ĐỒNG THƯƠNG HIỆU</h2>
                    </div>
                    <div class="line">
                        <div class="col-md-7">
                            <img src="images/line.jpg" alt="" />
                        </div>
                    </div>
                    <div class="col-lg-2" style="text-align: right; margin-top: 42px;">
                        <div class="btn-group">
                            <button type="button" class="btn btn-danger">Xem tất cả</button>
                            <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="thuonghieu">

                    <div class="row">
                        <div class="col-md-3">
                            <img src="images/dongthuonghieubg.png" alt="" />
                        </div>
                        <div class="col-md-3">
                            <img src="images/dth1.JPG" alt="" style="border: solid 1px #f4f4f4; padding: 10px;" />
                            <img src="images/dth2.JPG" alt="" style="border: solid 1px #f4f4f4; padding: 10px; margin-top: 10px;" />
                        </div>
                        <div class="col-md-3">
                            <img src="images/dth3.JPG" alt="" style="border: solid 1px #f4f4f4; padding: 10px;" />
                            <img src="images/dth4.JPG" alt="" style="border: solid 1px #f4f4f4; padding: 10px; margin-top: 10px;" />
                        </div>
                        <div class="col-md-3">
                            <img src="images/dth5.JPG" alt="" style="border: solid 1px #f4f4f4; padding: 10px;" />
                            <img src="images/dth6.JPG" alt="" style="border: solid 1px #f4f4f4; padding: 10px; margin-top: 10px;" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="part">
                <div class="row">
                    <div class="col-md-3">
                        <h2 style="font-family: Arial; font-size: 18px; font-weight: bold; color: black; padding-top: 18px; padding-left: 25px; color: #4e4e57;">THƯƠNG HIỆU NỔI BẬT</h2>
                    </div>
                    <div class="line">
                        <div class="col-md-7">
                            <img src="images/line.jpg" alt="" />
                        </div>
                    </div>
                    <div class="col-lg-2" style="text-align: right; margin-top: 42px;">
                        <div class="btn-group">
                            <button type="button" class="btn btn-danger">Xem tất cả</button>
                            <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="thuonghieu">
                    <div class="row">
                        <div class="col-md-3">
                            <img src="images/thnb1.JPG" style="border: solid 1px #dedee3; padding: 10px;" alt="" />
                        </div>
                        <div class="col-md-3">
                            <img src="images/thnb2.JPG" style="border: solid 1px #dedee3; padding: 10px;" alt="" />
                        </div>
                        <div class="col-md-3">
                            <img src="images/thnb3.JPG" style="border: solid 1px #dedee3; padding: 10px;" alt="" />
                        </div>
                        <div class="col-md-3">
                            <img src="images/thnb4.JPG" style="border: solid 1px #dedee3; padding: 10px;" alt="" />
                        </div>
                    </div>
                </div>

            </div>
            <div class="part">
                <div class="row">
                    <iframe src ="brand.html" style ="width:100%; border:none; overflow:hidden;"></iframe>
                </div>
            </div>
        </div>

        <div style="margin-top: -40px; width: 98%; margin-left: 0px; margin-right: 0px;">
            <div class="row" style="text-align: center;">
                <div class="col-md-12" style="text-align: center;">
                    <h3 style="font-family: Arial; font-size: 25px; color: black; padding-top: 18px; color: #4e4e57; text-align: center;">TIN TỨC SUCMANHCONG.COM</h3>
                </div>
            </div>
        </div>

    </div>

    <div class="container">
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-4">
                <div>
                    <a href="NewsDetailt.aspx?Id=<% Response.Write(objTableNews.Rows[0]["Id"].ToString()); %>">
                        <img src="images/<% Response.Write(objTableNews.Rows[0]["Image"].ToString()); %>" alt="" style="border: solid 1px #beddeb;" /></a>
                </div>
                <div style="width: 100%;">
                    <div style="float: left; width: 20%; text-align: center; font-family: Arial; font-size: 18px; font-weight: bold; padding: 9px; padding-left: 0px;">
                        <div style="border: solid 1px #f4f4f4; margin-top: 11px;"><% Response.Write(DateTime.Parse(objTableNews.Rows[0]["DayCreate"].ToString()).ToString("dd/MM")); %></div>
                        <div style="border: solid 1px #f4f4f4; border-top: none; font-size: 22px; height: 40px; padding-top: 1px;"><% Response.Write(DateTime.Parse(objTableNews.Rows[0]["DayCreate"].ToString()).ToString("yyyy")); %></div>
                    </div>
                    <div style="float: right; width: 80%; text-align: justify; padding: 9px;">
                        <div style="vertical-align: top; height: 50px; overflow: hidden;">
                            <h5 style="font-family: Arial; font-size: 15px; font-weight: bold; color: #4e4e57; text-transform: uppercase; margin-top: -22px;" class="NewsHomeLink"><a href="NewsDetailt.aspx?Id=<% Response.Write(objTableNews.Rows[0]["Id"].ToString()); %>"><% Response.Write(objTableNews.Rows[0]["Title"].ToString()); %></a></h5>
                        </div>
                        <div style="font-family: Arial; font-size: 14px; color: #4e4e57; height: 80px; overflow: hidden;"><% Response.Write(objTableNews.Rows[0]["ShortContent"].ToString()); %></div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div>
                    <a href="NewsDetailt.aspx?Id=<% Response.Write(objTableNews.Rows[1]["Id"].ToString()); %>">
                        <img src="images/<% Response.Write(objTableNews.Rows[1]["Image"].ToString()); %>" alt="" style="border: solid 1px #beddeb;" /></a>
                </div>
                <div style="width: 100%;">
                    <div style="float: left; width: 20%; text-align: center; font-family: Arial; font-size: 18px; font-weight: bold; padding: 9px; padding-left: 0px;">
                        <div style="border: solid 1px #f4f4f4; margin-top: 11px;"><% Response.Write(DateTime.Parse(objTableNews.Rows[1]["DayCreate"].ToString()).ToString("dd/MM")); %></div>
                        <div style="border: solid 1px #f4f4f4; border-top: none; font-size: 22px; height: 40px; padding-top: 1px;"><% Response.Write(DateTime.Parse(objTableNews.Rows[1]["DayCreate"].ToString()).ToString("yyyy")); %></div>
                    </div>
                    <div style="float: right; width: 80%; text-align: justify; padding: 9px;">
                        <div style="vertical-align: top; height: 50px; overflow: hidden;">
                            <h5 style="font-family: Arial; font-size: 15px; font-weight: bold; color: #4e4e57; text-transform: uppercase; margin-top: -22px;" class="NewsHomeLink"><a href="NewsDetailt.aspx?Id=<% Response.Write(objTableNews.Rows[1]["Id"].ToString()); %>"><% Response.Write(objTableNews.Rows[1]["Title"].ToString()); %></a></h5>
                        </div>
                        <div style="font-family: Arial; font-size: 14px; color: #4e4e57; height: 80px; overflow: hidden;"><% Response.Write(objTableNews.Rows[1]["ShortContent"].ToString()); %></div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div>
                    <a href="NewsDetailt.aspx?Id=<% Response.Write(objTableNews.Rows[2]["Id"].ToString()); %>">
                        <img src="images/<% Response.Write(objTableNews.Rows[2]["Image"].ToString()); %>" alt="" style="border: solid 1px #beddeb;" /></a>
                </div>
                <div style="width: 100%;">
                    <div style="float: left; width: 20%; text-align: center; font-family: Arial; font-size: 18px; font-weight: bold; padding: 9px; padding-left: 0px;">
                        <div style="border: solid 1px #f4f4f4; margin-top: 11px;"><% Response.Write(DateTime.Parse(objTableNews.Rows[2]["DayCreate"].ToString()).ToString("dd/MM")); %></div>
                        <div style="border: solid 1px #f4f4f4; border-top: none; font-size: 22px; height: 40px; padding-top: 1px;"><% Response.Write(DateTime.Parse(objTableNews.Rows[2]["DayCreate"].ToString()).ToString("yyyy")); %></div>
                    </div>
                    <div style="float: right; width: 80%; text-align: justify; padding: 9px;">
                        <div style="vertical-align: top; height: 50px; overflow: hidden;">
                            <h5 style="font-family: Arial; font-size: 15px; font-weight: bold; color: #4e4e57; text-transform: uppercase; margin-top: -22px;" class="NewsHomeLink"><a href="NewsDetailt.aspx?Id=<% Response.Write(objTableNews.Rows[2]["Id"].ToString()); %>"><% Response.Write(objTableNews.Rows[2]["Title"].ToString()); %></a></h5>
                        </div>
                        <div style="font-family: Arial; font-size: 14px; color: #4e4e57; height: 80px; overflow: hidden;"><% Response.Write(objTableNews.Rows[2]["ShortContent"].ToString()); %></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
