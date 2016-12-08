<%@ Page Title="ĐĂNG KÝ GIAN HÀNG" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Store_Register" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">

        <div class="row" style="margin-top: 30px;">
            <div class="col-md-4">
                <h3 style="margin-top: 0px;">Đăng ký hồ sơ cửa hàng</h3>
                <p style="text-align: justify;">
                    <b>Sucmanhcong.com</b> là mạng cộng đồng, nơi mà những cá nhân có, tổ chức có khả năng, nguyện vọng hợp tác kinh doanh tìm kiếm cơ hội kinh doanh và tiêu dùng thông minh, cá nhân đó cần đăng ký thông tin và tuân thủ các quy định của website này!
                </p>
                <br />
                <h4>Các bước để trở thành thành viên</h4>
                <br />
                <p><b>1.</b> Đăng ký thông tin thành viên theo mẫu bên cạnh</p>
                <br />
                <p><b>2.</b> Bổ sung hồ sơ theo quy định của Sucmanhcong.com</p>
                <br />
                <p><b>3.</b> Hoàn thiện hồ sơ về sản phẩm, dịch vụ của cửa hàng</p>
                <br />
                <p><b>4.</b> Công bố hồ sơ trên website Sucmanhcong.com</p>
            </div>
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading">THÔNG TIN CỬA HÀNG</div>
                    <div class="panel-body">
                        <br />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="txtName" runat="server" placeholder="Tên cửa hàng">
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="txtAddress" runat="server" placeholder="Địa chỉ">
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="txtPhone" runat="server" placeholder="Điện thoại">
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="txtManager" runat="server" placeholder="Người đại diện, quản lý">
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="txtTaxCode" runat="server" placeholder="Mã số thuế">
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <asp:DropDownList ID="ddlBusiness" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <asp:Label ID="lblMsg" runat="server" Text="-:-" Font-Names="Arial" ForeColor="Red" Font-Size="13px"></asp:Label>
                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <div class="col-sm-12">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-danger" Text="Đăng ký" Style="width: 100px; font-weight: bold; font-family: Arial;" OnClick="btnSave_Click" />
                                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-info" Text="Bỏ qua" Style="width: 100px; font-weight: bold; margin-right: 6px;" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                        <br /><br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

