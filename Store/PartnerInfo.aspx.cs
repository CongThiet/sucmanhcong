using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_PartnerInfo : System.Web.UI.Page
{
    #region declare objects
    private TVSFunc objFunc = new TVSFunc();
    private Partner objPartner = new Partner();
    public int SoSanPham = 0, SoSanPhamVIP = 0, SoSanPhamBanChay = 0, SoGiaoDich = 0;
    public double TongDoanhSo = 0;
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ACCOUNT"] == null)
        {
            Response.Redirect("/");
        }
        if (!Page.IsPostBack)
        {
            this.getPartner();
            this.SoSanPham = this.objPartner.getProductCount(Session["ACCOUNT"].ToString());
            this.SoSanPhamVIP = this.objPartner.getProductVIPCount(Session["ACCOUNT"].ToString());
            this.SoSanPhamBanChay = this.objPartner.getProductBestSaleCount(Session["ACCOUNT"].ToString());
            this.SoGiaoDich = this.objPartner.getProductBillCount(Session["ACCOUNT"].ToString());
            this.TongDoanhSo = this.objPartner.getProductDoanhSo(Session["ACCOUNT"].ToString());
        }
    } 
    #endregion

    #region method getPartner
    public void getPartner()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblPartner WHERE Account = @Account";
        Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            this.lblName.Text = Rd["Name"].ToString();
            this.lblAddress.Text = "Địa chỉ: "+Rd["Address"].ToString();
            this.lblManager.Text = "Người quản lý: "+Rd["Manager"].ToString();
            this.lblPhone.Text = "Điện thoại: "+Rd["Phone"].ToString();
            this.lblTaxCode.Text = "Mã số thuế: "+Rd["TaxCode"].ToString();
            this.lblAccount.Text = Rd["Account"].ToString();
            if (Rd["BestSale"].ToString() == "True")
            {
                this.ckbBestSale.Checked = true;
            }
            else
            {
                this.ckbBestSale.Checked = false;
            }
            if (Rd["VIP"].ToString() == "True")
            {
                this.ckbVIP.Checked = true;
            }
            else
            {
                this.ckbVIP.Checked = false;
            }
            if (Rd["State"].ToString() == "True")
            {
                this.ckbState.Checked = true;
            }
            else
            {
                this.ckbState.Checked = false;
            }
            lblImg1.Text = "<img width = \"263px\" height = \"123px\" src = \"/Images/Partner/" + Rd["Image"].ToString() + "\">";
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion

    #region method btnOK_Click
    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (this.txtOldPass.Text.Trim() == "")
        {
            this.lblMsg.Text = "Bạn chưa nhập mật khẩu hiện tại!";
            return;
        }
        if (this.txtNewPass.Text.Trim() == "")
        {
            this.lblMsg.Text = "Bạn chưa nhập mật khẩu mới!";
            return;
        }
        this.lblMsg.Text = this.objFunc.changePass(Session["ACCOUNT"].ToString(), this.txtOldPass.Text, this.txtNewPass.Text);
    } 
    #endregion
}