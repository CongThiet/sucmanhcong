using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PartnerEdit : System.Web.UI.Page
{
    #region declare objects
    private int itemId = 0;
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        txtContent.config.toolbar = new object[]
        {
            new object[] { "Source", "-", "Save", "NewPage", "Preview", "-", "Templates" },
            new object[] { "Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Print", "SpellChecker", "Scayt" },
            new object[] { "Undo", "Redo", "-", "Find", "Replace", "-", "SelectAll", "RemoveFormat" },
            new object[] { "Form", "Checkbox", "Radio", "TextField", "Textarea", "Select", "Button", "ImageButton", "HiddenField" },
            "/",
            new object[] { "Bold", "Italic", "Underline", "Strike", "-", "Subscript", "Superscript" },
            new object[] { "NumberedList", "BulletedList", "-", "Outdent", "Indent", "Blockquote", "CreateDiv" },
            new object[] { "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyBlock" },
            new object[] { "BidiLtr", "BidiRtl" },
            new object[] { "Link", "Unlink", "Anchor" },
            new object[] { "Image", "Flash", "Table", "HorizontalRule", "Smiley", "SpecialChar", "PageBreak", "Iframe" },
            "/",
            new object[] { "Styles", "Format", "Font", "FontSize" },
            new object[] { "TextColor", "BGColor" },
            new object[] { "Maximize", "ShowBlocks", "-", "About" }
        };
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
            this.getBusiness();
            this.getPartner();
        }
    }
    #endregion

    #region method getPartner
    public void getPartner()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblPartner WHERE Id = @Id";
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = this.itemId;
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            this.txtName.Text = Rd["Name"].ToString();
            this.txtAddress.Text = Rd["Address"].ToString();
            this.txtManager.Text = Rd["Manager"].ToString();
            this.txtPhone.Text = Rd["Phone"].ToString();
            this.txtTaxCode.Text = Rd["TaxCode"].ToString();
            this.ddlBusiness.SelectedValue = Rd["Business"].ToString();
            this.txtContent.Text = Rd["Content"].ToString();
            this.txtImage.Text = Rd["Image"].ToString();
            if (Rd["BestSale"].ToString() == "True")
            {
                this.ckbBestSale.Checked = true;
            }
            else
            {
                this.ckbBestSale.Checked = false;
            }
            if (Rd["VIP"].ToString() == "True")
            {
                this.ckbVIP.Checked = true;
            }
            else
            {
                this.ckbVIP.Checked = false;
            }
            if (Rd["State"].ToString() == "True")
            {
                this.ckbState.Checked = true;
            }
            else
            {
                this.ckbState.Checked = false;
            }
            this.txtDiscount.Text = Rd["Discount"].ToString();
            lblImg1.Text = "<img width = \"125px\" height = \"100px\" src = \"/Images/Partner/" + Rd["Image"].ToString() + "\">";
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion

    #region method setPartner
    public void setPartner()
    {
        try
        {
            if (upImage1.PostedFile.FileName != "")
                if (!saveImage1())
                {
                    return;
                }
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "IF NOT EXISTS (SELECT * FROM tblPartner WHERE Id = @Id)";
            sqlQuery += "BEGIN INSERT INTO tblPartner(Name,Address,Phone,Manager,Business,TaxCode,Content,Image,BestSale,VIP,State,Discount) VALUES(@Name,@Address,@Phone,@Manager,@Business,@TaxCode,@Content,@Image,@BestSale,@VIP,@State,@Discount) END ";
            sqlQuery += "UPDATE tblPartner SET Name = @Name, Address = @Address, Phone = @Phone, Manager = @Manager, Business = @Business, TaxCode = @TaxCode, Content = @Content, Image = @Image, State = @State, BestSale = @BestSale, VIP = @VIP, Discount = @Discount WHERE Id = @Id";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value = this.itemId;
            Cmd.Parameters.Add("Name", SqlDbType.NVarChar).Value = this.txtName.Text;
            Cmd.Parameters.Add("Address", SqlDbType.NVarChar).Value = this.txtAddress.Text;
            Cmd.Parameters.Add("Phone", SqlDbType.NVarChar).Value = this.txtPhone.Text;
            Cmd.Parameters.Add("Manager", SqlDbType.NVarChar).Value = this.txtManager.Text;
            Cmd.Parameters.Add("TaxCode", SqlDbType.NVarChar).Value = this.txtTaxCode.Text;
            Cmd.Parameters.Add("Business", SqlDbType.Int).Value = this.ddlBusiness.SelectedValue.ToString();
            Cmd.Parameters.Add("Content", SqlDbType.NText).Value = this.txtContent.Text;
            Cmd.Parameters.Add("Image", SqlDbType.NVarChar).Value = this.txtImage.Text;
            Cmd.Parameters.Add("BestSale", SqlDbType.Bit).Value = this.ckbBestSale.Checked;
            Cmd.Parameters.Add("VIP", SqlDbType.Bit).Value = this.ckbVIP.Checked;
            Cmd.Parameters.Add("State", SqlDbType.Bit).Value = this.ckbState.Checked;
            Cmd.Parameters.Add("Discount", SqlDbType.Float).Value = this.txtDiscount.Text;
            Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();
            Response.Redirect("Partner.aspx");
        }
        catch
        {

        }
    }
    #endregion

    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        this.setPartner();
    }
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Partner.aspx");
    }
    #endregion

    #region method saveImage1
    private bool saveImage1()
    {
        string strBaseLoactionImg = "";
        try
        {
            strBaseLoactionImg = Server.MapPath(System.Configuration.ConfigurationSettings.AppSettings["PARTNER"].ToString());
            if (upImage1.PostedFile.ContentLength > 5048576)
            {
                return false;
            }
            else
            {
                string sFileName = "A" + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + "-" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second + DateTime.Now.Millisecond.ToString();
                string strEx = System.IO.Path.GetFileName(upImage1.PostedFile.FileName);
                strEx = strEx.Substring(strEx.LastIndexOf("."), strEx.Length - strEx.LastIndexOf("."));
                strBaseLoactionImg += sFileName + strEx;
                strBaseLoactionImg = strBaseLoactionImg.Replace("/", "\\");
                upImage1.PostedFile.SaveAs(strBaseLoactionImg);
                this.txtImage.Text = sFileName + strEx;
                this.lblImg1.Text = "<img width = \"125px\" height = \"100px\"  src = \"../Images/Partner/" + sFileName + strEx + "\">";
                return true;
            }
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return false;
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
}