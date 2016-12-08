using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mStore_Sell : System.Web.UI.Page
{
    #region declare objects
    public DataTable objTableProduct = new DataTable();
    public string strHtml = "", strValue = "", strCurrBillId = "";
    private Partner objPartner = new Partner();
    public string strName = "", strAddress = "", strPhone = "", strManager = "", strEmail = "", strTaxcode = "", strAccount = "", strBestSale = "", strVIP = "", strMsg = "", strDiscount = "-", strDiscountCard = "-", strDiscountAdv = "-", strCustomerTotalDiscountCard = "0";
    public string strCusAccount  = "", strCusName = "", strCusAddress = "", strCusPhone = "", strIdCard = "", strCusEmail = "", strCusAccountType = "";
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ACCOUNT"] == null)
        {
            Response.Redirect("/");
        }
        if (!Page.IsPostBack)
        {
            this.getPartner();
            this.getProduct(Session["ACCOUNT"].ToString());
        }
        this.strDiscount = "-";
        this.strDiscountCard = "-";
        this.strDiscountAdv = "-";
    }
    #endregion

    #region method setProducts
    public void setProducts(int PartnerId, string CardNumberId, int ProductId, double Number, double Price)
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
            Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();
            Response.Redirect("ProductCustomer.aspx");
        }
        catch
        {

        }
    }
    #endregion

    #region method setPartnerBill
    public void setPartnerBill(bool PaymentByCard)
    {
        try
        {
            this.getPartnerInforByAccount(Session["ACCOUNT"].ToString());
            this.lblMsg1.Text = "";
            if (this.txtAccount.Value.ToString() == "")
            {
                this.lblMsg1.Text = "Chưa xác định thông tin khách hàng";
                return;
            }
            if (this.txtTotalMoney.Value.ToString().Trim() == "")
            {
                this.lblMsg1.Text = "Chưa xác định tổng tiền đơn hàng";
                return;
            }
            if (this.txtTotalMoneyDiscount.Text == "")
            {
                this.lblMsg1.Text = "Chưa xác định tổng tiền được hưởng giảm giá của đơn hàng";
                return;
            }
            if (this.strDiscount == "")
            {
                this.lblMsg1.Text = "Chưa xác định mức giảm giá trực tiếp cho khách hàng";
                return;
            }
            else
            {
                try
                {
                    double tmpDiscount = 0;
                    tmpDiscount = double.Parse(this.strDiscount);
                }
                catch
                {
                    this.lblMsg1.Text = "Mức giảm giá trực tiếp cho khách hàng sai định dạng";
                    return;
                }
            }
            if (this.strDiscountCard == "")
            {
                this.lblMsg1.Text = "Chưa xác định mức giảm giá tích luỹ thẻ cho khách hàng";
                return;
            }
            else
            {
                try
                {
                    double tmpDiscountCard = 0;
                    tmpDiscountCard = double.Parse(this.strDiscountCard);
                }
                catch
                {
                    this.lblMsg1.Text = "Mức giảm giá cho tích luỹ thẻ sai định dạng";
                    return;
                }
            }
            if (this.strDiscountAdv == "")
            {
                this.lblMsg1.Text = "Chưa xác định mức giảm giá cho quảng cáo";
                return;
            }
            else
            {
                try
                {
                    double tmpDiscountAdv = 0;
                    tmpDiscountAdv = double.Parse(this.strDiscountAdv);
                }
                catch
                {
                    this.lblMsg1.Text = "Mức giảm giá cho quảng cáo sai định dạng";
                    return;
                }
            }
            if (this.txtTotalMoneyPayment.Text == "")
            {
                this.lblMsg1.Text = "Chưa xác định số tiền cần thanh toán";
                return;
            }
            else
            {
                try
                {
                    double tmpTotalMoneyPayment = 0;
                    tmpTotalMoneyPayment = double.Parse(this.txtTotalMoneyPayment.Text);
                }
                catch
                {
                    this.lblMsg1.Text = "Số tiền cần thanh toán sai định dạng";
                    return;
                }
            }
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "";
            sqlQuery = "IF NOT EXISTS (SELECT * FROM tblPartnerBill WHERE CustomerAccount = @CustomerAccount AND PartnerAccount = @PartnerAccount AND TotalMoney = @TotalMoney AND TotalMoneyDiscount = @TotalMoneyDiscount AND Discount = @Discount AND TotalPeyment = @TotalPeyment AND datepart(day,DayCreate) = datepart(day,getdate()) AND datepart(month,DayCreate) = datepart(month,getdate()) AND datepart(year,DayCreate) = datepart(year,getdate()) AND datepart(hour,DayCreate) = datepart(hour,getdate()) AND datepart(minute,DayCreate) = datepart(minute,getdate()) )";
            sqlQuery += "BEGIN INSERT INTO tblPartnerBill(CustomerAccount,PartnerAccount,TotalMoney,TotalMoneyDiscount,Discount,DiscountCard,DiscountAdv,TotalPeyment,DayCreate) VALUES(@CustomerAccount,@PartnerAccount,@TotalMoney,@TotalMoneyDiscount,@Discount,@DiscountCard,@DiscountAdv,@TotalPeyment,getdate()) END";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = txtAccount.Value.ToString();
            Cmd.Parameters.Add("PartnerAccount", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
            Cmd.Parameters.Add("TotalMoney", SqlDbType.Float).Value = this.txtTotalMoney.Value.ToString().Trim();
            Cmd.Parameters.Add("TotalMoneyDiscount", SqlDbType.Float).Value = this.txtTotalMoneyDiscount.Text;
            Cmd.Parameters.Add("Discount", SqlDbType.Float).Value = this.strDiscount;
            Cmd.Parameters.Add("DiscountCard", SqlDbType.Float).Value = this.strDiscountCard;
            Cmd.Parameters.Add("DiscountAdv", SqlDbType.Float).Value = this.strDiscountAdv;
            Cmd.Parameters.Add("TotalPeyment", SqlDbType.Float).Value = this.txtTotalMoneyPayment.Text;
            Cmd.ExecuteNonQuery();
            string BillId = "";
            sqlQuery = "SELECT TOP 1 Id FROM tblPartnerBill ORDER BY Id DESC";
            Cmd.CommandText = sqlQuery;
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                BillId = Rd["Id"].ToString();
            }
            Rd.Close();
            sqlCon.Close();
            sqlCon.Dispose();

            if (BillId != "")
            {
                #region Luu chi tiet hoa don chinh thuc
                try
                {
                    NameValueCollection nvc = Request.Form;
                    if (nvc.Count > 0)
                    {
                        foreach (string s in nvc)
                            foreach (string v in nvc.GetValues(s))
                            {
                                if (s.Contains("txt#"))
                                {
                                    if (v.Trim() != "")
                                    {
                                        string[] arr = s.Split('#');
                                        this.setPartnerBillDetail(BillId, arr[1], "", arr[2], v);
                                    }
                                }
                            }
                    }
                }
                catch
                {
                }
                #endregion

                #region Luu chi tiet hoa don phu
                if (this.txtProductName1.Text.Trim() != "" && this.txtProductNumber1.Text.Trim() != "" && this.txtProductPrice1.Text.Trim() != "")
                {
                    try
                    {
                        this.setPartnerBillDetailOther(BillId, this.txtOrder1.Text, this.txtProductName1.Text, this.txtProductNumber1.Text, this.txtProductPrice1.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName2.Text.Trim() != "" && this.txtProductNumber2.Text.Trim() != "" && this.txtProductPrice2.Text.Trim() != "")
                {
                    try
                    {
                        this.setPartnerBillDetailOther(BillId, this.txtOrder2.Text, this.txtProductName2.Text, this.txtProductNumber2.Text, this.txtProductPrice2.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName3.Text.Trim() != "" && this.txtProductNumber3.Text.Trim() != "" && this.txtProductPrice3.Text.Trim() != "")
                {
                    try
                    {
                        this.setPartnerBillDetailOther(BillId, this.txtOrder3.Text, this.txtProductName3.Text, this.txtProductNumber3.Text, this.txtProductPrice3.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName4.Text.Trim() != "" && this.txtProductNumber4.Text.Trim() != "" && this.txtProductPrice4.Text.Trim() != "")
                {
                    try
                    {
                        this.setPartnerBillDetailOther(BillId, this.txtOrder4.Text, this.txtProductName4.Text, this.txtProductNumber4.Text, this.txtProductPrice4.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName5.Text.Trim() != "" && this.txtProductNumber5.Text.Trim() != "" && this.txtProductPrice5.Text.Trim() != "")
                {
                    try
                    {
                        this.setPartnerBillDetailOther(BillId, this.txtOrder5.Text, this.txtProductName5.Text, this.txtProductNumber5.Text, this.txtProductPrice5.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName6.Text.Trim() != "" && this.txtProductNumber6.Text.Trim() != "" && this.txtProductPrice6.Text.Trim() != "")
                {
                    try
                    {
                        this.setPartnerBillDetailOther(BillId, this.txtOrder6.Text, this.txtProductName6.Text, this.txtProductNumber6.Text, this.txtProductPrice6.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName7.Text.Trim() != "" && this.txtProductNumber7.Text.Trim() != "" && this.txtProductPrice7.Text.Trim() != "")
                {
                    try
                    {
                        this.setPartnerBillDetailOther(BillId, this.txtOrder7.Text, this.txtProductName7.Text, this.txtProductNumber7.Text, this.txtProductPrice7.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName8.Text.Trim() != "" && this.txtProductNumber8.Text.Trim() != "" && this.txtProductPrice8.Text.Trim() != "")
                {
                    try
                    {
                        this.setPartnerBillDetailOther(BillId, this.txtOrder8.Text, this.txtProductName8.Text, this.txtProductNumber8.Text, this.txtProductPrice8.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName9.Text.Trim() != "" && this.txtProductNumber9.Text.Trim() != "" && this.txtProductPrice9.Text.Trim() != "")
                {
                    try
                    {
                        this.setPartnerBillDetailOther(BillId, this.txtOrder9.Text, this.txtProductName9.Text, this.txtProductNumber9.Text, this.txtProductPrice9.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName10.Text.Trim() != "" && this.txtProductNumber10.Text.Trim() != "" && this.txtProductPrice10.Text.Trim() != "")
                {
                    try
                    {
                        this.setPartnerBillDetailOther(BillId, this.txtOrder10.Text, this.txtProductName10.Text, this.txtProductNumber10.Text, this.txtProductPrice10.Text);
                    }
                    catch
                    {

                    }
                }

                #endregion

                if (PaymentByCard)
                {
                    SqlConnection sqlCon1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
                    sqlCon1.Open();
                    SqlCommand Cmd1 = sqlCon1.CreateCommand();
                    string sqlQuery1 = "";
                    sqlQuery1 = "IF NOT EXISTS (SELECT * FROM tblCustomersPaymentByCard WHERE BillId = @BillId AND TotalMoney = @TotalMoney AND datepart(day,DayCreate) = datepart(day,getdate()) AND datepart(month,DayCreate) = datepart(month,getdate()) AND datepart(year,DayCreate) = datepart(year,getdate()) AND datepart(hour,DayCreate) = datepart(hour,getdate()) AND datepart(minute,DayCreate) = datepart(minute,getdate()) )";
                    sqlQuery1 += "BEGIN INSERT INTO tblCustomersPaymentByCard(BillId,TotalMoney,DayCreate,CustomerAccount) VALUES(@BillId,@TotalMoney,getdate(),@CustomerAccount) END";
                    Cmd1.CommandText = sqlQuery1;
                    Cmd1.Parameters.Add("BillId", SqlDbType.NVarChar).Value = BillId;
                    Cmd1.Parameters.Add("TotalMoney", SqlDbType.Float).Value = this.txtTotalMoneyPayment.Text.ToString().Trim();
                    Cmd1.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = this.txtAccount.Value.Trim();
                    Cmd1.ExecuteNonQuery();
                    sqlCon1.Close();
                    sqlCon1.Dispose();
                }

            }
            this.strCurrBillId = BillId;
            this.lblMsg1.Text = "Thanh toán thành công đơn hàng!";
            this.btnSave.Enabled = false;
            this.btnSaveByCard.Enabled = false;
            this.getPartnerBillById(this.strCurrBillId);
            this.getProduct(Session["ACCOUNT"].ToString());
        }
        catch
        {

        }
    }
    #endregion

    #region method setPartnerBillDetail
    public void setPartnerBillDetail(string BillId, string ProductId, string ProductName, string ProductPrice, string ProductNumber)
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
            Cmd.ExecuteNonQuery();
        }
        catch
        {

        }
    }
    #endregion

    #region method setPartnerBillDetailOther
    public void setPartnerBillDetailOther(string BillId, string ProductId, string ProductName, string ProductPrice, string ProductNumber)
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
            Cmd.ExecuteNonQuery();
        }
        catch
        {

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

    #region method getPartnerInforByAccount
    public void getPartnerInforByAccount(string Account)
    {
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT * FROM tblPartner WHERE Account = @Account";
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                this.strDiscount = Rd["Discount"].ToString();
                this.strDiscountCard = Rd["DiscountCard"].ToString();
                this.strDiscountAdv = Rd["DiscountAdv"].ToString();
            }
            Rd.Close();
            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {

        }
    }
    #endregion

    #region method getCustomer
    public void getCustomer()
    {
        this.lblMsg1.Text = "-:-";
        if (this.txtAccount.Value.Trim() == "")
        {
            this.lblMsg1.Text = "Nhập số thẻ khách hàng";
        }
        bool AccountValid = false;
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblCustomers WHERE Account = @Account";
        Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = this.txtAccount.Value.ToString();
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            this.strCusAccount = this.txtAccount.Value.ToString().ToUpper();
            this.strCusName = Rd["Name"].ToString();
            this.strCusAddress = Rd["Address"].ToString();
            this.strCusPhone = Rd["Phone"].ToString();
            this.strIdCard = Rd["IdCard"].ToString();
            this.strCusEmail = Rd["Email"].ToString();

            this.lblName.Text = "<a href=\"#\" rel=\"balloon1\">" + Rd["Name"].ToString() + "&nbsp;&nbsp;|&nbsp;&nbsp;" + this.strCusAccount + "</a>";
            if (Rd["AccountType"].ToString() == "CustomerAccount")
            {
                this.ckbD.Checked = true;
                this.ckbB.Checked = false;
                this.ckbV.Checked = false;

                this.ckbD1.Checked = true;
                this.ckbB1.Checked = false;
                this.ckbV1.Checked = false;

                //this.btnSaveByCard.Visible = false;
            }
            else if (Rd["AccountType"].ToString() == "CustomerAccount1")
            {
                this.ckbD.Checked = false;
                this.ckbB.Checked = true;
                this.ckbV.Checked = false;

                this.ckbD1.Checked = false;
                this.ckbB1.Checked = true;
                this.ckbV1.Checked = false;
                //this.btnSaveByCard.Enabled = false;
            }
            else if (Rd["AccountType"].ToString() == "CustomerAccount2")
            {
                this.ckbD.Checked = false;
                this.ckbB.Checked = false;
                this.ckbV.Checked = true;

                this.ckbD1.Checked = false;
                this.ckbB1.Checked = false;
                this.ckbV1.Checked = true;
                //this.btnSaveByCard.Enabled = false;
            }
            this.lblCusAvatar.Text = "<img width = \"85px\" height = \"113px\" src = \"/Images/Customer/" + Rd["Avatar"].ToString() + "\">";
            AccountValid = true;
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
        if (AccountValid)
        {
            this.getPartnerInforByAccount(Session["ACCOUNT"].ToString());
            this.getProduct(Session["ACCOUNT"].ToString());
            this.strCustomerTotalDiscountCard = String.Format("{0:0,0}", this.getCustomerTotalDiscountCard(this.txtAccount.Value.ToString().Trim()));
            if (this.strCustomerTotalDiscountCard.Trim() == "00")
            {
                this.strCustomerTotalDiscountCard = "0";
            }
            this.txtAccount.Disabled = true;
            this.btnViewCustomer.Enabled = false;
            //this.btnCaculatorMoney.Enabled = true;
            this.txtTotalMoney.Disabled = false;
            this.txtTotalMoneyDiscount.ReadOnly = false;
        }
        else
        {
            this.lblMsg1.Text = "Số thẻ khách hàng không hợp lệ!";
        }
    }
    #endregion

    #region method getPartnerBillById
    public void getPartnerBillById(string billId)
    {
        if (billId == "")
        {
            billId = "0";
        }
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
        if (objTable.Rows.Count > 0)
        {
            this.txtTotalMoney.Value = String.Format("{0:0,0}", double.Parse(objTable.Rows[0]["TotalMoney"].ToString()));
            this.txtTotalMoneyDiscount.Text = String.Format("{0:0,0}", double.Parse(objTable.Rows[0]["TotalMoneyDiscount"].ToString()));
            this.txtTotalMoneyPayment.Text = String.Format("{0:0,0}", double.Parse(objTable.Rows[0]["TotalPeyment"].ToString()));
        }
    }
    #endregion

    #region method getProduct
    public void getProduct(string Account)
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT 0 AS TT, *, REPLACE(REPLACE(CAST(BestSale AS nvarchar),'1',N'Bán chạy'),'0','') AS BESTSALE1, REPLACE(REPLACE(CAST(VIP AS nvarchar),'1',N'VIP'),'0','') AS VIP1 FROM tblProduct WHERE PartnerId = (SELECT PartnerId FROM tblPartner WHERE Account = @Account)";
        Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Account;
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

        this.objTableProduct = ds.Tables[0];
        if (this.objTableProduct.Rows.Count > 0)
        {
            strHtml = "<form>";
            for (int i = 0; i < this.objTableProduct.Rows.Count; i++)
            {
                if (i == 0)
                {
                    strHtml += "<div style =\"width:100%; margin-top:1px;\">";

                    strHtml += "<div class = \"tvsInput\" style=\"width: 8%; float: left; border:solid 1px #f3f1f1; border-right:none; text-align:center;height:30px;line-height:30px; border-top: none; \">";
                    strHtml += this.objTableProduct.Rows[i]["TT"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div class = \"tvsInput\" style=\"width: 74%; float: left; border:solid 1px #f3f1f1;padding-left:6px; overflow:hidden; height:30px;line-height:30px; border-top: none; \">";
                    strHtml += this.objTableProduct.Rows[i]["Name"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 8%; float: left; border:solid 1px #f3f1f1;overflow:hidden; height:30px;line-height:30px; text-align:right; border-top: none; \">";
                    strHtml += "<input class = \"tvsInput\" onkeyup=\"calTotalMoney()\" type =\"text\" id = \"txtNumber" + i.ToString() + "\" name = \"txt#" + this.objTableProduct.Rows[i]["Id"].ToString() + "#" + this.objTableProduct.Rows[i]["Price"].ToString() + "\" value =\"" + this.getPartnerBillDetail(this.strCurrBillId, this.objTableProduct.Rows[i]["Id"].ToString()) + "\" style =\"color:#000; text-align:right; padding-right:5px; height:26px;\"/>";
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 10%; float: right; border:solid 1px #f3f1f1; overflow:hidden; height:30px;line-height:30px; text-align:right; border-top: none; \">";
                    strHtml += "<input class = \"tvsInput\" type =\"text\" id = \"txtPrice" + i.ToString() + "\" value = \"" + String.Format("{0:0,0}", double.Parse(this.objTableProduct.Rows[i]["Price"].ToString())) + "\" style = \"text-align:right; padding-right:5px; height:26px;\" readonly = \"readonly\">";
                    strHtml += "</div>";

                    strHtml += "</div>";
                }
                else
                {
                    strHtml += "<div style =\"width:100%; margin-top:1px;\">";

                    strHtml += "<div style=\"width: 8%; float: left; border:solid 1px #f3f1f1; border-right:none; border-top:none;text-align:center;height:30px;line-height:30px;\">";
                    strHtml += this.objTableProduct.Rows[i]["TT"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 74%; float: left; border:solid 1px #f3f1f1;padding-left:6px; overflow:hidden; height:30px;line-height:30px;border-top: none;\">";
                    strHtml += this.objTableProduct.Rows[i]["Name"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 8%; float: left; border:solid 1px #f3f1f1;overflow:hidden; height:30px;line-height:30px; text-align:right; border-top: none; \">";
                    strHtml += "<input class = \"tvsInput\" onkeyup=\"calTotalMoney()\" type =\"text\" id = \"txtNumber" + i.ToString() + "\" name = \"txt#" + this.objTableProduct.Rows[i]["Id"].ToString() + "#" + this.objTableProduct.Rows[i]["Price"].ToString() + "\" value =\"" + this.getPartnerBillDetail(this.strCurrBillId, this.objTableProduct.Rows[i]["Id"].ToString()) + "\" style =\"color:#000; text-align:right; padding-right:5px; height:26px;\"/>";
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 10%; float: right; border:solid 1px #f3f1f1;overflow:hidden; height:30px;line-height:30px; text-align:right;border-top: none;\">";
                    strHtml += "<input class = \"tvsInput\" type =\"text\" id = \"txtPrice" + i.ToString() + "\" value = \"" + String.Format("{0:0,0}", double.Parse(this.objTableProduct.Rows[i]["Price"].ToString())) + "\" style = \"text-align:right; padding-right:5px; height:26px;\" readonly = \"readonly\">";
                    strHtml += "</div>";

                    strHtml += "</div>";
                }
            }
            strHtml += "</form>";

            this.txtTotalItem.Value = this.objTableProduct.Rows.Count.ToString();
        }
    }
    #endregion

    #region method btnViewCustomer_Click
    protected void btnViewCustomer_Click(object sender, EventArgs e)
    {
        this.getCustomer();
    }
    #endregion

    #region method btnCaculatorMoney_Click
    protected void btnCaculatorMoney_Click(object sender, EventArgs e)
    {
        this.getPartnerInforByAccount(Session["ACCOUNT"].ToString());
        this.lblMsg1.Text = "";
        if (this.txtTotalMoney.Value.ToString().Trim() == "")
        {
            this.lblMsg1.Text = "Chưa xác định tổng tiền đơn hàng";
            return;
        }
        if (this.txtTotalMoneyDiscount.Text == "")
        {
            this.lblMsg1.Text = "Chưa xác định tổng tiền được hưởng giảm giá của đơn hàng";
            return;
        }
        if (this.strDiscount == "")
        {
            this.lblMsg1.Text = "Chưa xác định mức giảm giá của cửa hàng";
            return;
        }
        try
        {
            if (double.Parse(this.txtTotalMoneyDiscount.Text) > double.Parse(this.txtTotalMoney.Value.ToString().Trim()))
            {
                this.lblMsg1.Text = "Tổng tiền chiết khấu lớn hơn tổng tiền hoá đơn";
                return;
            }

            double tmpTodalMoneyDiscount = 0;
            tmpTodalMoneyDiscount = double.Parse(this.txtTotalMoneyDiscount.Text) * double.Parse(this.strDiscount) / 100;
            this.txtTotalMoneyPayment.Text = (double.Parse(this.txtTotalMoney.Value.ToString().Trim()) - tmpTodalMoneyDiscount).ToString();
            this.btnSave.Enabled = true;

        }
        catch
        {

        }

        if (this.strDiscountCard.Trim() != "")
        {
            try
            {
                this.strCustomerTotalDiscountCard = String.Format("{0:0,0}", this.getCustomerTotalDiscountCard(this.txtAccount.Value.ToString().Trim()));
                if (this.strCustomerTotalDiscountCard.Trim() == "00")
                {
                    this.strCustomerTotalDiscountCard = "0";
                }
                if (double.Parse(this.strCustomerTotalDiscountCard) >= double.Parse(this.txtTotalMoneyPayment.Text))
                {
                    this.btnSaveByCard.Enabled = true;
                }
            }
            catch
            {
                this.btnSaveByCard.Enabled = false;
            }
        }
        this.getProduct(Session["ACCOUNT"].ToString());
    }
    #endregion

    #region method btnSaveBill_Click
    protected void btnSaveBill_Click(object sender, EventArgs e)
    {
        this.setPartnerBill(false);
    }
    #endregion

    #region method getPartner
    public void getPartner()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblPartner WHERE Account = @Account";
        Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            this.strName = Rd["Name"].ToString();
            this.strAddress = Rd["Address"].ToString();
            this.strManager = Rd["Manager"].ToString();
            this.strPhone = Rd["Phone"].ToString();
            this.strEmail = Rd["Email"].ToString();
            this.strTaxcode = Rd["TaxCode"].ToString();
            this.strAccount = Rd["Account"].ToString();

            this.strDiscount = Rd["Discount"].ToString();
            this.strDiscountCard = Rd["DiscountCard"].ToString();
            this.strDiscountAdv = Rd["DiscountAdv"].ToString();

            if (Rd["BestSale"].ToString() == "True")
            {
                this.strBestSale = "X";
            }
            else
            {
                this.strBestSale = "";
            }
            if (Rd["VIP"].ToString() == "True")
            {
                this.strVIP = "X";
            }
            else
            {
                this.strVIP = "";
            }
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
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

    #region method btnSaveByCard_Click
    protected void btnSaveByCard_Click(object sender, EventArgs e)
    {
        this.setPartnerBill(true);
    }
    #endregion

    #region method btnAdd_Click
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        this.lblMsg1.Text = "-:-";
        this.btnViewCustomer.Enabled = true;
        this.txtAccount.Disabled = false;
        this.lblName.Text = "-:-";
        this.txtAccount.Value = "";
        this.txtTotalMoney.Value = "";
        this.txtTotalMoneyDiscount.Text = "";
        this.strDiscount = "";
        this.strDiscountCard = "";
        this.strDiscountAdv = "";

        this.ckbD.Checked = false;
        this.ckbD1.Checked = false;
        this.ckbB.Checked = false;
        this.ckbB1.Checked = false;
        this.ckbV.Checked = false;
        this.ckbV1.Checked = false;

        this.txtTotalMoneyPayment.Text = "";

        #region Thong tin cho hang hoa thong thuong

        this.txtProductName1.Text = "";
        this.txtProductName2.Text = "";
        this.txtProductName3.Text = "";
        this.txtProductName4.Text = "";
        this.txtProductName5.Text = "";
        this.txtProductName6.Text = "";
        this.txtProductName7.Text = "";
        this.txtProductName8.Text = "";
        this.txtProductName9.Text = "";
        this.txtProductName10.Text = "";

        this.txtProductPrice1.Text = "";
        this.txtProductPrice2.Text = "";
        this.txtProductPrice3.Text = "";
        this.txtProductPrice4.Text = "";
        this.txtProductPrice5.Text = "";
        this.txtProductPrice6.Text = "";
        this.txtProductPrice7.Text = "";
        this.txtProductPrice8.Text = "";
        this.txtProductPrice9.Text = "";
        this.txtProductPrice10.Text = "";

        #endregion

        this.btnSave.Enabled = false;
        this.btnSaveByCard.Enabled = false;
        this.getPartnerInforByAccount(Session["ACCOUNT"].ToString());
        this.getProduct(Session["ACCOUNT"].ToString());
    }
    #endregion

    #region method getPartnerBillDetail
    public string getPartnerBillDetail(string BillId, string ProductId)
    {
        string tmpValue = "";
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            Cmd.CommandText = "SELECT ISNULL(ProductNumber,0) AS ProductNumber FROM tblPartnerBillDetail WHERE BillId = @BillId AND ProductId = @ProductId";
            Cmd.Parameters.Add("BillId", SqlDbType.NVarChar).Value = BillId;
            Cmd.Parameters.Add("ProductId", SqlDbType.Int).Value = ProductId;
            SqlDataReader Rd = Cmd.ExecuteReader();
            while (Rd.Read())
            {
                tmpValue = Rd["ProductNumber"].ToString();
            }
            Rd.Close();
            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {
        }
        if (tmpValue == "0")
        {
            tmpValue = "";
        }
        return tmpValue;
    }
    #endregion
}