using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_ViewBill : System.Web.UI.Page
{
    #region declare objects
    public string strCusAccount = "", strCusName = "", strCusAddress = "", strCusPhone = "", strIdCard = "", strCusEmail = "", strCusAccountType = "", strCustomerTotalDiscountCard = "0", strDiscount = "-", strDiscountCard = "-", strDiscountAdv = "-", strHtml = "", strHtml1 = "";
    private int billId = 0;
    private DataTable objTable = new DataTable();
    private DataTable objTableDetailt = new DataTable();
    private DataTable objTableDetailtOrther = new DataTable();
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ACCOUNT"] == null)
        {
            Response.Redirect("/");
        }
        try
        {
            this.billId = int.Parse(Request.QueryString["id"].ToString());
        }
        catch
        {
            this.billId = 0;
        }
        if (!Page.IsPostBack)
        {
            this.objTable = this.getPartnerBill(this.billId.ToString());
            if (this.objTable.Rows.Count > 0)
            {
                this.lblAccount.Text = "Số thẻ: <a data-toggle=\"modal\" data-target=\"#myModal\" href = \"#\">" + this.objTable.Rows[0]["CustomerAccount"].ToString() + "</a>";
                this.lblName.Text = "Tên khách hàng: " + this.objTable.Rows[0]["CustomerName"].ToString();
                this.getCustomer(this.objTable.Rows[0]["CustomerAccount"].ToString());
                this.txtTotalMoney.Value = this.objTable.Rows[0]["TotalMoney"].ToString();
                this.strDiscount = this.objTable.Rows[0]["Discount"].ToString();
                this.strDiscountCard = this.objTable.Rows[0]["DiscountCard"].ToString();
                this.strDiscountAdv = this.objTable.Rows[0]["DiscountAdv"].ToString();
                this.txtTotalMoneyDiscount.Text = this.objTable.Rows[0]["TotalMoneyDiscount"].ToString();
                this.txtTotalMoneyPayment.Text = this.objTable.Rows[0]["TotalPeyment"].ToString();
                this.lblMsg1.Text = "Ngày tạo: " + DateTime.Parse(this.objTable.Rows[0]["DayCreate"].ToString()).ToString("dd/MM/yyyy HH:mm");
            }

            this.objTableDetailt = this.getPartnerBillDetail(this.billId.ToString());
            if (this.objTableDetailt.Rows.Count > 0)
            {
                this.strHtml = "";
                for (int i = 0; i < this.objTableDetailt.Rows.Count; i++)
                {
                    this.strHtml += "<div style=\"width: 100%;\">";
                    this.strHtml += "<div style=\"width: 5%; float: left; text-align:center; padding:3px; color:#000; font-size:13px;\">";
                    this.strHtml += (i + 1).ToString();
                    this.strHtml += "</div>";
                    this.strHtml += "<div style=\"width: 65%; float: left; text-align:justify; padding:3px; color:#000; font-size:13px;\">";
                    this.strHtml += this.objTableDetailt.Rows[i]["ProductName"].ToString();
                    this.strHtml += "</div>";
                    this.strHtml += "<div style=\"width: 15%; float: left; text-align:right; padding:3px; color:#000; font-size:13px;\">";
                    this.strHtml += this.objTableDetailt.Rows[i]["ProductNumber"].ToString();
                    this.strHtml += "</div>";
                    this.strHtml += "<div style=\"width: 15%; float: left; text-align:right; padding:3px; color:#000; font-size:13px;\">";
                    this.strHtml += this.objTableDetailt.Rows[i]["ProductPrice"].ToString();
                    this.strHtml += "</div>";
                    this.strHtml += "</div>";
                }
            }

            this.objTableDetailtOrther = this.getPartnerBillDetailOther(this.billId.ToString());
            if (this.objTableDetailtOrther.Rows.Count > 0)
            {
                this.strHtml1 = "";
                for (int i = 0; i < this.objTableDetailtOrther.Rows.Count; i++)
                {
                    this.strHtml1 += "<div style=\"width: 100%;\">";
                    this.strHtml1 += "<div style=\"width: 5%; float: left; text-align:center; padding:3px; color:#000; font-size:13px;\">";
                    this.strHtml1 += (i + 1).ToString();
                    this.strHtml1 += "</div>";
                    this.strHtml1 += "<div style=\"width: 65%; float: left; text-align:justify; padding:3px; color:#000; font-size:13px;\">";
                    this.strHtml1 += this.objTableDetailtOrther.Rows[i]["ProductName"].ToString();
                    this.strHtml1 += "</div>";
                    this.strHtml1 += "<div style=\"width: 15%; float: left; text-align:right; padding:3px; color:#000; font-size:13px;\">";
                    this.strHtml1 += this.objTableDetailtOrther.Rows[i]["ProductNumber"].ToString();
                    this.strHtml1 += "</div>";
                    this.strHtml1 += "<div style=\"width: 15%; float: left; text-align:right; padding:3px; color:#000; font-size:13px;\">";
                    this.strHtml1 += this.objTableDetailtOrther.Rows[i]["ProductPrice"].ToString();
                    this.strHtml1 += "</div>";
                    this.strHtml1 += "</div>";
                }
            }
        }
    }
     #endregion

    #region method getPartnerBill
    public DataTable getPartnerBill(string BillId)
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT *, ISNULL((SELECT Name FROM tblCustomers WHERE Account = tblPartnerBill.CustomerAccount),'') AS CustomerName, ISNULL((SELECT AccountType FROM tblCustomers WHERE Account = tblPartnerBill.CustomerAccount),'') AS AccountType FROM tblPartnerBill WHERE Id = @Id";
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value = BillId;
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            da.SelectCommand = Cmd;
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

    #region method getPartnerBillDetail
    public DataTable getPartnerBillDetail(string BillId)
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblPartnerBillDetail WHERE BillId = @BillId AND ISNULL(ProductNumber,0) > 0";
            Cmd.Parameters.Add("BillId", SqlDbType.NVarChar).Value = BillId;
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

    #region method getPartnerBillDetailOther
    public DataTable getPartnerBillDetailOther(string BillId)
    {
        DataTable objTable = new DataTable();
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblPartnerBillDetailOrther WHERE BillId = @BillId AND ISNULL(ProductNumber,0) > 0";
            Cmd.Parameters.Add("BillId", SqlDbType.NVarChar).Value = BillId;
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

    #region method getCustomer
    public void getCustomer(string Account)
    {
        this.lblMsg1.Text = "-:-";
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblCustomers WHERE Account = @Account";
        Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            this.strCusAccount = Account.ToUpper();
            this.strCusName = Rd["Name"].ToString();
            this.strCusAddress = Rd["Address"].ToString();
            this.strCusPhone = Rd["Phone"].ToString();
            this.strIdCard = Rd["IdCard"].ToString();
            this.strCusEmail = Rd["Email"].ToString();

            this.lblName.Text = "Họ tên: " + Rd["Name"].ToString();
            if (Rd["AccountType"].ToString() == "CustomerAccount")
            {
                this.ckbD.Checked = true;
                this.ckbB.Checked = false;
                this.ckbV.Checked = false;

                this.ckbD1.Checked = true;
                this.ckbB1.Checked = false;
                this.ckbV1.Checked = false;
            }
            else if (Rd["AccountType"].ToString() == "CustomerAccount1")
            {
                this.ckbD.Checked = false;
                this.ckbB.Checked = true;
                this.ckbV.Checked = false;

                this.ckbD1.Checked = false;
                this.ckbB1.Checked = true;
                this.ckbV1.Checked = false;
            }
            else if (Rd["AccountType"].ToString() == "CustomerAccount2")
            {
                this.ckbD.Checked = false;
                this.ckbB.Checked = false;
                this.ckbV.Checked = true;

                this.ckbD1.Checked = false;
                this.ckbB1.Checked = false;
                this.ckbV1.Checked = true;
            }
            this.lblCusAvatar.Text = "<img width = \"150px\" height = \"100px\" src = \"/Images/Customer/" + Rd["Avatar"].ToString() + "\">";
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion
}