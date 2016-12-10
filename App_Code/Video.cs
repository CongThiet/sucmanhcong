using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class Video
{  
 
    string url = "";
    string name = "";
    bool state =false ;

    public string getUrl()
    {
        return this.url;
    }

    public string getName()
    {
        return this.name;
    }

    public bool getState()
    {
        return this.state;
    }
	public Video()
	{
	
	}
    #region video structure url,name,state
    public Video(string url,string name,bool state)
    {
        this.name = name;
        this.url = url;
        this.state = state;

    }
    #endregion
    #region getVideo by Id , return video object
    public Video getVideo(int id)
    {

        SqlConnection sqlCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["TVSConn"].ConnectionString);
        sqlCon.Open();
        SqlCommand Cmd = sqlCon.CreateCommand();
        Cmd.CommandText = "SELECT * FROM tblVideo WHERE Id = @Id";
        Cmd.Parameters.Add("Id", SqlDbType.Int).Value = id;
        SqlDataReader Rd = Cmd.ExecuteReader();

        while (Rd.Read())
        {
            this.url += Rd["Url"].ToString();
            this.name += Rd["Name"].ToString();
            if (Rd["State"].ToString() == "True")
            {
               this.state= true;
            }
            else
            {
               this.state = false;
            }
        }
        Rd.Close();
        sqlCon.Close();
        sqlCon.Dispose();

        return this;
    }
    #endregion



    #region method setVideo ,return int -1 / 1
    public int  setVideo(int id,string url,string name,bool state)
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
            Cmd.Parameters.Add("Id", SqlDbType.Int).Value =id;
            Cmd.Parameters.Add("Url", SqlDbType.NVarChar).Value = url   ;
            Cmd.Parameters.Add("Name", SqlDbType.NVarChar).Value =name;
            Cmd.Parameters.Add("State", SqlDbType.Bit).Value =state;
            Cmd.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Dispose();
        }
        catch
        {
            return -1;
            throw new Exception("Khong the thiet lap video");
          
        }
        return 1;
    }
    #endregion 


}