<%@ Page Title="ĐĂNG NHẬP" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        body {
            /*background-image: url('/images/looping-bg.jpg');*/
        }

        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        .form-signin .form-control {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
    </style>
    <div class="container">
        <h4 style="text-align: center; margin-top: 30px;">CHÀO MỪNG BẠN ĐẾN VỚI SUCMANHCONG.COM!</h4>
        <div class="row" style="margin-top: 0px;">
            <div class="col-md-4 col-md-offset-4">
                <%--<form method="POST" action="#" accept-charset="UTF-8" role="form" id="loginform" class="form-signin">--%>
                <input name="_token" type="hidden" value="et5P8piiFzRANKXE78lAIjiKZUGcpFTrXJqDQvZf">
                <fieldset>
                    <h3 class="sign-up-title" style="color: dimgray; text-align: center; font-size:20px;">Xin mời đăng nhập vào hệ thống</h3>
                    <p style ="text-align:center;">
                    <asp:Label ID="lblMsg" runat="server" Text="-:-" ForeColor ="Red" Font-Size="14px"></asp:Label>
                    </p>
                     <hr class="colorgraph">
                    <input class="form-control email-title" placeholder="Account" id="txtAccount" name="email" type="text" runat="server" Style = "text-transform:uppercase;">
                    <br />  
                    <input class="form-control" placeholder="Password" name="password" id="txtPassWord" type="password" value="" runat="server">
                    <a class="pull-right" href="http://bootsnipp.com/password">Quên mật khẩu?</a>
                    <div class="checkbox" style="width: 140px;">
                        <label>
                            <input name="remember" type="checkbox" value="Remember Me">
                            Nhớ mật khẩu</label>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" Text="ĐĂNG NHẬP" class="btn btn-lg btn-success btn-block" OnClick="btnLogin_Click" />
                    <br>

                    <p class="text-center"><a href="http://bootsnipp.com/register">Đăng ký tài khoản?</a></p>
                </fieldset>
                <%--</form>--%>
            </div>
        </div>
    </div>
</asp:Content>

