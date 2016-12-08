using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerEdit : System.Web.UI.Page
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
            if (this.txtName.Text.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập tên thành viên";
                return;
            }
            if (this.txtIdCard.Text.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập số CMND của thành viên";
                return;
            }
            if (this.txtBirthday.Text.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập ngày sinh của thành viên";
                return;
            }
            if (upImage1.PostedFile.FileName != "")
                if (!saveImage1())
                {
                    return;
                }
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "";
            sqlQuery = "IF NOT EXISTS (SELECT * FROM tblCustomers WHERE Id = @Id)";
            sqlQuery += "BEGIN INSERT INTO tblCustomers(Name,Address,Birthday,IdCard,Phone,Email,Account,Avatar,State) VALUES(@Name,@Address,@Birthday,@IdCard,@Phone,@Email,@Account,@Avatar,@State) END ";
            sqlQuery += "ELSE BEGIN UPDATE tblCustomers SET Name = @Name,Address = @Address,Birthday = @Birthday,IdCard = @IdCard,Phone = @Phone,Email = @Email,Account = @Account,Avatar = @Avatar,State = @State WHERE Id = @Id END";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value = this.itemId;
            Cmd.Parameters.Add("Name", SqlDbType.NVarChar).Value = this.txtName.Text;
            Cmd.Parameters.Add("Address", SqlDbType.NVarChar).Value = this.txtAddress.Text;
            try
            {
                Cmd.Parameters.Add("Birthday", SqlDbType.DateTime).Value = this.txtBirthday.Text;
            }
            catch
            {
                Cmd.Parameters.Add("Birthday", SqlDbType.DateTime).Value = DateTime.Now;
            }
            Cmd.Parameters.Add("Phone", SqlDbType.NVarChar).Value = this.txtPhone.Text;
            Cmd.Parameters.Add("Email", SqlDbType.NVarChar).Value = this.txtEmail.Text;
            Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = this.txtAccount.Text;
            Cmd.Parameters.Add("IdCard", SqlDbType.NVarChar).Value = this.txtIdCard.Text;
            Cmd.Parameters.Add("Avatar", SqlDbType.NVarChar).Value = this.txtAvatar.Text;
            Cmd.Parameters.Add("State", SqlDbType.Bit).Value = this.ckbState.Checked;
            Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();
            Response.Redirect("Customer.aspx");
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
        Cmd.CommandText = "SELECT * FROM tblCustomers WHERE Id = @Id";
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = this.itemId;
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            this.txtName.Text = Rd["Name"].ToString();
            this.txtAddress.Text = Rd["Address"].ToString();
            this.txtPhone.Text = Rd["Phone"].ToString();
            try { 
            this.txtBirthday.Text = DateTime.Parse(Rd["Birthday"].ToString()).ToString("dd/MM/yyyy");
                }
            catch
            {
                this.txtBirthday.Text = "";
            }
            this.txtEmail.Text = Rd["Email"].ToString();
            this.txtAccount.Text = Rd["Account"].ToString();
            this.txtIdCard.Text = Rd["IdCard"].ToString();
            this.txtAvatar.Text = Rd["Avatar"].ToString();
            if (Rd["State"].ToString() == "True")
            {
                this.ckbState.Checked = true;
            }
            else
            {
                this.ckbState.Checked = false;
            }
            lblImg1.Text = "<img width = \"125px\" height = \"100px\" src = \"/Images/Customer/" + Rd["Avatar"].ToString() + "\">";
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

    #region method saveImage1
    private bool saveImage1()
    {
        string strBaseLoactionImg = "";
        try
        {
            strBaseLoactionImg = Server.MapPath(System.Configuration.ConfigurationSettings.AppSettings["CUSTOMERS"].ToString());
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
                this.txtAvatar.Text = sFileName + strEx;
                this.lblImg1.Text = "<img width = \"125px\" height = \"100px\"  src = \"../Images/Products/" + sFileName + strEx + "\">";
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
}