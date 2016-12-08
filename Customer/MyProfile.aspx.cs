using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_MyProfile : System.Web.UI.Page
{
    #region declare objects
    public string strName = "", strAddress = "", strPhone = "", strBirthday = "", strIdCard = "", strEmail = "", strMsg = "";
    private string Id = "";
    private TVSFunc objFunc = new TVSFunc();
    #endregion

    #region method Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.Id = Session["ACCOUNT"].ToString();
        }
        catch
        {
            this.Id = "";
        }
        if (!Page.IsPostBack)
        {
            this.getCustomer();
        }
    }
    #endregion

    #region method getCustomer
    public void getCustomer()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblCustomers WHERE Account = @Account";
        Cmd.Parameters.Add("Account", SqlDbType.NVarChar).Value = this.Id;
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            this.strName = Rd["Name"].ToString();
            this.strAddress = Rd["Address"].ToString();
            this.strPhone = Rd["Phone"].ToString();
            try
            {
                this.strBirthday = DateTime.Parse(Rd["Birthday"].ToString()).ToString("dd/MM/yyyy");
            }
            catch { }
            this.strEmail = Rd["Email"].ToString();
            this.strIdCard = Rd["IdCard"].ToString();
            lblImg1.Text = "<img width = \"100%\" height = \"120px\" src = \"/Images/Customer/" + Rd["Avatar"].ToString() + "\">";
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion

    #region method btnUpdate_Click
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerInfoUpdate.aspx");
    } 
    #endregion
}