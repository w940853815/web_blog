using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPNETAJAXWeb.ValidateCode.Page;
using ASPNETAJAXWeb.AjaxLeaveword;
namespace web_blog
{
    public partial class Reply : System.Web.UI.Page
    {
        int messageID = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            tbIP.Text = Request.UserHostAddress;
            if(Request.Params["MessageID"]!=null)
            {
                messageID = Int32.Parse(Request.Params["MessageID"].ToString());
            }
            btCommit.Enabled = messageID > 0 ? true : false;    
        }
        protected void btnCommit_Click(object sender,EventArgs e) 
        {
            if(Session[ValidateCode.VALIDATECODEKEY]!=null)
            {
                if(tbCode.Text!=Session[ValidateCode.VALIDATECODEKEY].ToString())
                {
                    lbMessage.Text = "验证码输入错误，请重新输入";
                    return;
                }
                Message message = new Message();
                if(message.AddReply(tbMessage.Text,Request.UserHostAddress,messageID)>0)
                {
                    Response.Redirect("Index.aspx");
                }
            }
        }
        protected void btnClear_Click(object sender,EventArgs e) 
        {
            tbMessage.Text = string.Empty;
        }
    }
}