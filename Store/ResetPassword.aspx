<%@ Page Title="ĐỔI MẬT KHẨU" Language="C#" MasterPageFile="~/Store.master" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="Store_ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" style = "width:100%;">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="panel panel-default" style="margin-top:0px;">
                        <div class="panel-heading"><b>THAY ĐỔI MẬT KHẨU</b></div>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <div class="form-group pgrp_post">
                                    <label class="sr-only" for="exampleInputAmount">Mật khẩu cũ</label>
                                    <div class="input-group right">
                                        <div class="input-group-addon lbip_post">Mật khẩu cũ</div>
                                        <asp:TextBox type="password" ID="txtOldPass" runat="server" CssClass="form-control ipgr_post"></asp:TextBox>
                                        <div class="input-group-addon"></div>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <div class="form-group pgrp_post">
                                    <label class="sr-only" for="exampleInputAmount">Mật khẩu mới</label>
                                    <div class="input-group right">
                                        <div class="input-group-addon lbip_post">Mật khẩu mới</div>
                                        <asp:TextBox type="password" ID="txtNewPass" runat="server" CssClass="form-control ipgr_post"></asp:TextBox>
                                        <div class="input-group-addon"></div>
                                    </div>
                                </div>
                            </li> 
                            <li class="list-group-item">
                                <div class="form-group pgrp_post">
                                    <label class="sr-only" for="exampleInputAmount">Nhập lại mật khẩu</label>
                                    <div class="input-group right">
                                        <div class="input-group-addon lbip_post">Nhập lại mật khẩu</div>
                                        <asp:TextBox  type="password" ID="txtNewPass2" runat="server" CssClass="form-control ipgr_post"></asp:TextBox>
                                        <div class="input-group-addon"></div>
                                    </div>
                                </div>
                            </li> 
                            <li class="list-group-item" style="background-color: #fff;">
                                <div class="form-group pgrp2_post">
                                    <div class="input-group right" style="background-color: #fff; color:red;">
                                        <% Response.Write(this.strMsg); %>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item" style="background-color: #fff;">
                                <div class="form-group pgrp2_post">
                                    <label class="sr-only" for="exampleInputAmount" style="background-color: #fff;"></label>
                                    <div class="input-group right" style="background-color: #fff;">
                                        <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Lưu thông tin" OnClick="btnSave_Click" />
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

