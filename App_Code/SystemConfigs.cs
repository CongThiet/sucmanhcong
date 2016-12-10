using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class SystemConfigs
{
	public SystemConfigs()
	{

	}

    #region menthod  save systemconfig //  return -1/1
    public int saveConfig(string partnerAccount,string customerAccount,string customerAccount1,string customerAccount2,string memberAccount,
        float partnerDiscount,float customerDiscount)
    {

        try { 
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        string sqlQuery = "";
        sqlQuery = "IF NOT EXISTS (SELECT * FROM tblSystemCongif WHERE Id = @Id)";
        sqlQuery += "BEGIN INSERT INTO tblSystemCongif(PartnerAccount,CustomerAccount,CustomerAccount1,CustomerAccount2,MemberAccount,PartnerDiscount,CustomerDiscount) VALUES(@PartnerAccount,@CustomerAccount,@CustomerAccount1, @CustomerAccount2, @MemberAccount,@PartnerDiscount,@CustomerDiscount) END ";
        sqlQuery += "ELSE BEGIN UPDATE tblSystemCongif SET PartnerAccount = @PartnerAccount,CustomerAccount = @CustomerAccount,CustomerAccount1 = @CustomerAccount1,CustomerAccount2 = @CustomerAccount2,MemberAccount = @MemberAccount,PartnerDiscount = @PartnerDiscount,CustomerDiscount = @CustomerDiscount WHERE Id = @Id END";
        Cmd.CommandText = sqlQuery;
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = 1;
        Cmd.Parameters.Add("PartnerAccount", SqlDbType.NVarChar).Value = partnerAccount;
        Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value =customerAccount;
        Cmd.Parameters.Add("CustomerAccount1", SqlDbType.NVarChar).Value =customerAccount1;
        Cmd.Parameters.Add("CustomerAccount2", SqlDbType.NVarChar).Value =customerAccount2;
        Cmd.Parameters.Add("MemberAccount", SqlDbType.NVarChar).Value = memberAccount;
        Cmd.Parameters.Add("PartnerDiscount", SqlDbType.Float).Value = partnerDiscount;
        Cmd.Parameters.Add("CustomerDiscount", SqlDbType.Float).Value = customerDiscount;
        Cmd.ExecuteNonQuery();
        sqlCon.Close();
        sqlCon.Dispose();
        return 1;
          }
        catch
        {
          // throw new Exception("Cannot excute sql command " + "Error : 101");
           return -1;
        }

    }
    #endregion 

    #region menthod  getCustomerConfig 

    public DataTable getCustomer(int Id)
    {
        try { 
        DataTable dt = new DataTable();
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblSystemCongif WHERE Id = @Id";
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = Id;
        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = Cmd;
        DataSet ds = new DataSet();
        ad.Fill(ds);

        dt = ds.Tables[0];
        sqlCon.Close();
        sqlCon.Dispose();
        return dt;
       }
        catch
        {
            return new DataTable();
        }
    }

    #endregion

}