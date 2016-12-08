<%@ Page Title="ĐĂNG KÝ" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Customer_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <br />
        <div class="row">
            <div class="col-md-4">
                <h3 style ="margin-top:0px;">Đăng ký thành viên</h3>
                <br />
                <p style="text-align: justify;">
                    SUCMANHCONG.COM hân hạnh chào đón bạn đến với cộng đồng của chúng tôi, nơi các bạn được hưởng những lợi ích từ những nhà cung cấp hàng đầu, uy tín và có trách nhiệm.
                                Nơi mà chính bạn góp phần tạo nên những giá trị cho bản thân và cộng đồng.
                                <br />
                    <br />
                    Để trở thành thành viên của chúng tôi, bạn vui lòng cung cấp đầy đủ và chính xác thông tin theo mẫu sau và gửi về cho chúng tôi, thông tin của bạn sẽ được chúng
                                tôi xét duyệt và trả lời bạn trong thời gian sớm nhất<br />
                    <br />
                </p>
                <p style="text-align: justify;">1. Cung cấp thông tin và gửi về SUCMANHCONG.COM</p>
                <br />
                <p style="text-align: justify;">2. SUCMANHCONG.COM xác thực thông tin và cấp thẻ khách hàng</p>
                <br />
                <p style="text-align: justify;">3. Khách hàng kích hoạt thẻ và sử dụng dịch vụ</p>
                <br />
                <p style="text-align: justify;">4. Sử dụng thẻ, nâng cấp thẻ</p>
            </div>
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">THÔNG TIN ĐĂNG KÝ
                        </h3>
                    </div>
                    <div class="panel-body">
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="text" class="form-control" id="txtName" runat="server" placeholder="Họ tên">
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="text" class="form-control" id="txtAddress" runat="server" placeholder="Địa chỉ">
                                </div>
                            </div>
                        </div>
                         <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="text" class="form-control" id="txtPhone" runat="server" placeholder="Điện thoại">
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="text" class="form-control" id="txtBirthday" runat="server" placeholder="Ngày sinh">
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="text" class="form-control" id="txtEmail" runat="server" placeholder="Địa chỉ email">
                                </div>
                            </div>
                        </div>
                         <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-body" style="padding: 0px;">
                                    <input type="text" class="form-control" id="txtIdCard" runat="server" placeholder="Số CMND">
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-12">
                                <asp:Label ID="lblMsg" Text = "-:-" runat="server" Style="height: 30px; line-height: 30px; width: 99%; font-size: 13px; font-family: Arial; color: red"></asp:Label>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-12">
                                <asp:Button ID="btnRegister" CssClass="btn btn-primary" runat="server" Text="Gửi thông tin đăng ký" OnClick="btnRegister_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-default" runat="server" Text="Bỏ qua" OnClick="btnCancel_Click" />
                            </div>
                        </div>

                        <br />
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
</asp:Content>

