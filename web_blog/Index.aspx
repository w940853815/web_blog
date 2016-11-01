<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="web_blog.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm" runat="server">
            <Services>
                <asp:ServiceReference Path="~/AjaxService.asmx" />
            </Services>
        </asp:ScriptManager>
        <table class="Table" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td colspan="2">
                    <asp:UpdatePanel runat="server" ID="up">
                        <ContentTemplate>
                            <asp:GridView ID="gvMessage" runat="server" Width="100%" AutoGenerateColumns="false" SkinID="mm" ShowHeader="false">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table align="center" cellpadding="3" cellspacing="0" class="Table">
                                                <tr>
                                                    <td>作者：<a href='mailto:<%# Eval("Email") %>>'<%# Eval("Email") %>></a>
                                                        于[<%# Eval("IP") %>>]、[<%# Eval("CreateDate") %>>]留言
                                                    </td>
                                                </tr>
                                                <tr><td><hr size="1" /></td></tr>
                                                <tr><td class="Title"><%# Eval("Title") %>></td></tr>
                                                <tr><td><%# Eval("Message") %>></td></tr>
                                                <tr>
                                                    <td align="right"><a href="#message">我要留言</a>&nbsp;
                                                        <a href='Huifu.aspx?MessageID=<%# Eval("ID") %>>'我要回复</a>&nbsp;<asp:HyperLink runat="server" ID="h1ShowReply" NavigateUrl="#">展开>></asp:HyperLink>
                                                        <asp:Panel runat="server" ID="pReply"></asp:Panel>
                                                        <ajaxToolkit:DynamicPopulateExtender ID="DynamicPopulateExtender1" runat="server" ClearContentsDuringUpdate="true" UpdatingCssClass="PopulatePanel" ServiceMethod="GetReplyByMessage" ServicePath="AjaxService.asmx" ContextKey='<%# Eval("ID") %>' TargetControlID="pReply" PopulateTriggerControlID="h1ShowReply"></ajaxToolkit:DynamicPopulateExtender>
                                    
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
            </td>     
            </tr>
        </table>
   
    </form>
    <div>
        <td>留言标题：</td>
        <td width="90%">
            <asp:TextBox ID="bTitle" runat="server" SkinID="nn" Width="80%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfTitle" runat="server" ControlToValidate="tbTitle" ErrorMessage="标题不能为空！"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revTitle" runat="server" ControlToValidate="tbTitle" Display="Dynamic" ErrorMessage="标题不能为空！" ValidationExpression=".+"></asp:RegularExpressionValidator>
            <ajaxToolkit:TextBoxWatermarkExtender ID="wmeTitle" runat="server" TargetControlID="tbTitle" WatermarkText="请输入留言标题" WatermarkCssClass="Watermark"></ajaxToolkit:TextBoxWatermarkExtender>
        </td>
    </div>
</body>
</html>
