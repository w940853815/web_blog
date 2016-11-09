<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Guanli.aspx.cs" Inherits="web_blog.BoardManage" StylesheetTheme="mm" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
            <tr>
                <td colspan="2">
                    <asp:UpdatePanel runat="server" ID="up">
                        <ContentTemplate>
                            <asp:GridView ID="gvMessage" runat="server" Width="100%" AutoGenerateColumns="false" SkinID="mm" ShowHeader="false" AllowPaging="true" OnPageIndexChanging="gvMessage_PageIndexChanging" PageSize="5" OnRowDataBound="gvMessage_RowDataBound" OnRowCommand="gvMessage_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table class="Table" cellpadding="3" cellspacing="0">
                                                <tr>
                                                    <td>作者:<a href='mailto:<%# Eval("Email") %>>'><%# Eval("Email") %></a>
                                                        于[<%# Eval("IP") %>]、[<%# Eval("CreateDate") %>>]留言
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button ID="btnDelete" CommandArgument='<%# Eval("ID") %>' CommandName="del" runat="server" Text="删除该留言" CssClass="Button" CausesValidation="false" />
                                                    </td>
                                                </tr>
                                                <tr><td colspan="2"><hr size="1" /></td></tr>
                                                <tr><td colspan="2" class="Title"><%# Eval("Title") %>></td></tr>
                                                <tr><td colspan="2"><%# Eval("Message") %>></td></tr>                                             
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
</body>
</html>
