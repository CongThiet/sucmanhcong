using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mStore_Product : System.Web.UI.Page
{
    #region declare objects
    public string strHtml = "";
    private DataTable objTable = new DataTable();
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
            this.objTable = this.getProduct();
            if (this.objTable.Rows.Count > 0)
            {
                for (int i = 0; i < this.objTable.Rows.Count; i++)
                {
                    strHtml += "<div style =\"width:100%; height:30px;\">";
                    strHtml += "<div class = \"tvsRowTT\">" + (i + 1).ToString() + "</div>";
                    strHtml += "<div class = \"tvsRowName\">" + this.objTable.Rows[i]["Name"].ToString() + "</div>";
                    strHtml += "<div class = \"tvsRowAction\">&nbsp;<a href = \"ProductEdit.aspx?id=" + this.objTable.Rows[i]["Id"].ToString() + "\"><img src = \"/img/edit.png\" alt = \"Sửa\" title = \"Sửa thông tin\"></a>&nbsp;&nbsp;&nbsp;<a href = \"#\"><img src = \"/img/delete.png\" alt = \"Xoá\" title = \"Xoá thông tin\"></a></div>";
                    strHtml += "</div>";
                }
            }
        }
    }
    #endregion

    #region method getProduct
    public DataTable getProduct()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT 0 AS TT, *, REPLACE(REPLACE(CAST(BestSale AS nvarchar),'1',N'Bán chạy'),'0','') AS BESTSALE1, REPLACE(REPLACE(CAST(VIP AS nvarchar),'1',N'VIP'),'0','') AS VIP1 FROM tblProduct WHERE PartnerId = (SELECT TOP 1 Id FROM tblPartner WHERE Account = @Account)";
        Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = Cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        sqlCon.Close();
        sqlCon.Dispose();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["TT"] = (i + 1);
        }
        return ds.Tables[0];
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
}