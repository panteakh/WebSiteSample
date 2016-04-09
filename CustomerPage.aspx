<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerPage.aspx.cs" Inherits="CustomerPage" Title="Untitled Page" %>

<%--<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>--%>

<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Manage Roles</h2>
    <p>
        
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        
    <asp:GridView ID="gvCustomer" runat="server" AutoGenerateColumns="False" ShowFooter="True" 
                        CssClass="grid" OnRowCommand="gvCustomer_RowCommand"
        DataKeyNames="CustomerID" CellPadding="4" ForeColor="#333333"
                        GridLines="None" OnRowCancelingEdit="gvCustomer_RowCancelingEdit"
                        OnRowEditing="gvCustomer_RowEditing"
        OnRowUpdating="gvCustomer_RowUpdating"
        
        onrowdeleting="gvCustomer_RowDeleting" >

                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Update" CommandName="Edit" ToolTip="Edit" 
                                        CommandArgument=''></asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                                        ToolTip="Delete" OnClientClick='return confirm("Are you sure you want to delete this entry?");'
                                        CommandArgument=''></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkInsert" runat="server" Text="Update" ValidationGroup="editGrp" CommandName="Update" ToolTip="Save"
                                        CommandArgument=''></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" ToolTip="Cancel"
                                        CommandArgument=''></asp:LinkButton>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="lnkInsert" runat="server" Text="Insert"  ValidationGroup="newGrp" CommandName="InsertNew" ToolTip="Add New Entry"
                                        CommandArgument=''></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="CancelNew" ToolTip="Cancel"
                                        CommandArgument=''></asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>

                           <%-- <asp:TemplateField HeaderText="Customer ID">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCustomerID" runat="server" Text='<%# Bind("CustomerID") %>' CssClass="" MaxLength="30"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valCustomerID" runat="server" ControlToValidate="txtCustomerID"
                                    Display="Dynamic" ErrorMessage="CustomerID is required." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="editGrp">*</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCustomerID" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <asp:TextBox ID="txtCustomerIDNew" runat="server" CssClass=""  MaxLength="30"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="valCustomerIDNew" runat="server" ControlToValidate="txtCustomerIDNew"
                                    Display="Dynamic" ErrorMessage="CustomerID is required." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="newGrp">*</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>       --%>
                            <asp:TemplateField HeaderText="First Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("Name") %>' CssClass="" MaxLength="30"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valFirstName" runat="server" ControlToValidate="txtFirstName"
                                    Display="Dynamic" ErrorMessage="First Name is required." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="editGrp">*</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <asp:TextBox ID="txtFirstNameNew" runat="server" CssClass=""  MaxLength="30"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="valFirstNameNew" runat="server" ControlToValidate="txtFirstNameNew"
                                    Display="Dynamic" ErrorMessage="First Name is required." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="newGrp">*</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>       
                            <asp:TemplateField HeaderText="Last Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("Family") %>' CssClass="" MaxLength="30"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="valLastName" runat="server" ControlToValidate="txtLastName"
                                    Display="Dynamic" ErrorMessage="Last Name is required." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="editGrp">*</asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("Family") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                   <asp:TextBox ID="txtLastNameNew" runat="server" CssClass=""   MaxLength="30"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="valLastNameNew" runat="server" ControlToValidate="txtLastNameNew"
                                    Display="Dynamic" ErrorMessage="Last Name is required." ForeColor="Red" SetFocusOnError="True"
                                   ValidationGroup="newGrp">*</asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>   
                                                       
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                       
        </asp:GridView>


        <asp:EntityDataSource ID="DSEntity" runat="server" ConnectionString="name=websiteDBSampleEntities" DefaultContainerName="websiteDBSampleEntities" EntitySetName="Customers" EntityTypeFilter="Customer">
        </asp:EntityDataSource>
        <br />
     </p>
 </asp:Content>
