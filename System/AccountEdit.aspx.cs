using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_AccountEdit : System.Web.UI.Page
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
                this.txtUserName.Value = objTable.Rows[0]["UserName"].ToString();
                this.txtFullName.Value = objTable.Rows[0]["FullName"].ToString();
                this.txtEmail.Value = objTable.Rows[0]["Email"].ToString();
                this.txtAddress.Value = objTable.Rows[0]["Address"].ToString();
                this.txtPhone.Value = objTable.Rows[0]["Phone"].ToString();
                this.txtRole.Value = objTable.Rows[0]["Role"].ToString();
                this.txtDepartments.Value = objTable.Rows[0]["Departments"].ToString();

                this.txtUgroup.Value = objTable.Rows[0]["Ugroup"].ToString();
                this.txtDeptId.Value = objTable.Rows[0]["DeptId"].ToString();
                this.txtHomePage.Value = objTable.Rows[0]["HomePage"].ToString();

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
        } else
        {
            Response.Redirect("AccountAdd.aspx");
        }
    }
    #endregion

    #region method setAccount
    protected void setAccount()
    {
        int ret = 0;

        if (this.itemId == 0)
        {
            Response.Redirect("AccountAdd.aspx");
        }
        else
        {
            string FullName =  this.txtFullName.Value;
            Boolean Status = this.chkStatus.Checked;
            string Ugroup = this.txtUgroup.Value;
            string Email = this.txtEmail.Value;
            
            int DeptId = 0;
            try{
                DeptId = Int32.Parse(this.txtDeptId.Value);
            } catch{}

            string Address = this.txtAddress.Value;
            string Phone = this.txtPhone.Value;
            string Role = this.txtRole.Value;
            string Departments = this.txtDepartments.Value;
            int HomePage = 0;
            try{
                HomePage = Int32.Parse(this.txtHomePage.Value);
            } catch{}


            ret = objDataAccount.UpdateAccount(this.itemId, FullName,Status,Ugroup,Email,DeptId,Address,Phone,Role,Departments,HomePage);
        }


        if (ret > 0)
        {
            Response.Redirect("ListAccount.aspx");
        }
    }
    #endregion


    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        this.setAccount();
    }
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListAccount.aspx");
    }
    #endregion
}