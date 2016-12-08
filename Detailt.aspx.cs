using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Routing;

public partial class Detailt : System.Web.UI.Page
{
    #region declare objects
    public DataTable objTable = new DataTable();
    public DataTable objTableFull = new DataTable();
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
            Response.Redirect("/");
            this.itemId = 0;
        }
        if (!Page.IsPostBack)
        {
            this.objTable = this.getProduct(this.itemId.ToString());
            this.objTableFull = this.getProductFull(this.itemId.ToString());

            CollectionPager2.MaxPages = 1000;
            CollectionPager2.PageSize = 120;
            CollectionPager2.DataSource = getProductFull(this.itemId.ToString()).DefaultView;
            CollectionPager2.BindToControl = DataList2;
            DataList2.DataSource = CollectionPager2.DataSourcePaged;
            DataList2.DataBind();

            this.DataList2.BorderStyle = BorderStyle.None;
        }
    } 
    #endregion

    #region method getProductFull
    public DataTable getProductFull(string Id)
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT TOP 8 0 AS TT, * FROM tblProduct WHERE Id <> @Id AND BestSale = (SELECT TOP 1 BestSale FROM tblProduct WHERE Id = @Id)";
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = Id;
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
        if (ds.Tables[0].Rows.Count < 120)
        {
            this.tblABC.Visible = false;
        }
        return ds.Tables[0];
    }
    #endregion

    #region method getProduct
    public DataTable getProduct(string Id)
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT  * FROM tblProduct WHERE Id = @Id";
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = Id;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = Cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        sqlCon.Close();
        sqlCon.Dispose();
        return ds.Tables[0];
    } 
    #endregion
}