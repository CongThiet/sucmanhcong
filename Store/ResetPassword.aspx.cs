using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_ResetPassword : System.Web.UI.Page
{
    #region declare objects
    private TVSFunc objFunc = new TVSFunc();
    private Partner objPartner = new Partner();
    public string strName = "", strAddress = "", strPhone = "", strManager = "", strEmail = "", strTaxcode = "", strAccount = "", strBestSale = "", strVIP = "", strMsg = "";
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
            this.strAddress = Rd["Address"].ToString();
            this.strManager = Rd["Manager"].ToString();
            this.strPhone = Rd["Phone"].ToString();
            this.strEmail = Rd["Email"].ToString();
            this.strTaxcode = Rd["TaxCode"].ToString();
            this.strAccount = Rd["Account"].ToString();
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

    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (this.txtOldPass.Text.Trim() == "")
        {
            this.strMsg = "Bạn chưa nhập mật khẩu hiện tại!";
            return;
        }
        if (this.txtNewPass.Text.Trim() == "")
        {
            this.strMsg = "Bạn chưa nhập mật khẩu mới!";
            return;
        }
        if (this.txtNewPass2.Text.Trim() != this.txtNewPass.Text.Trim())
        {
            this.strMsg = "Nhập lại mật khẩu không khớp!";
            return;
        }
        this.strMsg = this.objFunc.changePass(Session["ACCOUNT"].ToString(), this.txtOldPass.Text, this.txtNewPass.Text);
    } 
    #endregion
}