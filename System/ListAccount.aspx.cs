using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_ListAccount : System.Web.UI.Page
{
    private DataTable objTable = new DataTable();
    private DataAccount objDataAccount = new DataAccount();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.objTable = this.objDataAccount.getData();
            cpGroupAcc.MaxPages = 1000;
            cpGroupAcc.PageSize = 15;
            cpGroupAcc.DataSource = this.objTable.DefaultView;
            cpGroupAcc.BindToControl = dtlGroupAcc;
            dtlGroupAcc.DataSource = cpGroupAcc.DataSourcePaged;
            dtlGroupAcc.DataBind();
            if (this.objTable.Rows.Count < 15)
            {
                this.tblABC.Visible = false;
            }
        }
    }
}