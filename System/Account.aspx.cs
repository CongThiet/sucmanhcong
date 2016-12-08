using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account : System.Web.UI.Page
{
    #region declare objects
    private DataAccount objDataAccount = new DataAccount();

    private int itemId = 0;
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
                this.txtUserName.InnerText = objTable.Rows[0]["UserName"].ToString();
                this.txtFullName.InnerText = objTable.Rows[0]["FullName"].ToString();
                this.txtEmail.InnerText = objTable.Rows[0]["Email"].ToString();
                this.txtAddress.InnerText = objTable.Rows[0]["Address"].ToString();
                this.txtPhone.InnerText = objTable.Rows[0]["Phone"].ToString();
                this.txtRole.InnerText = objTable.Rows[0]["Role"].ToString();
                this.txtDepartments.InnerText = objTable.Rows[0]["Departments"].ToString();

                this.txtUgroup.InnerText = objTable.Rows[0]["Ugroup"].ToString();
                this.txtDeptId.InnerText = objTable.Rows[0]["DeptId"].ToString();
                this.txtHomePage.InnerText = objTable.Rows[0]["HomePage"].ToString();

                if (objTable.Rows[0]["Status"].ToString() == "1")
                {
                    this.chkStatus.Checked = true;
                }
                else
                {
                    this.chkStatus.Checked = false;
                }
                // */
            }
        }
        else
        {
            Response.Redirect("AccountAdd.aspx");
        }
    }
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListAccount.aspx");
    }
    #endregion

    #region method btn_ChangPass
    protected void btn_ChangPass(object sender, EventArgs e)
    {
        Response.Redirect("AccountChangPass.aspx?id=" + this.itemId.ToString());
    }
    #endregion

    #region method btnedit_Click
    protected void btnedit_Click(object sender, EventArgs e)
    {
        Response.Redirect("AccountEdit.aspx?id=" + this.itemId.ToString());
    }
    #endregion
}