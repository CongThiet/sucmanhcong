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
        }
        if (!Page.IsPostBack)
        {
            this.getCustomer();
        }
    }
    #endregion

    #region method setCustomer
    public void setCustomer()
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
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "";
            sqlQuery = "IF NOT EXISTS (SELECT * FROM tblSystemCongif WHERE Id = @Id)";
            sqlQuery += "BEGIN INSERT INTO tblSystemCongif(PartnerAccount,CustomerAccount,CustomerAccount1,CustomerAccount2,MemberAccount,PartnerDiscount,CustomerDiscount) VALUES(@PartnerAccount,@CustomerAccount,@CustomerAccount1, @CustomerAccount2, @MemberAccount,@PartnerDiscount,@CustomerDiscount) END ";
            sqlQuery += "ELSE BEGIN UPDATE tblSystemCongif SET PartnerAccount = @PartnerAccount,CustomerAccount = @CustomerAccount,CustomerAccount1 = @CustomerAccount1,CustomerAccount2 = @CustomerAccount2,MemberAccount = @MemberAccount,PartnerDiscount = @PartnerDiscount,CustomerDiscount = @CustomerDiscount WHERE Id = @Id END";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value = 1;
            Cmd.Parameters.Add("PartnerAccount", SqlDbType.NVarChar).Value = this.txtPartnerAccount.Text;
            Cmd.Parameters.Add("CustomerAccount", SqlDbType.NVarChar).Value = this.txtCustomerAccount.Text;
            Cmd.Parameters.Add("CustomerAccount1", SqlDbType.NVarChar).Value = this.txtCustomerAccount1.Text;
            Cmd.Parameters.Add("CustomerAccount2", SqlDbType.NVarChar).Value = this.txtCustomerAccount2.Text;
            Cmd.Parameters.Add("MemberAccount", SqlDbType.NVarChar).Value = this.txtMemberAccount.Text;
            Cmd.Parameters.Add("PartnerDiscount", SqlDbType.Float).Value = this.txtPartnerDiscount.Text;
            Cmd.Parameters.Add("CustomerDiscount", SqlDbType.Float).Value = this.txtCustomerDiscount.Text;
            Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();
            this.lblMsg.Text = "Lưu dữ thiệu thành công !";
        }
        catch
        {

        }
    }
    #endregion

    #region method getCustomer
    public void getCustomer()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblSystemCongif WHERE Id = @Id";
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = 1;
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            this.txtPartnerAccount.Text = Rd["PartnerAccount"].ToString();
            this.txtCustomerAccount.Text = Rd["CustomerAccount"].ToString();
            this.txtCustomerAccount1.Text = Rd["CustomerAccount1"].ToString();
            this.txtCustomerAccount2.Text = Rd["CustomerAccount2"].ToString();
            this.txtMemberAccount.Text = Rd["MemberAccount"].ToString();
            this.txtPartnerDiscount.Text = Rd["PartnerDiscount"].ToString();
            this.txtCustomerDiscount.Text = Rd["CustomerDiscount"].ToString();
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
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