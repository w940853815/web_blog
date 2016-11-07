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
            string cmdText = "SELECT * FROM Message Order by CreateDate DESC";
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
        public int DeleteMessage(int messageID) 
        {
            string connectionString=ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string cmdText = "DELETE Message WHERE ID=@ID";
            SqlCommand cmd = new SqlCommand(cmdText,con);
            cmd.Parameters.Add("@ID",SqlDbType.Int,4);
            cmd.Parameters[0].Value = messageID;
            int result = -1;
            try
            {
                con.Open();
                result = cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message, ex);
            }
            finally 
            {
                con.Close();
            }
            return result;
        }
        public DataSet GetReplyByMessage(int messageID) 
        {
            string connectionString=ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string cmdText = "SELECT * FROM Reply WHERE MessageID=@MessageID Order by CreateDate DESC";
            SqlDataAdapter da = new SqlDataAdapter(cmdText,con);
            da.SelectCommand.Parameters.Add("@MessageID",SqlDbType.Int,4);
            da.SelectCommand.Parameters[0].Value = messageID;
            DataSet ds = new DataSet();
            try
            {
                con.Open();
                da.Fill(ds,"DataTable");
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message,ex);
            }
            finally 
            {
                con.Close();
            }
            return ds;
        }
        public int AddReply(string message,string ip,int messageID) 
        {
            string connectionString=ConfigurationManager.ConnectionStrings["SQLCONNECTIONSTRING"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            string cmdText = "INSERT INTO Reply(Reply,IP,CreatDate,MessageID)VALUES(@Reply,@IP,GETDATE(),@MessageID)";
            SqlCommand cmd = new SqlCommand(cmdText,con);
            cmd.Parameters.Add("@Reply",SqlDbType.VarChar,1000);
            cmd.Parameters.Add("@IP",SqlDbType.VarChar,20);
            cmd.Parameters.Add("@MessageID",SqlDbType.Int,4);
            cmd.Parameters[0].Value = message;
            cmd.Parameters[1].Value = ip;
            cmd.Parameters[2].Value = messageID;
            int result=-1;
            try
            {
                con.Open();
                result = cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
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