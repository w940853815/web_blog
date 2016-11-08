using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPNETAJAXWeb.AjaxLeaveword;
namespace web_blog
{
    public partial class BoardManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                BindPageData();
            }
        }
        private void BindPageData()
        {
            Message message = new Message();
            DataSet ds = message.GetMessage();
            gvMessage.DataSource = ds;
            gvMessage.DataBind();
           
        }
        protected void gvMessage_PageIndexChanging(object sender, GridViewPageEventArgs e) 
        {
            gvMessage.PageIndex = e.NewPageIndex;
            BindPageData();
        }
        protected void gvMessage_RowDataBound(object sender,GridViewRowEventArgs e) 
        {
            Button button = (Button)e.Row.FindControl("btnDelete");
            if(button!=null)
            {
                button.Attributes.Add("onclick","return confirm(\"你确定要删除当前行的留言吗？\");");
            }
        }
        protected void gvMessage_RowCommand(object sender,GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower() == "del")
            {
                Message message = new Message();
                if(message.DeleteMessage(Int32.Parse(e.CommandArgument.ToString()))>0)
                {
                    BindPageData();
                }
            }
        }
        
    }
}