using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_GroupAccEdit : System.Web.UI.Page
{
    #region declare objects
    private DataGroupAcc objDataGroupAcc = new DataGroupAcc();

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
            this.getGroup();
        }
    }
    #endregion

    #region method getGroup
    public void getGroup()
    {
        if (this.itemId != 0)
        {
            DataTable objTable = this.objDataGroupAcc.getGroup(this.itemId);

            if (objTable.Rows.Count > 0)
            {
                this.txtName.Value = objTable.Rows[0]["Name"].ToString();
                this.txtPer.Value = objTable.Rows[0]["Per"].ToString();
                if (objTable.Rows[0]["Status"].ToString() == "1")
                {
                    this.chkStatus.Checked = true;
                }
                else
                {
                    this.chkStatus.Checked = false;
                }
            }
        }
    }
    #endregion

    #region method setGroup
    protected void setGroup()
    {
        if (this.txtName.Value == "")
        {
            return;
        }

        int ret = 0;

        if (this.itemId == 0)
        {
            ret = objDataGroupAcc.addGroup(this.txtName.Value, this.chkStatus.Checked, this.txtPer.Value);
        } else
        {
            ret = objDataGroupAcc.UpdateGroup(this.itemId, this.txtName.Value, this.chkStatus.Checked, this.txtPer.Value);
        }
        

        if(ret > 0)
        {
            Response.Redirect("ListGroupAcc.aspx");
        }
    }
    #endregion


    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        this.setGroup();
    }
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListGroupAcc.aspx");
    }
    #endregion
}