using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataGroupAcc
/// </summary>
public class DataGroupAcc
{
	public DataGroupAcc()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    #region method getData
    public DataTable getData()
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT 0 AS TT, * FROM tblGroupAcc WHERE [DelEnable]=0";
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
            objTable = ds.Tables[0];

        }
        catch
        {

        }
        return objTable;
    }
    #endregion

    #region method getGroup
    public DataTable getGroup(int id)
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblGroupAcc WHERE ID = @ID";
            Cmd.Parameters.Add("ID", SqlDbType.Int).Value = id;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = Cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            sqlCon.Close();
            sqlCon.Dispose();
            objTable = ds.Tables[0];
        }
        catch
        {

        }
        return objTable;
    }
    #endregion

    #region method addGroup
    public int addGroup(string name,Boolean status,string per)
    {
        int ret = 0;
        try
        {
            SqlConnection sqlCon1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon1.Open();
            SqlCommand Cmd1 = sqlCon1.CreateCommand();
            string sqlQuery1 = "";
            sqlQuery1 += "INSERT INTO tblGroupAcc([Name],[Status],[Per],[DelEnable]) VALUES(@Name,@Status,@Per,0)";
            Cmd1.CommandText = sqlQuery1;
            Cmd1.Parameters.Add("Name", SqlDbType.NVarChar).Value = name;
            Cmd1.Parameters.Add("Status", SqlDbType.Bit).Value = status;
            Cmd1.Parameters.Add("Per", SqlDbType.NVarChar).Value = per;
            ret = Cmd1.ExecuteNonQuery();
            //ret = (int)Cmd1.ExecuteScalar();
            sqlCon1.Close();
            sqlCon1.Dispose();
        } catch
        {

        }
        

        return ret;
    }
    #endregion

    #region method UpdateGroup
    public int UpdateGroup(int id,string name,Boolean status,string per)
    {
        int ret = 0;
        if (id == 0) return ret;
        try
        {
            SqlConnection sqlCon1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon1.Open();
            SqlCommand Cmd1 = sqlCon1.CreateCommand();
            string sqlQuery1 = "";
            sqlQuery1 += "UPDATE tblGroupAcc SET [Name]=@Name ,[Status]=@Status ,[Per]=@Per  WHERE ID=@id";
            Cmd1.CommandText = sqlQuery1;
            Cmd1.Parameters.Add("Name", SqlDbType.NVarChar).Value = name;
            Cmd1.Parameters.Add("Status", SqlDbType.Bit).Value = status;
            Cmd1.Parameters.Add("Per", SqlDbType.NVarChar).Value = per;
            Cmd1.Parameters.Add("id", SqlDbType.Int).Value = id;
            ret = Cmd1.ExecuteNonQuery();
            //ret = (int)Cmd1.ExecuteScalar();
            sqlCon1.Close();
            sqlCon1.Dispose();
        } catch
        {

        }
        return ret;
    }
    #endregion

    #region method DelGroup
    public int DelGroup(int id)
    {
        int ret = 0;
        if (id == 0) return ret;
        try
        {
            SqlConnection sqlCon1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon1.Open();
            SqlCommand Cmd1 = sqlCon1.CreateCommand();
            string sqlQuery1 = "";
            sqlQuery1 += "UPDATE tblGroupAcc SET [DelEnable]=1  WHERE ID=@id";
            Cmd1.CommandText = sqlQuery1;
            Cmd1.Parameters.Add("id", SqlDbType.Int).Value = id;
            ret = Cmd1.ExecuteNonQuery();
            //ret = (int)Cmd1.ExecuteScalar();
            sqlCon1.Close();
            sqlCon1.Dispose();
        }
        catch
        {

        }
        return ret;
    }
    #endregion
}