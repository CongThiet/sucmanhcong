using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class Customers
{
	public Customers()
	{
	}

 
    #region method getCustomer
    public DataTable getCustomer(string Account)
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblCustomers WHERE Account = @Account";
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
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



    #region method getPartner
    public DataTable getCustomPartner()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT 0 AS TT, '' AS State1, *, '' AS NgayTao FROM tblCustomers ORDER BY DayRegister DESC";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = Cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        sqlCon.Close();
        sqlCon.Dispose();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["TT"] = (i + 1);
            ds.Tables[0].Rows[i]["NgayTao"] = DateTime.Parse(ds.Tables[0].Rows[i]["DayRegister"].ToString()).ToString("dd/MM/yyyy");
            if (ds.Tables[0].Rows[i]["State"].ToString().ToUpper() == "TRUE")
            {
                ds.Tables[0].Rows[i]["State1"] = "<B>x</B>";
            }
            else
            {
                ds.Tables[0].Rows[i]["State1"] = "-:-";
            }
        }
        if (ds.Tables[0].Rows.Count < 120)
        {
         //   this.tblABC.Visible = false;
        }
        return ds.Tables[0];
    }
    #endregion
}