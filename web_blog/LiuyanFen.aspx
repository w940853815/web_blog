<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LiuyanFen.aspx.cs" Inherits="web_blog.LiuyanFen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <asp:ScriptManager ID="sm" runat="server" />
        <table class="Table" border="0" cellpadding="0" cellspacing="0" align="center">
            <asp:UpdatePanel runat="server" ID="up">
                <ContentTemplate>
                    <asp:GridView ID="gvMessage" runat="server" Width="100%" AutoGenerateColumns="false" SkinID="mm" ShowHeader="false" AllowPaging="true" OnPageIndexChanging="gvMessage_PageIndexChanging" PageSize="5">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table class="Table" cellpadding="3" cellspacing="0">
                                        <tr>
                                            <td>作者：<a href='mailto:<%# Eval("Email") %>>'><%#Eval("Email") %></a>
                                                于[<%# Eval("IP") %>]、[<%#Eval("CreateDate") %>]留言
                                            </td>
                                        </tr>
                                        <tr><td><hr size="1" /></td></tr>
                                        <tr><td class="Title"><%#Eval("Message") %></td></tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Mode="NumericFirstLast" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </table>
            
    </form>
</body>
</html>
