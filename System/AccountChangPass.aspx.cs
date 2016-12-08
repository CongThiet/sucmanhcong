using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_AccountChangPass : System.Web.UI.Page
{
    #region declare objects
    private DataAccount objDataAccount = new DataAccount();

    private int itemId = 0;
    public string message = "";
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.itemId = int.Parse(Request["id"].ToString());

        }
        catch
        {
            this.itemId = 0;
        }

        if (!Page.IsPostBack)
        {
            this.getAccount();
        }
    }
    #endregion

    #region method getAccount
    protected void getAccount()
    {
        if (this.itemId != 0)
        {
            DataTable objTable = this.objDataAccount.getAccount(this.itemId);

            if (objTable.Rows.Count > 0)
            {
                this.txtUserName.Value = objTable.Rows[0]["UserName"].ToString();
            }
        }
        else
        {
            Response.Redirect("ListAccount.aspx");
        }
    }
    #endregion



    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //this.setAccount();
        if(this.txtPassWord.Value == "")
        {
            this.message = "Không được để trống mật khẩu";
            return;
        }
        

        if(this.txtPassWord.Value != this.txtPassWord2.Value)
        {
            this.message = "Mật khẩu nhập lại không khớp";
            return;
        }

        int ret = this.objDataAccount.ChangPass(this.itemId, this.txtPassWord.Value);

        if(ret > 0)
        {
            Response.Redirect("Account.aspx?id=" + this.itemId.ToString());
        }
        else
        {
            this.message = "Có lỗi xảy ra. Làm ơn thử lại!";
        }
    }
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Account.aspx?id="+this.itemId.ToString());
    }
    #endregion
}