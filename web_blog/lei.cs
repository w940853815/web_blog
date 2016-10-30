using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace ASPNETAJAXWeb.AjaxLeaveword
{
    public class Message
    {
        public DataSet GetMessage()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLCONNECTSTRING"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string cmdText = "SELECT * FROM Message Order by CreatDate DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmdText,con);
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                da.Fill(ds, "DataTable");
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
            finally 
            {
                con.Close();
            }
            return ds;
        }
        public int AddMessage(string title,string message,string ip,string email) 
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SQLCONNECTSTRING"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string cmdText = "INSERT INTO Message(Title,Message,IP,Email,CreatDate,Status)VALUES(@Title,@Message,@IP,@Email,GETDATE(),0)";
            SqlCommand cmd = new SqlCommand(cmdText,con);
            cmd.Parameters.Add("@Title",SqlDbType.VarChar,200);
            cmd.Parameters.Add("@Message",SqlDbType.Text);
            cmd.Parameters.Add("@IP",SqlDbType.VarChar,255);
            cmd.Parameters[0].Value = title;
            cmd.Parameters[1].Value = message;
            cmd.Parameters[2].Value = ip;
            cmd.Parameters[3].Value = email;
            int result = -1;
            try
            {
                con.Open();
                result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
            finally
            {
                con.Close();
            }
            return result;
        }
    }
}