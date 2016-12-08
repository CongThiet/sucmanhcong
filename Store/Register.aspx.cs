using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Store_Register : System.Web.UI.Page
{
    #region declare objects
    
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.getLocation();
            this.getBusiness();
        }
    }    
    #endregion

    #region method getBusiness
    public void getBusiness()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT Id, UPPER(Name) AS Name FROM tblBusiness";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = Cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        this.ddlBusiness.DataSource = ds.Tables[0];
        this.ddlBusiness.DataTextField = "Name";
        this.ddlBusiness.DataValueField = "Id";
        this.ddlBusiness.DataBind();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion

    #region method getLocation
    public void getLocation()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT Id, UPPER(Name) AS Name FROM tblLocation";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = Cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        this.ddlLocation.DataSource = ds.Tables[0];
        this.ddlLocation.DataTextField = "Name";
        this.ddlLocation.DataValueField = "Id";
        this.ddlLocation.DataBind();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion

    #region method setPartner
    public void setPartner()
    {
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "IF NOT EXISTS (SELECT * FROM tblPartner WHERE Id = @Id)";
            sqlQuery += "BEGIN INSERT INTO tblPartner(Name,Address,Phone,Manager,Business,TaxCode,BestSale,VIP,State.LocationId) VALUES(@Name,@Address,@Phone,@Manager,@Business,@TaxCode,@BestSale,@VIP,@State,@LocationId) END ";
            sqlQuery += "UPDATE tblPartner SET Name = @Name, Address = @Address, Phone = @Phone, Manager = @Manager, Business = @Business, TaxCode = @TaxCode State = @State, BestSale = @BestSale, VIP = @VIP, LocationId = @LocationId WHERE Id = @Id";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value = 0;
            Cmd.Parameters.Add("Name", SqlDbType.NVarChar).Value = this.txtName.Value.ToString();
            Cmd.Parameters.Add("Address", SqlDbType.NVarChar).Value = this.txtAddress.Value.ToString();
            Cmd.Parameters.Add("Phone", SqlDbType.NVarChar).Value = this.txtPhone.Value.ToString();
            Cmd.Parameters.Add("Manager", SqlDbType.NVarChar).Value = this.txtManager.Value.ToString();
            Cmd.Parameters.Add("TaxCode", SqlDbType.NVarChar).Value = this.txtTaxCode.Value.ToString();
            Cmd.Parameters.Add("Business", SqlDbType.Int).Value = this.ddlBusiness.SelectedValue.ToString();
            Cmd.Parameters.Add("BestSale", SqlDbType.Bit).Value = false;
            Cmd.Parameters.Add("VIP", SqlDbType.Bit).Value = false;
            Cmd.Parameters.Add("State", SqlDbType.Bit).Value = false;
            Cmd.Parameters.Add("LocationId", SqlDbType.Int).Value = this.ddlLocation.SelectedValue.ToString();
            Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {

        }
    }
    #endregion

    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        this.lblMsg.Text = "";
        if (this.txtName.Value.ToString().Trim() == "")
        {
            this.lblMsg.Text = "Bạn chưa nhập tên cửa hàng, vui lòng kiểm tra lại";
            this.txtName.Focus();
            return;
        }
        if (this.txtAddress.Value.Trim() == "")
        {
            this.lblMsg.Text = "Bạn chưa nhập địa chỉ cửa hàng, vui lòng kiểm tra lại";
            this.txtAddress.Focus();
            return;
        }
        if (this.txtPhone.Value.Trim() == "")
        {
            this.lblMsg.Text = "Bạn chưa nhập số điện thoại cửa hàng, vui lòng kiểm tra lại";
            this.txtPhone.Focus();
            return;
        }
        this.setPartner();
    }
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("/");
    }
    #endregion
}