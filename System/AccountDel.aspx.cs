using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_AccountDel : System.Web.UI.Page
{

    private DataAccount objDataAccount = new DataAccount();
    private int itemId = 0;
    public string name = "";

    #region method getid
    protected void getid()
    {
        try
        {
            this.itemId = int.Parse(Request["id"].ToString());

        }
        catch
        {
        }

        if (this.itemId == 0)
        {
            Response.Redirect("ListAccount.aspx");
        }
    }
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        this.getid();

        DataTable objTable = this.objDataAccount.getAccount(this.itemId);
        if (objTable.Rows.Count > 0)
        {
            this.name = objTable.Rows[0]["UserName"].ToString();
        } else
        {
            Response.Redirect("ListAccount.aspx");
        }

    }
    #endregion

    #region method btnSave_Click
    protected void btnOk_Click(object sender, EventArgs e)
    {
        //this.getid();

        objDataAccount.DelAccount(this.itemId);

        Response.Redirect("ListAccount.aspx");
    }
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListAccount.aspx");
    }
    #endregion
}