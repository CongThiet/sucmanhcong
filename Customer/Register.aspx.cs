using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_Register : System.Web.UI.Page
{
    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

    } 
    #endregion

    #region method setCustomer
    public void setCustomer()
    {
        try
        {
            this.lblMsg.Text = "";
            if (this.txtName.Value.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập tên thành viên";
                return;
            }
            if (this.txtIdCard.Value.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập số CMND của thành viên";
                return;
            }
            if (this.txtBirthday.Value.Trim() == "")
            {
                this.lblMsg.Text = "Bạn chưa nhập ngày sinh của thành viên";
                return;
            }
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "";
            sqlQuery = "IF NOT EXISTS (SELECT * FROM tblCustomers WHERE Id = @Id)";
            sqlQuery += "BEGIN INSERT INTO tblCustomers(Name,Address,Birthday,IdCard,Phone,Email,State) VALUES(@Name,@Address,@Birthday,@IdCard,@Phone,@Email,@State) END ";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value = 0;
            Cmd.Parameters.Add("Name", SqlDbType.NVarChar).Value = this.txtName.Value;
            Cmd.Parameters.Add("Address", SqlDbType.NVarChar).Value = this.txtAddress.Value;
            try
            {
                Cmd.Parameters.Add("Birthday", SqlDbType.DateTime).Value = this.txtBirthday.Value;
            }
            catch
            {
                Cmd.Parameters.Add("Birthday", SqlDbType.DateTime).Value = DateTime.Now;
            }
            Cmd.Parameters.Add("Phone", SqlDbType.NVarChar).Value = this.txtPhone.Value;
            Cmd.Parameters.Add("Email", SqlDbType.NVarChar).Value = this.txtEmail.Value;
            Cmd.Parameters.Add("IdCard", SqlDbType.NVarChar).Value = this.txtIdCard.Value;
            Cmd.Parameters.Add("State", SqlDbType.Bit).Value = false;
            Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();
            this.lblMsg.Text = "Thông tin đăng ký đã được gửi đến ban quản trị, chúng tôi sẽ xem xét và phản hồi bạn, Xin cảm ơn!";
            this.btnRegister.Enabled = false;
            this.btnCancel.Text = "Tiếp tục";
        }
        catch
        {

        }
    }
    #endregion

    #region method btnRegister_Click
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        this.setCustomer();
    } 
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("../");
    } 
    #endregion
}