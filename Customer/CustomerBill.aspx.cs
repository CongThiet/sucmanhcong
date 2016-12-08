using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_CustomerBill : System.Web.UI.Page
{
    #region declare objects
    public DataTable objTable = new DataTable();
    public string strHtml = "", strDSInDay = "", strDSInWeek = "", strDSInMonth = "", strDSTotal = "", strDSCard = "";
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ACCOUNT"] == null)
        {
            Response.Redirect("../");
        }
        if (!Page.IsPostBack)
        {
            this.strDSInDay = String.Format("{0:0,0}", this.getPartnerBillInDay());
            if (this.strDSInDay.Trim() == "00")
            {
                this.strDSInDay = "0";
            }

            this.strDSInWeek = String.Format("{0:0,0}", this.getPartnerBillInWeek());
            if (this.strDSInWeek.Trim() == "00")
            {
                this.strDSInWeek = "0";
            }

            this.strDSInMonth = String.Format("{0:0,0}", this.getPartnerBillInMonth());
            if (this.strDSInMonth.Trim() == "00")
            {
                this.strDSInMonth = "0";
            }

            this.strDSTotal = String.Format("{0:0,0}", this.getPartnerBill());
            if (this.strDSTotal.Trim() == "00")
            {
                this.strDSTotal = "0";
            }

            this.strDSCard = String.Format("{0:0,0}", this.getCustomerTotalDiscountCard(Session["ACCOUNT"].ToString()));
            if (this.strDSCard.Trim() == "00")
            {
                this.strDSCard = "0";
            }

            this.objTable = this.getCustomerBill();
            if (this.objTable.Rows.Count > 0)
            {
                for (int i = 0; i < this.objTable.Rows.Count; i++)
                {
                    strHtml += "<div style =\"width:100%; margin-top:1px;\">";

                    strHtml += "<div style=\"width: 5%; float: left; border:solid 1px #f3f1f1; border-right:none; border-top:none;text-align:center;height:26px; line-height:26px; color:#000;\">";
                    strHtml += this.objTable.Rows[i]["TT"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 18%; float: left; border:solid 1px #f3f1f1;border-top:none;padding-left:6px;height:26px; line-height:26px; color:#000;\">";
                    strHtml += this.objTable.Rows[i]["DayCreate"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 10%; float: left; border:solid 1px #f3f1f1;border-top:none;border-left:none; text-align:right;height:26px; line-height:26px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["TotalMoney"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 10%; float: left; border:solid 1px #f3f1f1;border-top:none;border-left:none; text-align:right;height:26px; line-height:26px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["TotalMoneyDiscount"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 5%; float: left; border:solid 1px #f3f1f1;border-top:none;border-left:none; text-align:right;height:26px; line-height:26px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["Discount"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 5%; float: left; border:solid 1px #f3f1f1;border-top:none;border-left:none; text-align:right;height:26px; line-height:26px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["DiscountCard"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 10%; float: left; border:solid 1px #f3f1f1; border-left:none; text-align:right;border-top:none;padding-right:5px;height:26px; line-height:26px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["TotalPeyment"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 32%; float: left; border:solid 1px #f3f1f1; border-left:none; text-align:justify;border-top:none;height:26px; line-height:26px; color:#000;\">";
                    strHtml += this.objTable.Rows[i]["Note"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width:5%; float: right; border:solid 1px #f3f1f1; border-left:none; text-align:center;border-top:none;height:26px; line-height:26px; color:#000;\">";
                    strHtml += "<a href = \"BillNote.aspx?id=" + this.objTable.Rows[i]["Id"].ToString() + "\">Sửa</a>";
                    strHtml += "</div>";

                    strHtml += "</div>";
                }
            }
        }
    }
    #endregion

    #region method getCustomerBill
    public DataTable getCustomerBill()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT 0 AS TT, * FROM tblPartnerBill WHERE CustomerAccount = @CustomerAccount";
        Cmd.Parameters.Add("CustomerAccount",SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
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
        return ds.Tables[0];
    }
    #endregion

    #region method getPartnerBillInDay
    public double getPartnerBillInDay()
    {
        double tmpValue = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT ISNULL(SUM(TotalMoneyDiscount),0) AS TotalMoneyDiscount FROM tblPartnerBill WHERE CustomerAccount = @CustomerAccount AND datepart(day,DayCreate) = datepart(day,getdate()) AND datepart(month,DayCreate) = datepart(month,getdate()) AND datepart(year,DayCreate) = datepart(year,getdate())";
            Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = double.Parse(Rd["TotalMoneyDiscount"].ToString());
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

    #region method getPartnerBillInWeek
    public double getPartnerBillInWeek()
    {
        double tmpValue = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT ISNULL(SUM(TotalMoneyDiscount),0) AS TotalMoneyDiscount FROM tblPartnerBill WHERE CustomerAccount = @CustomerAccount AND datepart(week,DayCreate) = datepart(week,getdate()) AND datepart(month,DayCreate) = datepart(month,getdate()) AND datepart(year,DayCreate) = datepart(year,getdate())";
            Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = double.Parse(Rd["TotalMoneyDiscount"].ToString());
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

    #region method getPartnerBillInMonth
    public double getPartnerBillInMonth()
    {
        double tmpValue = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT ISNULL(SUM(TotalMoneyDiscount),0) AS TotalMoneyDiscount FROM tblPartnerBill WHERE CustomerAccount = @CustomerAccount AND datepart(month,DayCreate) = datepart(month,getdate()) AND datepart(year,DayCreate) = datepart(year,getdate())";
            Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = double.Parse(Rd["TotalMoneyDiscount"].ToString());
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

    #region method getPartnerBill
    public double getPartnerBill()
    {
        double tmpValue = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT ISNULL(SUM(TotalMoneyDiscount),0) AS TotalMoneyDiscount FROM tblPartnerBill WHERE CustomerAccount = @CustomerAccount";
            Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = double.Parse(Rd["TotalMoneyDiscount"].ToString());
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

    #region method getPartnerBillTotalDiscount
    public double getPartnerBillTotalDiscount()
    {
        double tmpValue = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT ISNULL(SUM((TotalMoneyDiscount*Discount)/100),0) AS Discount FROM tblPartnerBill WHERE PartnerAccount = @PartnerAccount";
            Cmd.Parameters.Add("PartnerAccount", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = double.Parse(Rd["Discount"].ToString());
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

    #region method getCustomerTotalDiscountCard
    public double getCustomerTotalDiscountCard(string CustomerAccount)
    {
        double tmpValue = 0, tmpValue1 = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT ISNULL(SUM((TotalMoneyDiscount*DiscountCard)/100),0) AS Discount FROM tblPartnerBill WHERE CustomerAccount = @CustomerAccount";
            Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = CustomerAccount;
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = double.Parse(Rd["Discount"].ToString());
            }
            Rd.Close();

            SqlCommand Cmd1 = sqlCon.CreateCommand();
            Cmd1.CommandText = "SELECT ISNULL(SUM(TotalMoney),0) AS TotalMoney FROM tblCustomersPaymentByCard WHERE CustomerAccount = @CustomerAccount";
            Cmd1.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = CustomerAccount;
            SqlDataReader Rd1 = Cmd1.ExecuteReader();
            while (Rd1.Read())
            {
                tmpValue1 = double.Parse(Rd1["TotalMoney"].ToString());
            }
            Rd1.Close();

            tmpValue = tmpValue - tmpValue1;

            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {

        }
        return tmpValue;
    }
    #endregion

    #region method getPartnerBillTotalDiscountAdv
    public double getPartnerBillTotalDiscountAdv()
    {
        double tmpValue = 0;
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT ISNULL(SUM((TotalMoneyDiscount*DiscountAdv)/100),0) AS Discount FROM tblPartnerBill WHERE PartnerAccount = @PartnerAccount";
            Cmd.Parameters.Add("PartnerAccount", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = double.Parse(Rd["Discount"].ToString());
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
}