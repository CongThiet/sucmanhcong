using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class Partner
{
   
    #region method Partner
    public Partner()
    {
    } 
    #endregion

    #region method setProducts
    public int setProducts(int PartnerId, string CardNumberId, int ProductId, double Number, double Price)
    {
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "INSERT INTO tblPartnerCustomer(PartnerId,CardNumberId,ProductId,Number,Price,DayUse) VALUES(@PartnerId,@CardNumberId,@ProductId,@Number,@Price,@DayUse)";
            Cmd.Parameters.Add("PartnerId", SqlDbType.Int).Value = PartnerId;
            Cmd.Parameters.Add("CardNumberId", SqlDbType.NVarChar).Value = CardNumberId;
            Cmd.Parameters.Add("ProductId", SqlDbType.Int).Value = ProductId;
            Cmd.Parameters.Add("Number", SqlDbType.Float).Value = Number;
            Cmd.Parameters.Add("Price", SqlDbType.Float).Value = Price;
            Cmd.Parameters.Add("DayUse", SqlDbType.DateTime).Value = DateTime.Now;
            int ret = Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();

            return ret;
            //Response.Redirect("ProductCustomer.aspx");
        }
        catch
        {
            return 0;
        }
    }
    #endregion

    #region method setPartnerBill
    public int setPartnerBill(string CustomerAccount, string PartnerAccount, float TotalMoney, float TotalMoneyDiscount, float Discount, float DiscountCard, float DiscountAdv, float TotalPeyment)
    {
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "";
            sqlQuery = "IF NOT EXISTS (SELECT * FROM tblPartnerBill WHERE CustomerAccount = @CustomerAccount AND PartnerAccount = @PartnerAccount AND TotalMoney = @TotalMoney AND TotalMoneyDiscount = @TotalMoneyDiscount AND Discount = @Discount AND TotalPeyment = @TotalPeyment AND datepart(day,DayCreate) = datepart(day,getdate()) AND datepart(month,DayCreate) = datepart(month,getdate()) AND datepart(year,DayCreate) = datepart(year,getdate()) AND datepart(hour,DayCreate) = datepart(hour,getdate()) AND datepart(minute,DayCreate) = datepart(minute,getdate()) )";
            sqlQuery += "BEGIN INSERT INTO tblPartnerBill(CustomerAccount,PartnerAccount,TotalMoney,TotalMoneyDiscount,Discount,DiscountCard,DiscountAdv,TotalPeyment,DayCreate) VALUES(@CustomerAccount,@PartnerAccount,@TotalMoney,@TotalMoneyDiscount,@Discount,@DiscountCard,@DiscountAdv,@TotalPeyment,getdate()) SELECT TOP 1 CAST(SCOPE_IDENTITY () as int)  END";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = CustomerAccount;
            Cmd.Parameters.Add("PartnerAccount", SqlDbType.NVarChar).Value = PartnerAccount;
            Cmd.Parameters.Add("TotalMoney", SqlDbType.Float).Value = TotalMoney;
            Cmd.Parameters.Add("TotalMoneyDiscount", SqlDbType.Float).Value = TotalMoneyDiscount;
            Cmd.Parameters.Add("Discount", SqlDbType.Float).Value = Discount;
            Cmd.Parameters.Add("DiscountCard", SqlDbType.Float).Value = DiscountCard;
            Cmd.Parameters.Add("DiscountAdv", SqlDbType.Float).Value = DiscountAdv;
            Cmd.Parameters.Add("TotalPeyment", SqlDbType.Float).Value = TotalPeyment;
            //int ret = Cmd.ExecuteNonQuery();
            int ret = (int)Cmd.ExecuteScalar(); //SELECT TOP 1 CAST(SCOPE_IDENTITY () as int) 

            sqlCon.Close();
            sqlCon.Dispose();

            return ret;
            //Response.Redirect("ProductCustomer.aspx");
        }
        catch
        {
            return 0;
        }
    }
    #endregion

    
    #region method setCustomersPaymentByCard
    public int setCustomersPaymentByCard(string BillId, float TotalMoney, string CustomerAccount)
    {
        try
        {
            SqlConnection sqlCon1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon1.Open();
            SqlCommand Cmd1 = sqlCon1.CreateCommand();
            string sqlQuery1 = "";
            sqlQuery1 = "IF NOT EXISTS (SELECT * FROM tblCustomersPaymentByCard WHERE BillId = @BillId AND TotalMoney = @TotalMoney AND datepart(day,DayCreate) = datepart(day,getdate()) AND datepart(month,DayCreate) = datepart(month,getdate()) AND datepart(year,DayCreate) = datepart(year,getdate()) AND datepart(hour,DayCreate) = datepart(hour,getdate()) AND datepart(minute,DayCreate) = datepart(minute,getdate()) )";
            sqlQuery1 += "BEGIN INSERT INTO tblCustomersPaymentByCard(BillId,TotalMoney,DayCreate,CustomerAccount) VALUES(@BillId,@TotalMoney,getdate(),@CustomerAccount) END";
            Cmd1.CommandText = sqlQuery1;
            Cmd1.Parameters.Add("BillId", SqlDbType.NVarChar).Value = BillId;
            Cmd1.Parameters.Add("TotalMoney", SqlDbType.Float).Value = TotalMoney;
            Cmd1.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = CustomerAccount;
            int ret = Cmd1.ExecuteNonQuery();
            sqlCon1.Close();
            sqlCon1.Dispose();

            return ret;
        }
        catch
        {
            return 0;
        }
    }
    #endregion

    #region PartnerBillDetail

    #region method getPartnerBillDetail
    public DataTable getPartnerBillDetail(string BillId)
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblPartnerBillDetail WHERE BillId = @BillId";
            Cmd.Parameters.Add("BillId", SqlDbType.NVarChar).Value = BillId;
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

    #region method setPartnerBillDetail
    public int setPartnerBillDetail(string BillId, string ProductId, string ProductName, string ProductPrice, string ProductNumber)
    {
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "";
            sqlQuery = "IF NOT EXISTS (SELECT * FROM tblPartnerBillDetail WHERE BillId = @BillId AND ProductId = @ProductId)";
            sqlQuery += "BEGIN INSERT INTO tblPartnerBillDetail(BillId,ProductId,ProductName,ProductPrice,ProductNumber) VALUES(@BillId,@ProductId,@ProductName,@ProductPrice,@ProductNumber) END";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("BillId", SqlDbType.NVarChar).Value = BillId;
            Cmd.Parameters.Add("ProductId", SqlDbType.Int).Value = ProductId;
            Cmd.Parameters.Add("ProductName", SqlDbType.NVarChar).Value = ProductName;
            Cmd.Parameters.Add("ProductPrice", SqlDbType.Float).Value = ProductPrice;
            Cmd.Parameters.Add("ProductNumber", SqlDbType.Float).Value = ProductNumber;
            int ret = Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();

            return ret;
        }
        catch
        {
            return 0;
        }
    }
    #endregion

    #endregion

    #region method setPartnerBillDetailOther
    public int setPartnerBillDetailOther(string BillId, string ProductId, string ProductName, string ProductPrice, string ProductNumber)
    {
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "";
            sqlQuery = "IF NOT EXISTS (SELECT * FROM tblPartnerBillDetailOrther WHERE BillId = @BillId AND ProductId = @ProductId)";
            sqlQuery += "BEGIN INSERT INTO tblPartnerBillDetailOrther(BillId,ProductId,ProductName,ProductPrice,ProductNumber) VALUES(@BillId,@ProductId,@ProductName,@ProductPrice,@ProductNumber) END";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("BillId", SqlDbType.NVarChar).Value = BillId;
            Cmd.Parameters.Add("ProductId", SqlDbType.Int).Value = ProductId;
            Cmd.Parameters.Add("ProductName", SqlDbType.NVarChar).Value = ProductName;
            Cmd.Parameters.Add("ProductPrice", SqlDbType.Float).Value = ProductPrice;
            Cmd.Parameters.Add("ProductNumber", SqlDbType.Float).Value = ProductNumber;
            int ret = Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();

            return ret;
        }
        catch
        {
            return 0;
        }
    }
    #endregion

    #region method getPartnerIdByAccount
    public int getPartnerIdByAccount(string Account)
    {
        int PartnerId = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT Id FROM tblPartner WHERE Account = @Account";
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                PartnerId = int.Parse(Rd["Id"].ToString());
            }
            Rd.Close();
            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {

        }
        return PartnerId;
    }
    #endregion

    #region method getPartnerIdById
    public DataTable getPartnerBillById(string billId)
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblPartnerBill WHERE Id = @Id";
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value = billId;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = Cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            objTable = ds.Tables[0];
            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {

        }
        return objTable;
    }
    #endregion

    #region method getPartnerInforByAccount
    public DataTable getPartnerInforByAccount(string Account)
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblPartner WHERE Account = @Account";
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

    #region method getProductCount
    public int getProductCount(string Account)
    {
        int CountItem = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblProduct WHERE PartnerId = (SELECT TOP 1 Id FROM tblPartner WHERE Account = @Account)";
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = Cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            sqlCon.Close();
            sqlCon.Dispose();
            CountItem = ds.Tables[0].Rows.Count;
        }
        catch
        {

        }
        return CountItem;
    }
    #endregion

    #region method getProductVIPCount
    public int getProductVIPCount(string Account)
    {
        int CountItem = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblProduct WHERE PartnerId = (SELECT TOP 1 Id FROM tblPartner WHERE Account = @Account) AND VIP = 1";
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = Cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            sqlCon.Close();
            sqlCon.Dispose();
            CountItem = ds.Tables[0].Rows.Count;
        }
        catch
        {

        }
        return CountItem;
    }
    #endregion

    #region method getProductBestSaleCount
    public int getProductBestSaleCount(string Account)
    {
        int CountItem = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblProduct WHERE PartnerId = (SELECT TOP 1 Id FROM tblPartner WHERE Account = @Account) AND BestSale = 1";
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = Cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            sqlCon.Close();
            sqlCon.Dispose();
            CountItem = ds.Tables[0].Rows.Count;
        }
        catch
        {

        }
        return CountItem;
    }
    #endregion

    #region method getProductBillCount
    public int getProductBillCount(string Account)
    {
        int CountItem = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblPartnerCustomer WHERE PartnerId = (SELECT TOP 1 Id FROM tblPartner WHERE Account = @Account)";
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = Cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            sqlCon.Close();
            sqlCon.Dispose();
            CountItem = ds.Tables[0].Rows.Count;
        }
        catch
        {

        }
        return CountItem;
    }
    #endregion

    #region method getProductDoanhSo
    public double getProductDoanhSo(string Account)
    {
        double TotalMoney = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT SUM(Price*Number) AS TotalMoney FROM tblPartnerCustomer WHERE PartnerId = (SELECT TOP 1 Id FROM tblPartner WHERE Account = @Account)";
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = Cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            sqlCon.Close();
            sqlCon.Dispose();
            if (ds.Tables[0].Rows.Count > 0)
            {
                TotalMoney = double.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
        }
        catch
        {

        }
        return TotalMoney;
    }
    #endregion

    #region 
    //public DataTable getPartner(string account)
    //{
       
    //    DataTable objTable = this.getPartnerInforByAccount(Session["ACCOUNT"].ToString());

    //    if (objTable.Rows.Count > 0)
    //    {
    //        this.strName = objTable.Rows[0]["Name"].ToString();
    //        this.strAddress = objTable.Rows[0]["Address"].ToString();
    //        this.strManager = objTable.Rows[0]["Manager"].ToString();
    //        this.strPhone = objTable.Rows[0]["Phone"].ToString();
    //        this.strEmail = objTable.Rows[0]["Email"].ToString();
    //        this.strTaxcode = objTable.Rows[0]["TaxCode"].ToString();
    //        this.strAccount = objTable.Rows[0]["Account"].ToString();

    //        this.strDiscount = objTable.Rows[0]["Discount"].ToString();
    //        this.strDiscountCard = objTable.Rows[0]["DiscountCard"].ToString();
    //        this.strDiscountAdv = objTable.Rows[0]["DiscountAdv"].ToString();

    //        if (objTable.Rows[0]["BestSale"].ToString() == "True")
    //        {
    //            this.strBestSale = "X";
    //        }
    //        else
    //        {
    //            this.strBestSale = "";
    //        }
    //        if (objTable.Rows[0]["VIP"].ToString() == "True")
    //        {
    //            this.strVIP = "X";
    //        }
    //        else
    //        {
    //            this.strVIP = "";
    //        }
    //    }
       


    //}
    #endregion

}