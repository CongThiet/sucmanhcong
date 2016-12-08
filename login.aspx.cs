using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    #region declare objects
    private TVSFunc objFunc = new TVSFunc(); 
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.txtAccount.Value.ToString() != "" || this.txtPassWord.Value.ToString() != "")
        {
            this.btnLogin_Click(sender, e);
        }
        
    } 
    #endregion

    #region method btnLogin_Click
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (this.txtAccount.Value.ToString() == "")
        {
            this.lblMsg.Text = "Tên đăng nhập không hợp lệ";
            return;
        }
        if (this.txtPassWord.Value.ToString() == "")
        {
            this.lblMsg.Text = "Mật khẩu nhập không hợp lệ";
            return;
        }

        this.checkForLogin(this.txtAccount.Value.ToString(), this.txtPassWord.Value.ToString());
    } 
    #endregion

    #region method checkForLogin
    public void checkForLogin(string Account, string AccountPass)
    {
        try
        {
            string strDefault = "/";
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            if (Account.Substring(0, 3).ToUpper() == this.objFunc.getPartnerAccount().Trim().ToUpper())
            {
                Cmd.CommandText = "SELECT * FROM tblPartner WHERE State = 1 AND Account = @Account AND AccountPass = @AccountPass";
                strDefault = "Store/";
            }
            else
            {
                Cmd.CommandText = "SELECT * FROM tblCustomers WHERE State = 1 AND Account = @Account AND AccountPass = @AccountPass";
                strDefault = "Customer/Default.aspx";
            }
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
            Cmd.Parameters.Add("AccountPass", SqlDbType.NVarChar).Value =  this.objFunc.CryptographyMD5(AccountPass);
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                Session["ACCOUNT"] = Account.ToUpper();
            }
            Rd.Close();
            sqlCon.Close();
            sqlCon.Dispose();
            if (Session["ACCOUNT"] != null)
            {
                Response.Redirect(strDefault);
            }
            else
            {
                this.lblMsg.Text = "Thông tin đăng nhập không hợp lệ!";
            }
        }
        catch
        {

        }
    }
    #endregion
}