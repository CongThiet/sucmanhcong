using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mStore_Default : System.Web.UI.Page
{
    #region declare objects
    private TVSFunc objFunc = new TVSFunc();
    private Partner objPartner = new Partner();
    public int SoSanPham = 0, SoSanPhamVIP = 0, SoSanPhamBanChay = 0, SoGiaoDich = 0;
    public double TongDoanhSo = 0;
    public string strName = "", strAddress = "", strPhone = "", strManager = "", strEmail = "", strTaxcode = "", strAccount = "", strBestSale = "", strVIP = "", strBankAccount = "", strBankAccountName = "";
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
            this.strName = Rd["Name"].ToString();
            Session["STORENAME"] = this.strName.ToUpper();
            this.strAddress = Rd["Address"].ToString();
            this.strManager = Rd["Manager"].ToString();
            this.strPhone = Rd["Phone"].ToString();
            this.strEmail = Rd["Email"].ToString();
            this.strTaxcode = Rd["TaxCode"].ToString();
            this.strAccount = Rd["Account"].ToString();
            this.strBankAccount = Rd["BankAccount"].ToString();
            this.strBankAccountName = Rd["BankAccountName"].ToString();
            if (Rd["BestSale"].ToString() == "True")
            {
                this.strBestSale = "X";
            }
            else
            {
                this.strBestSale = "";
            }
            if (Rd["VIP"].ToString() == "True")
            {
                this.strVIP = "X";
            }
            else
            {
                this.strVIP = "";
            }
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion
}