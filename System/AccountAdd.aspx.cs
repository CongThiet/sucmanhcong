using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_AccountAdd : System.Web.UI.Page
{
    #region  declare objects
    private DataAccount objDataAccount = new DataAccount();
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string UserName = this.txtUserName.Value;
        string Password = this.txtPassWord.Value;

        string FullName = this.txtFullName.Value;
        bool Status = this.chkStatus.Checked;
        string Ugroup = this.txtUgroup.Value;
        string Email = this.txtEmail.Value;

        int DeptId = 0;
        try
        {
            DeptId = Int32.Parse(this.txtDeptId.Value);
        }
        catch { }

        string Address = this.txtAddress.Value;
        string Phone = this.txtPhone.Value;
        string Role = this.txtRole.Value;
        string Departments = this.txtDepartments.Value;
        int HomePage = 0;
        try
        {
            HomePage = Int32.Parse(this.txtHomePage.Value);
        }
        catch { }


        int ret = objDataAccount.AddAccount(UserName, Password, FullName, Status, Ugroup, Email, DeptId, Address, Phone, Role, Departments, HomePage);
        
        if(ret > 0)
        {
            Response.Redirect("ListAccount.aspx");
        }
    }
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListAccount.aspx");
    }
    #endregion
}