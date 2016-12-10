using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class Topics
{

    //
	public Topics()
	{

	}




    #region method getTopic // get all col, return data table 
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
       
        return ds.Tables[0];
    }
    #endregion

}