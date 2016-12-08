using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mStore_History : System.Web.UI.Page
{
    #region declare objects
    private TVSFunc objFunc = new TVSFunc();
    private Partner objPartner = new Partner();
    public DataTable objTable = new DataTable();
    public string strName = "", strAddress = "", strPhone = "", strManager = "", strEmail = "", strTaxcode = "", strAccount = "", strBestSale = "", strVIP = "", strMsg = "", strHtml = "";
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

            this.objTable = this.getHistoryBill();
            if (this.objTable.Rows.Count > 0)
            {
                for (int i = 0; i < this.objTable.Rows.Count; i++)
                {
                    strHtml += "<div style =\"width:100%; margin-top:1px; background-color:#fff;\">";

                    strHtml += "<div style=\"width: 5%; background-color:#fff; float: left; border:solid 1px #f3f1f1; border-right:none; border-top:none;text-align:center;height:30px; line-height:30px; color:#000;\">";
                    strHtml += this.objTable.Rows[i]["TT"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 18%; background-color:#fff; float: left; border:solid 1px #f3f1f1;border-top:none;text-align:center;height:30px; line-height:30px; color:#000;\">";
                    strHtml += this.objTable.Rows[i]["DayCreate"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 10%; background-color:#fff; float: left; border:solid 1px #f3f1f1;border-top:none;border-left:none; text-align:right;height:30px; line-height:30px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["TotalMoney"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 10%; background-color:#fff; float: left; border:solid 1px #f3f1f1;border-top:none;border-left:none; text-align:right;height:30px; line-height:30px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["TotalMoneyDiscount"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 5%; background-color:#fff; float: left; border:solid 1px #f3f1f1;border-top:none;border-left:none; text-align:right;height:30px; line-height:30px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["Discount"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 5%; background-color:#fff; float: left; border:solid 1px #f3f1f1;border-top:none;border-left:none; text-align:right;height:30px; line-height:30px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["DiscountCard"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 5%; background-color:#fff; float: left; border:solid 1px #f3f1f1;border-top:none;border-left:none; text-align:right;height:30px; line-height:30px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["DiscountAdv"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 10%; background-color:#fff; float: left; border:solid 1px #f3f1f1; border-left:none; text-align:right;border-top:none;padding-right:5px;height:30px; line-height:30px; color:#000; padding-right:5px;\">";
                    strHtml += string.Format("{0:0,0}", double.Parse(this.objTable.Rows[i]["TotalPeyment"].ToString()));
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 27%; background-color:#fff; float: left; border:solid 1px #f3f1f1; border-left:none; text-align:justify;border-top:none;height:30px; line-height:30px; color:#000;\">";
                    strHtml += this.objTable.Rows[i]["Note"].ToString();
                    strHtml += "</div>";

                    strHtml += "<div style=\"width: 5%; background-color:#fff; float: left; border:solid 1px #f3f1f1; border-left:none; border-top:none;text-align:center;height:30px; line-height:30px; color:#000;\">";
                    strHtml += "<a href = \"ViewBill.aspx?id=" + this.objTable.Rows[i]["Id"].ToString() + "\"><img src = \"../img/Edit.png\" alt = \"Chi tiết\" title = \"Chi tiết hoá đơn\">";
                    strHtml += "</div>";

                    strHtml += "</div>";
                }
            }
        }
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

    #region method getHistoryBill
    public DataTable getHistoryBill()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT 0 AS TT, * FROM tblPartnerBill WHERE PartnerAccount = @PartnerAccount ORDER BY DayCreate DESC";
        Cmd.Parameters.Add("PartnerAccount", SqlDbType.NVarChar).Value = Session["ACCOUNT"].ToString();
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
        return ds.Tables[0];
    }
    #endregion
}