using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Text;
using System.Web.Script.Services;
using ASPNETAJAXWeb.AjaxLeaveword;
namespace web_blog
{
    /// <summary>
    /// AjaxService 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    //添加脚本服务
        [System.Web.Script.Services.ScriptService()]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    // [System.Web.Script.Services.ScriptService]
    public class AjaxService : System.Web.Services.WebService
    {

        [WebMethod]
        public string GetReplyByMessage(string contextKey)
        {
            int messageID = -1;
            if (Int32.TryParse(contextKey, out messageID) == false) 
            {
                return string.Empty;
            }
            Message message = new Message();
            DataSet ds = message.GetReplyByMessage(messageID);
            if(ds==null|| ds.Tables.Count<=0||ds.Tables[0].Rows.Count<=0)
            {
                return string.Empty;
            }
            StringBuilder returnHtml = new StringBuilder();
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                returnHtml.AppendFormat("<div>{0}于[{1}]回复</div>",row["IP"],row["CreateDate"]);
                returnHtml.Append("<br />");
                returnHtml.AppendFormat("<div>{0}</div>",row["IP"],row["CreateDate"]);
                returnHtml.Append("<br />");
                returnHtml.AppendFormat("<div>{0}</div>",row["Reply"]);
                returnHtml.Append("<br />");
            }
            return returnHtml.ToString();
        }
    }
}
