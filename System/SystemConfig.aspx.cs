using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SystemConfig : System.Web.UI.Page
{
    #region declare objects
    private int itemId = 0;
    private SystemConfigs sc = new SystemConfigs();
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
            this.itemId = 1 ;       // 1 is default
        }
        if (!Page.IsPostBack)
        {
           getCustomer(itemId);
        }
    }
    #endregion

    #region checkInput()
    public void checkInput()
    {

        try
        {
            this.lblMsg.Text = "";
            if (this.txtPartnerAccount.Text.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập ký hiệu thẻ đối tác";
                return;
            }
            if (this.txtCustomerAccount.Text.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập ký hiệu thẻ khách hàng hạng đồng";
                return;
            }
            if (this.txtCustomerAccount1.Text.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập ký hiệu thẻ khách hàng hạng bạc";
                return;
            }
            if (this.txtCustomerAccount2.Text.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập ký hiệu thẻ khách hàng hạng vàng";
                return;
            }
            if (this.txtMemberAccount.Text.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập ký hiệu thẻ thành viên";
                return;
            }
            if (this.txtPartnerDiscount.Text.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập mức giảm giá của đối tác";
                return;
            }
            if (this.txtCustomerDiscount.Text.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập mức giảm giá thành viên";
                return;
            }
        }
        catch
        {
            throw new Exception("Có lổi khi nhập dử liệu . ERROR : 123");
        }
    }

    #endregion


    #region method setCustomer
    public void setCustomer()
    {
            checkInput();
      
         //  int Id    = 1;
           string PartnerAccount = this.txtPartnerAccount.Text;
           string CustomerAccount= this.txtCustomerAccount.Text;
           string CustomerAccount1 = this.txtCustomerAccount1.Text;
           string CustomerAccount2 = this.txtCustomerAccount2.Text;
           string MemberAccount  = this.txtMemberAccount.Text;

           float PartnerDiscount  = float.Parse(this.txtPartnerDiscount.Text);      // Sai  số Khi chuyển đổi dử liệu 
           float  CustomerDiscount =float.Parse(this.txtCustomerDiscount.Text);     // Sai số 


           if (sc.saveConfig(PartnerAccount, CustomerAccount, CustomerAccount1, CustomerAccount2, MemberAccount, PartnerDiscount, CustomerDiscount) > 0)
           {
               this.lblMsg.Text = "Lưu dữ thiệu thành công !";
           }
        else
           {
               this.lblMsg.Text = "Lưu dữ thiệu thất bại !";

           }

        
    }
    #endregion

    #region method getCustomer Text, set textBox PlaceHolder
    public void getCustomer(int Id)
    {
       DataTable dt = new DataTable();
        try{
                 dt = sc.getCustomer(Id);
            this.txtPartnerAccount.Text = dt.Rows[0]["PartnerAccount"].ToString();
            this.txtCustomerAccount.Text =  dt.Rows[0]["CustomerAccount"].ToString();
            this.txtCustomerAccount1.Text =  dt.Rows[0]["CustomerAccount1"].ToString();
            this.txtCustomerAccount2.Text =  dt.Rows[0]["CustomerAccount2"].ToString();
            this.txtMemberAccount.Text =  dt.Rows[0]["MemberAccount"].ToString();
            this.txtPartnerDiscount.Text =  dt.Rows[0]["PartnerDiscount"].ToString();
            this.txtCustomerDiscount.Text =  dt.Rows[0]["CustomerDiscount"].ToString();
        }
        catch
        {
            throw new Exception("Không thể đổ dử liệu với id = " + Id+ "  Error" );
        }
        }
    
    #endregion
   

    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        this.setCustomer();
    } 
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Customer.aspx");
    } 
    #endregion
}