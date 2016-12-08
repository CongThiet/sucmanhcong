using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_BillNote : System.Web.UI.Page
{
    #region declare objects
    public string strPartnerName = "", strNgayHoaDon = "", strTotalMoney = "", strTotalMoneyDiscount = "", strDiscount = "", strTotalPeyment = "";
    private DataTable objTable = new DataTable();
    private int Item = 0;
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.Item = int.Parse(Request.QueryString["id"].ToString());
        }
        catch
        {
            this.Item = 0;
        }
        if (!Page.IsPostBack)
        {
            this.objTable = this.getCustomerBillInformation(this.Item);
            this.getBillNote();
            if (this.objTable.Rows.Count > 0)
            {
                this.strPartnerName = this.objTable.Rows[0]["PartnerName"].ToString();
                this.strNgayHoaDon = DateTime.Parse(this.objTable.Rows[0]["DayCreate"].ToString()).ToString("dd/MM/yyyy");
                this.strTotalMoney = String.Format("{0:0,0}", double.Parse(this.objTable.Rows[0]["TotalMoney"].ToString()));
                this.strTotalMoneyDiscount = String.Format("{0:0,0}", double.Parse(this.objTable.Rows[0]["TotalMoneyDiscount"].ToString()));
                this.strDiscount = String.Format("{0:0,0}", double.Parse(this.objTable.Rows[0]["Discount"].ToString()));
                this.strTotalPeyment = String.Format("{0:0,0}", double.Parse(this.objTable.Rows[0]["TotalPeyment"].ToString()));
                try
                {
                    this.ddlBillNote.SelectedValue = this.objTable.Rows[0]["IdNote1"].ToString();
                }
                catch
                {
                    this.ddlBillNote.SelectedValue = "0";
                }
                this.txtNote.Text = this.objTable.Rows[0]["NoteOther"].ToString();
            }
        }
    } 
    #endregion

    #region method getCustomerBillInformation
    public DataTable getCustomerBillInformation(int Id)
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT 0 AS TT, *, ISNULL(IdNote,0) AS IdNote1, (SELECT Name FROM tblPartner WHERE Account = PartnerAccount) AS PartnerName FROM tblPartnerBill WHERE Id = @Id";
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = Id;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = Cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        sqlCon.Close();
        sqlCon.Dispose();
        return ds.Tables[0];
    }
    #endregion

    #region method getBillNote
    public void getBillNote()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT Id, Note AS Name FROM tblBillNote";
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = Cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        this.ddlBillNote.DataSource = ds.Tables[0];
        this.ddlBillNote.DataTextField = "Name";
        this.ddlBillNote.DataValueField = "Id";
        this.ddlBillNote.DataBind();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion

    #region method setBillNote
    public void setBillNote(int Id)
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "UPDATE tblPartnerBill SET IdNote = @IdNote, Note = @Note, NoteOther = @NoteOther WHERE Id = @Id";
        Cmd.Parameters.Add("IdNote", SqlDbType.Int).Value = this.ddlBillNote.SelectedValue.ToString();
        Cmd.Parameters.Add("Note", SqlDbType.NVarChar).Value = this.ddlBillNote.SelectedItem.Text.ToString();
        Cmd.Parameters.Add("NoteOther", SqlDbType.NVarChar).Value = this.txtNote.Text;
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = Id;
        Cmd.ExecuteNonQuery();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion

    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        this.setBillNote(this.Item);

        this.objTable = this.getCustomerBillInformation(this.Item);
        if (this.objTable.Rows.Count > 0)
        {
            this.strPartnerName = this.objTable.Rows[0]["PartnerName"].ToString();
            this.strNgayHoaDon = DateTime.Parse(this.objTable.Rows[0]["DayCreate"].ToString()).ToString("dd/MM/yyyy");
            this.strTotalMoney = String.Format("{0:0,0}", double.Parse(this.objTable.Rows[0]["TotalMoney"].ToString()));
            this.strTotalMoneyDiscount = String.Format("{0:0,0}", double.Parse(this.objTable.Rows[0]["TotalMoneyDiscount"].ToString()));
            this.strDiscount = String.Format("{0:0,0}", double.Parse(this.objTable.Rows[0]["Discount"].ToString()));
            this.strTotalPeyment = String.Format("{0:0,0}", double.Parse(this.objTable.Rows[0]["TotalPeyment"].ToString()));
            try
            {
                this.ddlBillNote.SelectedValue = this.objTable.Rows[0]["IdNote1"].ToString();
            }
            catch
            {
                this.ddlBillNote.SelectedValue = "0";
            }
            this.txtNote.Text = this.objTable.Rows[0]["NoteOther"].ToString();
        }
    } 
    #endregion
}