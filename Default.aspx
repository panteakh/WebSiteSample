<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:Panel runat="server" ID="AuthenticatedMessagePanel">
        <h1 style="text-align: left"><strong>&nbsp;Home Page.&nbsp;&nbsp;&nbsp; </strong></h1>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label runat="server" ID="WelcomeBackMessage"></asp:Label>
        <p>
            &nbsp;</p>
    </asp:Panel>
    
    <asp:Panel runat="Server" ID="AnonymousMessagePanel">
        <%--<asp:HyperLink runat="server" ID="lnkLogin" Text="Log In" NavigateUrl="~/Login.aspx"></asp:HyperLink>--%>
    </asp:Panel>

    <%--<p><asp:HyperLink runat="server" ID="lnk" NavigateUrl="CustomerPage.aspx" Text="Go To CustomerPage.aspx"></asp:HyperLink></p>--%>
</asp:Content>