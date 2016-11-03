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
              <td>留言标题：</td>
        <td width="90%">
            <asp:TextBox ID="tbTitle" runat="server" SkinID="nn" Width="80%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfTitle" runat="server" ControlToValidate="tbTitle" ErrorMessage="标题不能为空！"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revTitle" runat="server" ControlToValidate="tbTitle" Display="Dynamic" ErrorMessage="标题不能为空！" ValidationExpression=".+"></asp:RegularExpressionValidator>
            <ajaxToolkit:TextBoxWatermarkExtender ID="wmeTitle" runat="server" TargetControlID="tbTitle" WatermarkText="请输入留言标题" WatermarkCssClass="Watermark"></ajaxToolkit:TextBoxWatermarkExtender>
        </td>
        </tr>
        <tr bgcolor="white">
            <td>IP地址:</td>
            <td width="90%"><asp:TextBox ID="tbIP" runat="server" Enabled="false" SkinID="nn" Width="40%"></asp:TextBox></td>
        </tr>
        <tr bgcolor="white">
            <td>电子邮件：</td>
            <td width="90%"><asp:TextBox ID="tbEmail" runat="server" SkinID="nn" Width="40%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfEmail" runat="server" ErrorMessage="不能为空！" ControlToValidate="tbEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbEmail" Display="None" ErrorMessage="电子邮件格式不正确，请输入如下形式的电子邮件：<br />mmmm@nnn.com" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> 
                <ajaxToolkit:ValidatorCalloutExtender ID="vceEmail" runat="server" TargetControlID="revEmail" HighlightCssClass="Validator"></ajaxToolkit:ValidatorCalloutExtender>
            </td>
        </tr>
        <tr bgcolor="white">
            <td valign="top">留言内容：</td>
            <td width="90%">
                <asp:TextBox ID="tbMessage" runat="server" Height="200px" SkinID="nn" TextMode="MultiLine" Width="80%"></asp:TextBox>
                <asp:CustomValidator ID="cvMessage" runat="server" ClientValidationFunction="MessageValidator" ControlToValidate="tbMessage" Display="None" ErrorMessage="长度至少为10，最多为8000。"></asp:CustomValidator>
                <ajaxToolkit:TextBoxWatermarkExtender ID="wmeMessage" runat="server" TargetControlID="tbMessage" WatermarkText="请输入留言内容" WatermarkCssClass="watermark"></ajaxToolkit:TextBoxWatermarkExtender>
                <ajaxToolkit:ValidatorCalloutExtender ID="vceMessage" runat="server" TargetControlID="cvMessage" HighlightCssClass="Validator"></ajaxToolkit:ValidatorCalloutExtender>
            </td>
        </tr>
        <tr bgcolor="white">
            <td>验证码：</td>
            <td width="90%">
                <asp:TextBox ID="tbCode" runat="server" SkinID="nn" Width="80px"></asp:TextBox>
                <asp:Image ID="imgCode" runat="server" ImageUrl="~/Yanzhengma.aspx" />
                <asp:Label ID="lbMessage" runat="server" ForeColor="Red" CssClass="Text"></asp:Label>
            </td>
        </tr>
        <tr bgcolor="white">
            <td>&nbsp;</td>
            <td width="90%">
                <asp:UpdatePanel ID="upbutton" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btCommit" runat="server" Text="提 交" SkinID="anniu" Width="100px" OnClick="btnCommit_Click" />&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnReview" runat="server" Text="预 览" SkinID="anniu" Width="100px" />&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnClear" runat="server" Text="清 空" SkinID="anniu" Width="100px" CausesValidation="false" OnClick="btnClear_Click" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnClear" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        </table>
            <script language="javascript" type="text/javascript">
                function MessageValidator(source, argument)
                {
                    if (argument.Value.length > 10 && argument.Value.length < 8000)
                        argument.IsValid = true;
                    else argument.IsValid = false;
                }
            </script>
    </form>
    
</body>
</html>
