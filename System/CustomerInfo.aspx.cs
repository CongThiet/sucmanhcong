using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_CustomerInfo : System.Web.UI.Page
{
    #region declare objects
    private int itemId = 0;
    private TVSFunc objFunc = new TVSFunc();
    public int SoGiaoDich = 0;
    public double TongDoanhSo = 0;
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
            this.itemId = 0;
            this.btnCreate.Enabled = false;
        }
        if (!Page.IsPostBack)
        {
            this.getCustomer();
            this.SoGiaoDich = this.getProductBillCountById(this.itemId.ToString());
            this.TongDoanhSo = this.getProductDoanhSoById(this.itemId.ToString());
            if (this.txtAccount.Text.Trim() == "")
            {
                this.btnCreate.Enabled = true;
            }
            else
            {
                this.btnCreate.Enabled = false;
                this.ddlTypeCard.Enabled = false;
                this.txtAccount.ReadOnly = true;
            }
        }
    } 
    #endregion

    #region method getCustomer
    public void getCustomer()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblCustomers WHERE Id = @Id";
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = this.itemId;
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            this.lblName.Text = Rd["Name"].ToString();
            this.lblAddress.Text = "Địa chỉ: "+Rd["Address"].ToString();
            this.lblPhone.Text = "Điện thoại : "+Rd["Phone"].ToString();
            try
            {
                this.lblBirthday.Text = "Ngày sinh : "+DateTime.Parse(Rd["Birthday"].ToString()).ToString("dd/MM/yyyy");
            }
            catch { }
            this.lblEmail.Text = "Email : "+Rd["Email"].ToString();
            this.lblIdCard.Text = "Số CMND : " + Rd["IdCard"].ToString();
            this.txtAccount.Text = Rd["Account"].ToString();
            this.lblAvatar.Text = "<img width = \"125px\" height = \"100px\" alt = \"Hình đại diện\" src = \"/Images/Customer/" + Rd["Avatar"].ToString() + "\">";
            this.ddlTypeCard.SelectedValue = Rd["AccountType"].ToString();
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion

    #region method btnCreate_Click
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            if (this.itemId == 0)
            {
                return;
            }
            TVSFunc objFunc = new TVSFunc();
            string CustomerAccount = "";
            CustomerAccount = objFunc.getCustomerAccount(this.ddlTypeCard.SelectedValue.ToString());
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "UPDATE tblCustomers SET Account = @Account, AccountType = @AccountType, DayCreateAccount = getdate() WHERE Id = @Id";
            string strCardNumber = "";
            if (this.txtAccount.Text.Trim() == "")
            {
                strCardNumber = this.itemId.ToString("000000");
            }
            else
            {
                strCardNumber = this.txtAccount.Text.Trim();
            }
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = CustomerAccount + strCardNumber;
            Cmd.Parameters.Add("AccountType", SqlDbType.NVarChar).Value = this.ddlTypeCard.SelectedValue.ToString();
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value = this.itemId;
            Cmd.ExecuteNonQuery();
            this.txtAccount.Text = CustomerAccount + strCardNumber;
            this.btnCreate.Enabled = false;
            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch { }
    } 
    #endregion

    #region method getProductCountById
    public int getProductCountById(string PartnerId)
    {
        int CountItem = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblProduct WHERE PartnerId = @PartnerId";
            Cmd.Parameters.Add("PartnerId", SqlDbType.Int).Value = PartnerId;
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

    #region method getProductVIPCountById
    public int getProductVIPCountById(string PartnerId)
    {
        int CountItem = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblProduct WHERE PartnerId = @PartnerId AND VIP = 1";
            Cmd.Parameters.Add("PartnerId", SqlDbType.Int).Value = PartnerId;
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

    #region method getProductBestSaleCountById
    public int getProductBestSaleCountById(string PartnerId)
    {
        int CountItem = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblProduct WHERE PartnerId = @PartnerId AND BestSale = 1";
            Cmd.Parameters.Add("PartnerId", SqlDbType.Int).Value = PartnerId;
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

    #region method getProductBillCountById
    public int getProductBillCountById(string PartnerId)
    {
        int CountItem = 0;
        try
        {
            //SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            //sqlCon.Open();
            //SqlCommand Cmd = sqlCon.CreateCommand();
            //Cmd.CommandText = "SELECT * FROM tblPartnerCustomer WHERE PartnerId = @PartnerId";
            //Cmd.Parameters.Add("PartnerId", SqlDbType.Int).Value = PartnerId;
            //SqlDataAdapter da = new SqlDataAdapter();
            //da.SelectCommand = Cmd;
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //sqlCon.Close();
            //sqlCon.Dispose();
            //CountItem = ds.Tables[0].Rows.Count;
        }
        catch
        {

        }
        return CountItem;
    }
    #endregion

    #region method getProductDoanhSoById
    public double getProductDoanhSoById(string PartnerId)
    {
        double TotalMoney = 0;
        try
        {
            //SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            //sqlCon.Open();
            //SqlCommand Cmd = sqlCon.CreateCommand();
            //Cmd.CommandText = "SELECT SUM(Price*Number) AS TotalMoney FROM tblPartnerCustomer WHERE PartnerId = @PartnerId";
            //Cmd.Parameters.Add("PartnerId", SqlDbType.Int).Value = PartnerId;
            //SqlDataAdapter da = new SqlDataAdapter();
            //da.SelectCommand = Cmd;
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //sqlCon.Close();
            //sqlCon.Dispose();
            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    TotalMoney = double.Parse(ds.Tables[0].Rows[0][0].ToString());
            //}
        }
        catch
        {

        }
        return TotalMoney;
    }
    #endregion

    #region method btnUpdate_Click
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    if (this.itemId == 0 || this.txtDiscountCard.Text.Trim() == "")
        //    {
        //        return;
        //    }
        //    TVSFunc objFunc = new TVSFunc();
        //    string CustomerAccount = "";
        //    CustomerAccount = objFunc.getCustomerAccount();
        //    SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        //    sqlCon.Open();
        //    SqlCommand Cmd = sqlCon.CreateCommand();
        //    Cmd.CommandText = "UPDATE tblCustomers SET DiscountCard = @DiscountCard WHERE Id = @Id";
        //    Cmd.Parameters.Add("DiscountCard", SqlDbType.NVarChar).Value = this.txtDiscountCard.Text;
        //    Cmd.Parameters.Add("Id", SqlDbType.Int).Value = this.itemId;
        //    Cmd.ExecuteNonQuery();
        //    sqlCon.Close();
        //    sqlCon.Dispose();
        //}
        //catch { }
    } 
    #endregion
}