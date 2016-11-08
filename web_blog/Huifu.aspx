<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Huifu.aspx.cs" Inherits="web_blog.Reply" StylesheetTheme="css" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="mm" runat="server" />
        <table class="Table" border="0" cellpadding="2" bgcolor="Black" cellspacing="1" align="center">
            <tr bgcolor="white"><td colspan="2"><hr /></td></tr>
            <tr bgcolor="white">
                <td>IP地址：</td>
                <td width="90%"><asp:TextBox ID="tbIP" runat="server" Enabled="false" SkinID="nn" Width="40%"></asp:TextBox></td>
            </tr>
            <tr bgcolor="white">
                <td valign="top">回复内容：</td>
                <td width="90%">
                    <asp:TextBox ID="tbMessage" runat="server" Height="200px" SkinID="nn" TextMode="MultiLine" Width="80%"></asp:TextBox>
                    <asp:CustomValidator ID="cvMessage" runat="server" ClientValidationFunction="MessageValidator" ControlToValidate="tbMessage" Display="None" ErrorMessage="长度至少为10，做多为1000"></asp:CustomValidator>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="wmeMessage" runat="server" TargetControlID="tbMessage" WatermarkText="请输入留言内容" WatermarkCssClass="Watermark"> </ajaxToolkit:TextBoxWatermarkExtender>
                    <ajaxToolkit:ValidatorCalloutExtender ID="vceMessage" runat="server" TargetControlID="cvMessage" HighlightCssClass="Validator"></ajaxToolkit:ValidatorCalloutExtender>
               </td>
            </tr>
            <tr bgcolor="white">
                <td>验证码：</td>
                <td width="90%">
                    <asp:TextBox ID="tbCode" runat="server" SkinID="nn" Width="80px"></asp:TextBox>
                    <asp:Image ID="imgCode" runat="server" ImageUrl="Yanzhengma.aspx" />
                    <asp:Label ID="lbMessage" runat="server" ForeColor="Red" CssClass="Text"></asp:Label>
                </td>
            </tr>
            <tr bgcolor="white"><td>&nbsp;</td>
                <td width="90%">
                    <asp:UpdatePanel ID="upbutton" runat="server">
                        <ContentTemplate>
                             <asp:Button ID="btCommit" runat="server" Text="提 交" SkinID="anniu" Width="100px" OnClick="btnCommit_Click" />&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnReview" runat="server" Text="预 览" SkinID="anniu" Width="100px" />&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnClear" runat="server" Text="清 空" SkinID="anniu" Width="100px" CausesValidation="false" OnClick="btnClear_Click" />
                        </ContentTemplate>
                        <Triggers><asp:PostBackTrigger ControlID="btnClear" /></Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>

        </table>
        <script language="javascript" type="text/javascript">
            function MessageValidator(source, argument) {
                if (argument.Value.length > 10 && argument.Value.length < 8000)
                    argument.IsValid = true;
                else argument.IsValid = false;
            }
            </script>
    </form>
</body>
</html>
