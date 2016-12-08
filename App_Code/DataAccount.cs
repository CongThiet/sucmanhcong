using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataAccount
/// </summary>
public class DataAccount
{

    #region declare objects
    private TVSFunc objFunc = new TVSFunc();
    #endregion

	public DataAccount()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region method getAccount
    public DataTable getAccount(int id)
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblAcc WHERE Id = @ID";
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
    // */
    #region method getData
    public DataTable getData()
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT 0 AS TT, * FROM tblAcc WHERE [DelEnable]=0";
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


    #region method UpdateAccount
    public int UpdateAccount(int id, string FullName, Boolean Status, string UGroup, string Email, int DeptId, string Address, string Phone, string Role, string Departments, int HomePage)
    {
        int ret = 0;
        if (id == 0) return ret;
        try
        {
            SqlConnection sqlCon1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon1.Open();
            SqlCommand Cmd1 = sqlCon1.CreateCommand();
            string sqlQuery1 = "";
            sqlQuery1 += "UPDATE tblAcc SET [FullName]=@FullName,";
            sqlQuery1 += "[Status]=@Status, [UGroup]=@UGroup, [Email]=@Email, [DeptId]=@DeptId, [Address]=@Address, [Phone]=@Phone, ";
            sqlQuery1 += "[Role]=@Role, [Departments]=@Departments, [HomePage]=@HomePage WHERE [ID]=@id";
            Cmd1.CommandText = sqlQuery1;
            Cmd1.Parameters.Add("id", SqlDbType.Int).Value = id;
            Cmd1.Parameters.Add("FullName", SqlDbType.NVarChar).Value = FullName;
            Cmd1.Parameters.Add("Status", SqlDbType.SmallInt).Value = Status;
            Cmd1.Parameters.Add("UGroup", SqlDbType.VarChar).Value = UGroup;
            Cmd1.Parameters.Add("Email", SqlDbType.VarChar).Value = Email;
            Cmd1.Parameters.Add("DeptId", SqlDbType.Int).Value = DeptId;
            Cmd1.Parameters.Add("Address", SqlDbType.NVarChar).Value = Address;
            Cmd1.Parameters.Add("Phone", SqlDbType.NVarChar).Value = Phone;
            Cmd1.Parameters.Add("Role", SqlDbType.NVarChar).Value = Role;
            Cmd1.Parameters.Add("Departments", SqlDbType.NVarChar).Value = Departments;
            Cmd1.Parameters.Add("HomePage", SqlDbType.Int).Value = HomePage;

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

    #region method ChangPass
    public int ChangPass(int id, string Password)
    {
        int ret = 0;
        if (id == 0) return ret;
        try
        {
            SqlConnection sqlCon1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon1.Open();
            SqlCommand Cmd1 = sqlCon1.CreateCommand();
            string sqlQuery1 = "";
            sqlQuery1 += "UPDATE tblAcc SET [PassWord]=@password WHERE [ID]=@id";
            Cmd1.CommandText = sqlQuery1;
            Cmd1.Parameters.Add("id", SqlDbType.Int).Value = id;
            Cmd1.Parameters.Add("password", SqlDbType.NVarChar).Value = this.objFunc.CryptographyMD5(Password);

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

    #region method DelAccount
    public int DelAccount(int id)
    {
        int ret = 0;
        if (id == 0) return ret;
        try
        {
            SqlConnection sqlCon1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon1.Open();
            SqlCommand Cmd1 = sqlCon1.CreateCommand();
            string sqlQuery1 = "";
            sqlQuery1 += "UPDATE tblAcc SET [DelEnable]=1  WHERE Id=@id";
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

    #region method AddAccount
    public int AddAccount(string UserName, string Password, string FullName, bool Status, string Ugroup, string Email, int DeptId, string Address, string Phone, string Role, string Departments, int HomePage)
    {
        int ret = 0;
        try
        {
            SqlConnection sqlCon1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon1.Open();
            SqlCommand Cmd1 = sqlCon1.CreateCommand();
            string sqlQuery1 = "";
            sqlQuery1 += "IF NOT EXISTS (SELECT * FROM tblAcc WHERE UserName = @UserName)";
            sqlQuery1 += "BEGIN INSERT INTO tblAcc([UserName],[PassWord],[FullName],[Status],[UGroup],[DelEnable],[Email],[DeptId],[Address],[Phone],[Role],[Departments],[HomePage]) ";
            sqlQuery1 += " VALUES (@UserName,@PassWord,@FullName,@Status,@UGroup,0,@Email,@DeptId,@Address,@Phone,@Role,@Departments,@HomePage) END";
            Cmd1.CommandText = sqlQuery1;
            Cmd1.Parameters.Add("UserName", SqlDbType.NVarChar).Value = UserName;
            Cmd1.Parameters.Add("PassWord", SqlDbType.NVarChar).Value = Password;
            Cmd1.Parameters.Add("FullName", SqlDbType.NVarChar).Value = FullName;
            Cmd1.Parameters.Add("Status", SqlDbType.SmallInt).Value = Status;
            Cmd1.Parameters.Add("UGroup", SqlDbType.VarChar).Value = Ugroup;
            Cmd1.Parameters.Add("Email", SqlDbType.VarChar).Value = Email;
            Cmd1.Parameters.Add("DeptId", SqlDbType.Int).Value = DeptId;
            Cmd1.Parameters.Add("Address", SqlDbType.NVarChar).Value = Address;
            Cmd1.Parameters.Add("Phone", SqlDbType.NVarChar).Value = Phone;
            Cmd1.Parameters.Add("Role", SqlDbType.NVarChar).Value = Role;
            Cmd1.Parameters.Add("Departments", SqlDbType.NVarChar).Value = Departments;
            Cmd1.Parameters.Add("HomePage", SqlDbType.Int).Value = HomePage;
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