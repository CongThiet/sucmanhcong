using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_CustomerInfo : System.Web.UI.Page
{
    #region declare objects
    private string Id = "";
    private TVSFunc objFunc = new TVSFunc();
    public int SoGiaoDich = 0;
    public double TongDoanhSo = 0;
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.Id = Request["id"].ToString();
        }
        catch
        {
            this.Id = "";
        }
        if (!Page.IsPostBack)
        {
            this.getCustomer();
            this.SoGiaoDich = this.getProductBillCountById(this.Id.ToString());
            this.TongDoanhSo = this.getProductDoanhSoById(this.Id.ToString());
        }
    }
    #endregion

    #region method getCustomer
    public void getCustomer()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblCustomers WHERE Account = @Account";
        Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = this.Id;
        SqlDataReader Rd = Cmd.ExecuteReader();
        string strLogo = "";
        while (Rd.Read())
        {
            this.lblName.Text = Rd["Name"].ToString();
            this.lblAddress.Text = "Địa chỉ: " + Rd["Address"].ToString();
            this.lblPhone.Text = "Điện thoại : " + Rd["Phone"].ToString();
            try
            {
                this.lblBirthday.Text = "Ngày sinh : " + DateTime.Parse(Rd["Birthday"].ToString()).ToString("dd/MM/yyyy");
            }
            catch { }
            this.lblEmail.Text = "Email : " + Rd["Email"].ToString();
            this.lblEmail.Text = "Số CMND : " + Rd["IdCard"].ToString();
            this.txtDiscountCard.Text = Rd["DiscountCard"].ToString();
            this.txtAccount.Text = Rd["Account"].ToString();

            strLogo = "<div class=\"circular\"></div><style>";
            strLogo += ".circular {width: 150px;height: 150px; border:solid 1px aqua; border-radius: 50px;	-webkit-border-radius: 150px;-moz-border-radius: 150px;";
            strLogo += "background: url('/Images/Customer/" + Rd["Avatar"].ToString() + "') no-repeat";
            strLogo += "</style>";
        }
        this.lblAvatar.Text = strLogo;//"<img width = \"125px\" height = \"100px\" src = \"/Images/Customer/" + Rd["Avatar"].ToString() + "\" style = \"\">";
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
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
}