using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPNETAJAXWeb.AjaxLeaveword;
using System.Data;
namespace web_blog
{
    public partial class LiuyanFen : System.Web.UI.Page
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
        protected void gvMessage_PageIndexChanging(object sender,GridViewPageEventArgs e)
        {
            gvMessage.PageIndex = e.NewPageIndex;
            BindPageData();
        }
    }
}