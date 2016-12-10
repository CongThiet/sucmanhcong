using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Topic : System.Web.UI.Page
{
    #region method Page_Load
    private Topics tp = new Topics();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            DataTable dt = new DataTable();
            dt = tp.getTopic();
            if(dt.Rows.Count <20)
            {
                tblABC.Visible = false;
            }
            setData();
 
        }


    }
    #endregion
    #region bind Data
    private void setData()
    {

        CollectionPager2.MaxPages = 1000;
        CollectionPager2.PageSize = 120;
        CollectionPager2.DataSource = tp.getTopic().DefaultView;
        CollectionPager2.BindToControl = DataList2;
        DataList2.DataSource = CollectionPager2.DataSourcePaged;
        DataList2.DataBind();
        
    }
    #endregion

    #region method getTopic === OLD
    public DataTable getTopic()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT 0 AS TT, * FROM tblTopic";
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
}