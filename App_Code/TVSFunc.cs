using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class TVSFunc
{
    #region method TVSFunc
    public TVSFunc()
    {
    } 
    #endregion

    #region Method CryptographyMD5
    public string CryptographyMD5(string source)
    {
        System.Security.Cryptography.MD5CryptoServiceProvider objMD5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
        byte[] buffer = System.Text.Encoding.UTF8.GetBytes(source);
        byte[] bytHash = objMD5.ComputeHash(buffer);
        string result = "";
        foreach (byte a in bytHash)
        {
            result += int.Parse(a.ToString(), System.Globalization.NumberStyles.HexNumber).ToString();
        }
        return result;
    }
    #endregion

    #region method changePass
    public string changePass(string Account, string Old, string New)
    {
        bool foundAccount = false;
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblPartner WHERE Account = @Account AND AccountPass = @OldAccountPass";
        Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
        Cmd.Parameters.Add("OldAccountPass", SqlDbType.NVarChar).Value = this.CryptographyMD5(Old);
        Cmd.Parameters.Add("AccountPass", SqlDbType.NVarChar).Value = this.CryptographyMD5(New);
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            foundAccount = true;
        }
        Rd.Close();
        if (!foundAccount)
        {
            return "Thông tin không hợp lệ, vui lòng xem lại!";
        }
        else
        {
            Cmd.CommandText = "UPDATE tblPartner SET AccountPass = @AccountPass WHERE Account = @Account";
            Cmd.ExecuteNonQuery();
        }
        sqlCon.Close();
        sqlCon.Dispose();
        return "Thay đổi mật khẩu thành công !";
    }
    #endregion

    #region method getPartnerAccount
    public string getPartnerAccount()
    {
        string tmpValue = "";
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT ISNULL(PartnerAccount,'') AS PartnerAccount FROM tblSystemCongif WHERE Id = 1";
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = Rd["PartnerAccount"].ToString().Trim();
            }
            Rd.Close();
            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {

        }
        return tmpValue;
    }
    #endregion

    #region method getCustomerAccount
    public string getCustomerAccount(string TypeCard)
    {
        string tmpValue = "";
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT ISNULL(" + TypeCard + ",'') AS CustomerAccount FROM tblSystemCongif WHERE Id = 1";
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = Rd["CustomerAccount"].ToString().Trim();
            }
            Rd.Close();
            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {

        }
        return tmpValue;
    }
    #endregion

     //IF NOT EXISTS (SELECT [column_name] FROM information_schema.columns WHERE [table_name] = 'tblBillDetail' and column_name = 'StockId')
     //BEGIN ALTER TABLE tblBillDetail ADD StockId nvarchar(50) DEFAULT('') END
}