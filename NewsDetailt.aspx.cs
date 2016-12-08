using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsDetailt : System.Web.UI.Page
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
            this.objTable = this.getTopic(this.itemId.ToString());
            //this.objTableFull = this.getTopicFull(this.itemId.ToString());

            CollectionPager2.MaxPages = 1000;
            CollectionPager2.PageSize = 120;
            CollectionPager2.DataSource = this.getTopicFull(this.itemId.ToString()).DefaultView;
            CollectionPager2.BindToControl = DataList2;
            DataList2.DataSource = CollectionPager2.DataSourcePaged;
            DataList2.DataBind();

        }
    } 
    #endregion

    #region method getTopicFull
    public DataTable getTopicFull(string Id)
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT 0 AS TT, *, '' AS DayCreate1 FROM tblTopic WHERE Id <> @Id AND GroupId = (SELECT GroupId FROM tblTopic WHERE Id = @Id)";
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
            ds.Tables[0].Rows[i]["DayCreate1"] = DateTime.Parse(ds.Tables[0].Rows[i]["DayCreate"].ToString()).ToString("dd/MM/yyyy");
        }
        if (ds.Tables[0].Rows.Count < 120)
        {
            this.tblABC.Visible = false;
        }
        return ds.Tables[0];
    } 
    #endregion

    #region method getTopic
    public DataTable getTopic(string Id)
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT  * FROM tblTopic WHERE Id = @Id";
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