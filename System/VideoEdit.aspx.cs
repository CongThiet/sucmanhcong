using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VideoEdit : System.Web.UI.Page
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
            this.getVideo();
        }
    }
    #endregion

    #region method getVideo
    public void getVideo()
    {
        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblVideo WHERE Id = @Id";
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = this.itemId;
        SqlDataReader Rd = Cmd.ExecuteReader();
        while (Rd.Read())
        {
            this.txtUrl.Text = Rd["Url"].ToString();
            this.txtName.Text = Rd["Name"].ToString();
            if (Rd["State"].ToString() == "True")
            {
                this.ckbState.Checked = true;
            }
            else
            {
                this.ckbState.Checked = false;
            }
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();
    }
    #endregion

    #region method setVideo
    public void setVideo()
    {
        try
        {
            SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
            sqlCon.Open();
            SqlCommand Cmd = sqlCon.CreateCommand();
            string sqlQuery = "";
            sqlQuery = "IF NOT EXISTS (SELECT * FROM tblVideo WHERE Id = @Id)";
            sqlQuery += "BEGIN INSERT INTO tblVideo(Name,Url,State) VALUES(@Name,@Url,@State) END ";
            sqlQuery += "ELSE BEGIN UPDATE tblVideo SET Name = @Name, Url = @Url, State = @State WHERE Id = @Id END";
            Cmd.CommandText = sqlQuery;
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value = this.itemId;
            Cmd.Parameters.Add("Url", SqlDbType.NVarChar).Value = this.txtUrl.Text;
            Cmd.Parameters.Add("Name", SqlDbType.NVarChar).Value = this.txtName.Text;
            Cmd.Parameters.Add("State", SqlDbType.Bit).Value = this.ckbState.Checked;
            Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();
            Response.Redirect("Video.aspx");
        }
        catch
        {

        }
    }
    #endregion

    #region method btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        this.setVideo();
    } 
    #endregion

    #region method btnCancel_Click
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Video.aspx");
    } 
    #endregion
}