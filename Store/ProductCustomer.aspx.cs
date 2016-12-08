using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_ProductCustomer : System.Web.UI.Page
{
    #region declare objects
    public DataTable objTableProduct = new DataTable();
    private Partner objPartner = new Partner();
    private Customers objCustomers = new Customers();
    private Product objProduct = new Product();

    public string strHtml = "", strValue = "", strCurrBillId = "", strhtmlbill = "";
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

    #region method setPartnerBill
    public void setPartnerBill(bool PaymentByCard)
    {
        this.lblMsg1.Text = "";

        #region Test input
        if (this.txtAccount.Value.ToString() == "")
        {
            this.lblMsg1.Text = "Chưa xác định thông tin khách hàng";
            return;
        }
        string CustomerAccount = txtAccount.Value.ToString();

        string PartnerAccount  = Session["ACCOUNT"].ToString();
        this.getPartnerInforByAccount(PartnerAccount);


        if (this.txtTotalMoney.Value.ToString().Trim() == "")
        {
            this.lblMsg1.Text = "Chưa xác định tổng tiền đơn hàng";
            return;
        }
        float TotalMoney = 0;
        try
        {
            TotalMoney = float.Parse(this.txtTotalMoney.Value.ToString().Trim());
        }
        catch{
            this.lblMsg1.Text = "Tổng tiền đơn hàng sai định dạng";
            return;
        }
        
        if (this.txtTotalMoneyDiscount.Text == "")
        {
            this.lblMsg1.Text = "Chưa xác định tổng tiền được hưởng giảm giá của đơn hàng";
            return;
        }
        float TotalMoneyDiscount = 0;
        try{
            TotalMoneyDiscount = float.Parse(this.txtTotalMoneyDiscount.Text.Trim());
        } catch{ 
            this.lblMsg1.Text = "Tổng tiền được hưởng giảm giá sai định dạng";
            return;
        }

        if (this.strDiscount == "")
        {
            this.lblMsg1.Text = "Chưa xác định mức giảm giá trực tiếp cho khách hàng";
            return;
        }
            
        float Discount = 0;
        try{
            Discount = float.Parse(this.strDiscount);
        }catch
        {
            this.lblMsg1.Text = "Mức giảm giá trực tiếp cho khách hàng sai định dạng";
            return;
        }

        if (this.strDiscountCard == "")
        {
            this.lblMsg1.Text = "Chưa xác định mức giảm giá tích luỹ thẻ cho khách hàng";
            return;
        }
        float DiscountCard = 0;
        try{
            DiscountCard = float.Parse(this.strDiscountCard);
        }catch
        {
            this.lblMsg1.Text = "Mức giảm giá cho tích luỹ thẻ sai định dạng";
            return;
        }


        if (this.strDiscountAdv == "")
        {
            this.lblMsg1.Text = "Chưa xác định mức giảm giá cho quảng cáo";
            return;
        }
        float DiscountAdv = 0;
        try{
            DiscountAdv = float.Parse(this.strDiscountAdv);
        }catch
        {
            this.lblMsg1.Text = "Mức giảm giá cho quảng cáo sai định dạng";
            return;
        }

        if (this.txtTotalMoneyPayment.Text == "")
        {
            this.lblMsg1.Text = "Chưa xác định số tiền cần thanh toán";
            return;
        }
        float TotalPeyment = 0;
        try{
            TotalPeyment = float.Parse(this.txtTotalMoneyPayment.Text.Trim());
        }catch
        {
            this.lblMsg1.Text = "Số tiền cần thanh toán sai định dạng";
            return;
        }
        #endregion

        string BillId ="";
        int ret = objPartner.setPartnerBill(CustomerAccount, PartnerAccount,TotalMoney,TotalMoneyDiscount,Discount,DiscountCard,DiscountAdv,TotalPeyment);
        if(ret != 0)
        {
            BillId = ret.ToString();

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
                                    objPartner.setPartnerBillDetail(BillId, arr[1], "", arr[2], v);
                                }
                            }
                        }
                }
            }
            catch {}
            #endregion
            
            #region Luu chi tiet hoa don phu
                if (this.txtProductName1.Text.Trim() != "" && this.txtProductNumber1.Text.Trim() != "" && this.txtProductPrice1.Text.Trim() != "")
                {
                    try
                    {
                        objPartner.setPartnerBillDetailOther(BillId, this.txtOrder1.Text, this.txtProductName1.Text, this.txtProductNumber1.Text, this.txtProductPrice1.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName2.Text.Trim() != "" && this.txtProductNumber2.Text.Trim() != "" && this.txtProductPrice2.Text.Trim() != "")
                {
                    try
                    {
                        objPartner.setPartnerBillDetailOther(BillId, this.txtOrder2.Text, this.txtProductName2.Text, this.txtProductNumber2.Text, this.txtProductPrice2.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName3.Text.Trim() != "" && this.txtProductNumber3.Text.Trim() != "" && this.txtProductPrice3.Text.Trim() != "")
                {
                    try
                    {
                        objPartner.setPartnerBillDetailOther(BillId, this.txtOrder3.Text, this.txtProductName3.Text, this.txtProductNumber3.Text, this.txtProductPrice3.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName4.Text.Trim() != "" && this.txtProductNumber4.Text.Trim() != "" && this.txtProductPrice4.Text.Trim() != "")
                {
                    try
                    {
                        objPartner.setPartnerBillDetailOther(BillId, this.txtOrder4.Text, this.txtProductName4.Text, this.txtProductNumber4.Text, this.txtProductPrice4.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName5.Text.Trim() != "" && this.txtProductNumber5.Text.Trim() != "" && this.txtProductPrice5.Text.Trim() != "")
                {
                    try
                    {
                        objPartner.setPartnerBillDetailOther(BillId, this.txtOrder5.Text, this.txtProductName5.Text, this.txtProductNumber5.Text, this.txtProductPrice5.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName6.Text.Trim() != "" && this.txtProductNumber6.Text.Trim() != "" && this.txtProductPrice6.Text.Trim() != "")
                {
                    try
                    {
                        objPartner.setPartnerBillDetailOther(BillId, this.txtOrder6.Text, this.txtProductName6.Text, this.txtProductNumber6.Text, this.txtProductPrice6.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName7.Text.Trim() != "" && this.txtProductNumber7.Text.Trim() != "" && this.txtProductPrice7.Text.Trim() != "")
                {
                    try
                    {
                        objPartner.setPartnerBillDetailOther(BillId, this.txtOrder7.Text, this.txtProductName7.Text, this.txtProductNumber7.Text, this.txtProductPrice7.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName8.Text.Trim() != "" && this.txtProductNumber8.Text.Trim() != "" && this.txtProductPrice8.Text.Trim() != "")
                {
                    try
                    {
                        objPartner.setPartnerBillDetailOther(BillId, this.txtOrder8.Text, this.txtProductName8.Text, this.txtProductNumber8.Text, this.txtProductPrice8.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName9.Text.Trim() != "" && this.txtProductNumber9.Text.Trim() != "" && this.txtProductPrice9.Text.Trim() != "")
                {
                    try
                    {
                        objPartner.setPartnerBillDetailOther(BillId, this.txtOrder9.Text, this.txtProductName9.Text, this.txtProductNumber9.Text, this.txtProductPrice9.Text);
                    }
                    catch
                    {

                    }
                }

                if (this.txtProductName10.Text.Trim() != "" && this.txtProductNumber10.Text.Trim() != "" && this.txtProductPrice10.Text.Trim() != "")
                {
                    try
                    {
                        objPartner.setPartnerBillDetailOther(BillId, this.txtOrder10.Text, this.txtProductName10.Text, this.txtProductNumber10.Text, this.txtProductPrice10.Text);
                    }
                    catch
                    {

                    }
                }

                #endregion

            if (PaymentByCard)
                {
                    ret = objPartner.setCustomersPaymentByCard(BillId,TotalMoney,CustomerAccount);
                    /*
                    if(ret == 0) 
                    {
                        // Code xử lý khi lưu csdl CustomersPaymentByCard thất bại
                    } // */
                }

            this.strCurrBillId = BillId;
            this.lblMsg1.Text = "Thanh toán thành công đơn hàng!";
            this.btnSave.Enabled = false;
            this.btnSaveByCard.Enabled = false;
            this.getPartnerBillById(this.strCurrBillId);
            this.getProduct(Session["ACCOUNT"].ToString());
            this.btnCalTotalMoney.Disabled = true;

            this.PrintBill(BillId);

        } else {
            this.lblMsg1.Text = "Có lỗi với csdl. Xin thử lại!";
        }
               
    }
    #endregion

    #region method PrintBill
    protected void PrintBill(string BillId)
    {
        try
        {
            this.getPartner();
            this.getCustomerInfo();
            this.btnPrint.Disabled = false;

            this.tongtienhang.InnerText = this.txtTotalMoney.Value.ToString().Trim();
            this.tonggiamgia.InnerText = this.txtTotalMoneyDiscount.Text;
            this.tienphaitra.InnerText = this.txtTotalMoneyPayment.Text;

            DataTable data = objPartner.getPartnerBillDetail(BillId);

            string str = "";
            int stt = 0;

            for (int i = 0; i < data.Rows.Count; i++)
            {
                str += "<tr>";
                str += "<td>" + (++stt).ToString() + "</td>";
                str += "<td>" + data.Rows[i]["ProductName"] + "</td>";

                double intnum = double.Parse(data.Rows[i]["ProductNumber"].ToString());
                double intPrice = double.Parse(data.Rows[i]["ProductPrice"].ToString());

                str += "<td>" + intnum.ToString() +"</td>";
                str += "<td>" + intPrice.ToString() +"</td>";
                str += "<td>" + (intnum * intPrice).ToString() + "</td>";
                str += "</tr>";
            }

            strhtmlbill = str;
        }
        catch
        {

        }
    }
    #endregion

    #region method getPartnerInforByAccount
    public void getPartnerInforByAccount(string Account)
    {

        DataTable ret = objPartner.getPartnerInforByAccount(Account);

        if (ret.Rows.Count > 0)
        {
            this.strDiscount = ret.Rows[0]["Discount"].ToString();
            this.strDiscountCard = ret.Rows[0]["DiscountCard"].ToString();
            this.strDiscountAdv = ret.Rows[0]["DiscountAdv"].ToString();
        }

    }
    #endregion

    #region method getCustomerInfo
    public void getCustomerInfo()
    {
        this.lblMsg1.Text = "-:-";
        if (this.txtAccount.Value.Trim() == "")
        {
            this.lblMsg1.Text = "Nhập số thẻ khách hàng";
        }
        bool AccountValid = false;

        DataTable objCusomerInfo = new DataTable();
        objCusomerInfo = this.objCustomers.getCustomer(this.txtAccount.Value.ToString());

        if (objCusomerInfo.Rows.Count > 0)
        {

            this.strCusAccount = this.txtAccount.Value.ToString().ToUpper();
            this.strCusName = objCusomerInfo.Rows[0]["Name"].ToString();
            this.strCusAddress = objCusomerInfo.Rows[0]["Address"].ToString();
            this.strCusPhone = objCusomerInfo.Rows[0]["Phone"].ToString();
            this.strIdCard = objCusomerInfo.Rows[0]["IdCard"].ToString();
            this.strCusEmail = objCusomerInfo.Rows[0]["Email"].ToString();

            this.lblName.Text = "<a href=\"#\" rel=\"balloon1\">" + objCusomerInfo.Rows[0]["Name"].ToString() + "&nbsp;&nbsp;|&nbsp;&nbsp;" + this.strCusAccount + "</a>";
            if (objCusomerInfo.Rows[0]["AccountType"].ToString() == "CustomerAccount")
            {
                this.ckbD.Checked = true;
                this.ckbB.Checked = false;
                this.ckbV.Checked = false;

                this.ckbD1.Checked = true;
                this.ckbB1.Checked = false;
                this.ckbV1.Checked = false;

            }
            else if (objCusomerInfo.Rows[0]["AccountType"].ToString() == "CustomerAccount1")
            {
                this.ckbD.Checked = false;
                this.ckbB.Checked = true;
                this.ckbV.Checked = false;

                this.ckbD1.Checked = false;
                this.ckbB1.Checked = true;
                this.ckbV1.Checked = false;
                
            }
            else if (objCusomerInfo.Rows[0]["AccountType"].ToString() == "CustomerAccount2")
            {
                this.ckbD.Checked = false;
                this.ckbB.Checked = false;
                this.ckbV.Checked = true;

                this.ckbD1.Checked = false;
                this.ckbB1.Checked = false;
                this.ckbV1.Checked = true;
                
            }
            this.lblCusAvatar.Text = "<img width = \"85px\" height = \"113px\" src = \"/Images/Customer/" + objCusomerInfo.Rows[0]["Avatar"].ToString() + "\">";
            AccountValid = true;
        }

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
        DataTable objTable = this.objPartner.getPartnerBillById(billId);
       
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

        DataTable objTableProduct = this.objProduct.getDataByPartner(Account);

        for (int i = 0; i < objTableProduct.Rows.Count; i++)
        {
            objTableProduct.Rows[i]["TT"] = (i + 1);
        }

        if (this.objTableProduct.Rows.Count > 0)
        {
            strHtml = "<form>";
            for (int i = 0; i < this.objTableProduct.Rows.Count; i++)
            {
                if (i == 0)
                {
                    strHtml += "<div style =\"width:100%; margin-top:1px;\">";

                    strHtml += "<div style=\"width: 8%; float: left; border:solid 1px #f3f1f1; border-right:none; text-align:center;height:30px;line-height:30px;\">";
                    strHtml += this.objTableProduct.Rows[i]["TT"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 74%; float: left; border:solid 1px #f3f1f1;padding-left:6px; overflow:hidden; height:30px;line-height:30px;\" id=\"txtName" + i.ToString() + "\" >";
                    strHtml += this.objTableProduct.Rows[i]["Name"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 8%; float: left; border:solid 1px #f3f1f1;overflow:hidden; height:30px;line-height:30px; text-align:right;\">";
                    strHtml += "<input class = \"tvsInput\" onkeyup=\"calTotalMoney()\" type =\"text\" id = \"txtNumber" + i.ToString() + "\" name = \"txt#" + this.objTableProduct.Rows[i]["Id"].ToString() + "#" + this.objTableProduct.Rows[i]["Price"].ToString() + "\" value =\"" + this.getPartnerBillDetail(this.strCurrBillId, this.objTableProduct.Rows[i]["Id"].ToString()) + "\" style =\"color:#000; text-align:right; padding-right:5px;\"/>";
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 10%; float: right; border:solid 1px #f3f1f1; overflow:hidden; height:30px;line-height:30px; text-align:right;\">";
                    strHtml += "<input class = \"tvsInput\" type =\"text\" id = \"txtPrice" + i.ToString() + "\" value = \"" + String.Format("{0:0,0}", double.Parse(this.objTableProduct.Rows[i]["Price"].ToString())) + "\" style = \"text-align:right; padding-right:5px;\" readonly = \"readonly\">";
                    strHtml += "</div>";

                    strHtml += "</div>";
                }
                else
                {
                    strHtml += "<div style =\"width:100%; margin-top:1px;\">";

                    strHtml += "<div style=\"width: 8%; float: left; border:solid 1px #f3f1f1; border-right:none; border-top:none;text-align:center;height:30px;line-height:30px;\">";
                    strHtml += this.objTableProduct.Rows[i]["TT"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 74%; float: left; border:solid 1px #f3f1f1;padding-left:6px; overflow:hidden; height:30px;line-height:30px;\" id=\"txtName" + i.ToString() + "\" >";
                    strHtml += this.objTableProduct.Rows[i]["Name"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 8%; float: left; border:solid 1px #f3f1f1;overflow:hidden; height:30px;line-height:30px; text-align:right;\">";
                    strHtml += "<input class = \"tvsInput\" onkeyup=\"calTotalMoney()\" type =\"text\" id = \"txtNumber" + i.ToString() + "\" name = \"txt#" + this.objTableProduct.Rows[i]["Id"].ToString() + "#" + this.objTableProduct.Rows[i]["Price"].ToString() + "\" value =\"" + this.getPartnerBillDetail(this.strCurrBillId, this.objTableProduct.Rows[i]["Id"].ToString()) + "\" style =\"color:#000; text-align:right; padding-right:5px;\"/>";
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 10%; float: right; border:solid 1px #f3f1f1;overflow:hidden; height:30px;line-height:30px; text-align:right;\">";
                    strHtml += "<input class = \"tvsInput\" type =\"text\" id = \"txtPrice" + i.ToString() + "\" value = \"" + String.Format("{0:0,0}", double.Parse(this.objTableProduct.Rows[i]["Price"].ToString())) + "\" style = \"text-align:right; padding-right:5px;\" readonly = \"readonly\">";
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
        this.getCustomerInfo();
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
        DataTable objTable = this.objPartner.getPartnerInforByAccount(Session["ACCOUNT"].ToString());

        if (objTable.Rows.Count > 0)
        {
            this.strName = objTable.Rows[0]["Name"].ToString();
            this.strAddress = objTable.Rows[0]["Address"].ToString();
            this.strManager = objTable.Rows[0]["Manager"].ToString();
            this.strPhone = objTable.Rows[0]["Phone"].ToString();
            this.strEmail = objTable.Rows[0]["Email"].ToString();
            this.strTaxcode = objTable.Rows[0]["TaxCode"].ToString();
            this.strAccount = objTable.Rows[0]["Account"].ToString();

            this.strDiscount = objTable.Rows[0]["Discount"].ToString();
            this.strDiscountCard = objTable.Rows[0]["DiscountCard"].ToString();
            this.strDiscountAdv = objTable.Rows[0]["DiscountAdv"].ToString();

            if (objTable.Rows[0]["BestSale"].ToString() == "True")
            {
                this.strBestSale = "X";
            }
            else
            {
                this.strBestSale = "";
            }
            if (objTable.Rows[0]["VIP"].ToString() == "True")
            {
                this.strVIP = "X";
            }
            else
            {
                this.strVIP = "";
            }
        }
       
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

    #region RandomString
    private string RandomString(int size, bool lowerCase)
    {
        StringBuilder builder = new StringBuilder();
        Random random = new Random();
        char ch;
        for (int i = 0; i < size; i++)
        {
            ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
            builder.Append(ch);
        }
        if (lowerCase)
            return builder.ToString().ToLower();
        return builder.ToString();
    }
    #endregion

    #region method btnSaveByCard_Click
    protected void btnSaveByCard_Click(object sender, EventArgs e)
    {
        if (Session["ACCOUNT"] == null)
        {
            Response.Redirect("/");
        }


        //this.lblMsg1.Text = this.txtOTPCode.Value.Length.ToString();
        if (this.txtOTPCode.Value.Length == 0)
        {
            // Create OTP SMS
            string strOTP = this.RandomString(10, false);
            // /*
            // insert sql
            int rowsAffected = 0;
            try
            {
                SqlConnection sqlCon1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
                sqlCon1.Open();
                SqlCommand Cmd1 = sqlCon1.CreateCommand();
                string sqlQuery1 = "";
                sqlQuery1 = "INSERT INTO tblCustomers_SMS_OTP (CustomerAccount,PartnerAccount,DayCreate,KeyOTP) VALUES(@CustomerAccount,@PartnerAccount,getdate(),@KeyOTP)";
                Cmd1.CommandText = sqlQuery1;
                Cmd1.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = txtAccount.Value.ToString();
                Cmd1.Parameters.Add("PartnerAccount", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
                Cmd1.Parameters.Add("KeyOTP", SqlDbType.NVarChar).Value = strOTP;
                rowsAffected = Cmd1.ExecuteNonQuery();
                sqlCon1.Close();
                sqlCon1.Dispose();
            }
            catch //(Exception ex)
            {
                //this.lblMsg1.Text = ex.Message;
            }


            if (rowsAffected == 1)
            {
                //string ret = this.SendSMS(this.strCusPhone,"SMC gửi mã kích hoạt OTP: " + strOTP);
                //string ret = this.SendSMS("01667762419", strOTP);

                this.btnSave.Enabled = false;
                this.btnSaveByCard.Enabled = true;
                this.txtOTPCode.Disabled = false;

                this.lblMsg1.Text = "Mã OTP đã được gửi";
                //this.lblMsg1.Text = ret;
            }
            else
            {
                this.btnSave.Enabled = true;
                this.btnSaveByCard.Enabled = true;
                this.txtOTPCode.Disabled = true;

                this.lblMsg1.Text = "Có lỗi xảy ra, xin thử lại";
            }

            // */


            this.getProduct(Session["ACCOUNT"].ToString());


        }
        else
        {
            Boolean otpok = false;
            try
            {
                SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
                sqlCon.Open();
                SqlCommand Cmd = sqlCon.CreateCommand();
                Cmd.CommandText = "SELECT * FROM tblCustomers_SMS_OTP WHERE KeyOTP = @KeyOTP and CustomerAccount = @CustomerAccount and PartnerAccount = @PartnerAccount and (getdate() - [DayCreate]) < @TimeOut";
                Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = txtAccount.Value.ToString();
                Cmd.Parameters.Add("PartnerAccount", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
                Cmd.Parameters.Add("KeyOTP", SqlDbType.NVarChar).Value = this.txtOTPCode.Value.ToString();
                Cmd.Parameters.Add("TimeOut", SqlDbType.DateTime).Value = "00:05:00.000"; // Thời gian mà mã OTP còn hiệu lực
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = Cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                sqlCon.Close();
                sqlCon.Dispose();

                if (ds.Tables[0].Rows.Count > 0)
                {
                    otpok = true;

                    //ds.Tables[0].Rows.Count[i]["TT"]
                }

            }
            catch
            {
                
            }

            if(otpok)
            {
                this.btnSave.Enabled = true;
                this.btnSaveByCard.Enabled = true;
                this.txtOTPCode.Disabled = true;


                this.setPartnerBill(true);
            } else
            {
                this.getProduct(Session["ACCOUNT"].ToString());

                this.btnSave.Enabled = false;
                this.btnSaveByCard.Enabled = true;
                this.txtOTPCode.Disabled = false;

                this.lblMsg1.Text = "Mã OTP không hợp lệ";
                //this.lblMsg1.Text = this.txtOTPCode.Value;
            }

        }
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

    #region Code for SMS Send

    const string APIKey = "9A777702907155A61B1FD0BE8CB9B4";//Dang ky tai khoan tai esms.vn de lay key//Register account at esms.vn to get key
    const string SecretKey = "FCCD9B6DDC659F184D335743AB9A8F";

    #region method SendSMS
    public string SendSMS(string phone, string message)
    {

        string url = "http://api.esms.vn/MainService.svc/xml/SendMultipleMessage_V2/";
        // declare ascii encoding
        UTF8Encoding encoding = new UTF8Encoding();

        string strResult = string.Empty;



        string customers = "";

        string[] lstPhone = phone.Split(',');

        for (int i = 0; i < lstPhone.Count(); i++)
        {
            customers = customers + @"<CUSTOMER>"
                            + "<PHONE>" + lstPhone[i] + "</PHONE>"
                            + "</CUSTOMER>";
        }


        string SampleXml = @"<RQST>"
                           + "<APIKEY>" + APIKey + "</APIKEY>"
                           + "<SECRETKEY>" + SecretKey + "</SECRETKEY>"
                           + "<ISFLASH>0</ISFLASH>"
                           + "<SMSTYPE>7</SMSTYPE>"//SMSTYPE 3: đầu số ngẫu nhiên tốc độ chậm, SMSTYPE=7: đầu số ngẫu nhiên tốc độ cao, SMSTYPE=4: Đầu số 19001534; SMSTYpe=6: đàu số 8755                               
                           + "<CONTENT>" + message + "</CONTENT>"
                           + "<CONTACTS>" + customers + "</CONTACTS>"


       + "</RQST>";
        //Tham khao them ve SMSTYPE tai day: http://esms.vn/SMSApi/ApiSendSMSNormal


        string postData = SampleXml.Trim().ToString();
        // convert xmlstring to byte using ascii encoding
        byte[] data = encoding.GetBytes(postData);
        // declare httpwebrequet wrt url defined above
        HttpWebRequest webrequest = (HttpWebRequest)WebRequest.Create(url);
        // set method as post
        webrequest.Method = "POST";
        webrequest.Timeout = 500000;
        // set content type
        webrequest.ContentType = "application/x-www-form-urlencoded";
        // set content length
        webrequest.ContentLength = data.Length;
        // get stream data out of webrequest object
        Stream newStream = webrequest.GetRequestStream();
        newStream.Write(data, 0, data.Length);
        newStream.Close();
        // declare & read response from service
        HttpWebResponse webresponse = (HttpWebResponse)webrequest.GetResponse();

        // set utf8 encoding
        Encoding enc = System.Text.Encoding.GetEncoding("utf-8");
        // read response stream from response object
        StreamReader loResponseStream =
            new StreamReader(webresponse.GetResponseStream(), enc);
        // read string from stream data
        strResult = loResponseStream.ReadToEnd();
        // close the stream object
        loResponseStream.Close();
        // close the response object
        webresponse.Close();
        // below steps remove unwanted data from response string
        strResult = strResult.Replace("</string>", "");

        return strResult;
    }

    #endregion

    #endregion
}