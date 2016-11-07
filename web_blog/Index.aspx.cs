using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data;
using ASPNETAJAXWeb.AjaxLeaveword;
using ASPNETAJAXWeb.ValidateCode.Page;
namespace web_blog
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tbIP.Text = Request.UserHostAddress;
            if (!Page.IsPostBack) 
            {
                BindPageData();
            }
            sm.RegisterAsyncPostBackControl(tbMessage);
        }
        private void BindPageData() 
        {
            Message message = new Message();
            DataSet ds = message.GetMessage();
            gvMessage.DataSource = ds;
            gvMessage.DataBind();
        }
        protected void btnCommit_Click(object sender,EventArgs a) 
        {
            if (Session[ValidateCode.VALIDATECODEKEY] != null)
            {
                if (tbCode.Text != Session[ValidateCode.VALIDATECODEKEY].ToString())
                {
                    lbMessage.Text = "验证码输入错误，请重新输入";
                    return;
                }
                Message message = new Message();
                if (message.AddMessage(tbTitle.Text,tbMessage.Text,Request.UserHostAddress,tbEmail.Text) > 0)
                {
                    BindPageData();
                }
            }
        }
        protected void btnClear_Click(object sender,EventArgs e) 
        {
            tbMessage.Text = string.Empty;
        }
    }
}