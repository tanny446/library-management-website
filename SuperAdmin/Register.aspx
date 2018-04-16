<%@ Page Title="" Language="C#" MasterPageFile="~/SuperAdmin/SuperMasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="SuperAdmin_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Registered Users</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content">
        <div id="content-header">
            <br />
            <h1>Registered Users</h1>
        </div>
        <div class="container-fluid">
            <hr />
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-user"></i></span>
                            <h5>Users</h5>
                            <span style="float:right;padding:3px 100px">
                            <asp:DropDownList ID="DropDownList1" BackColor="#efefef" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem>All</asp:ListItem>
                                <asp:ListItem>Enabled</asp:ListItem>
                                <asp:ListItem>Disabled</asp:ListItem>
                            </asp:DropDownList>
                                </span>
                        </div>
                        <div class="widget-content nopadding">
                            <asp:TextBox ID="txtSearchUser" runat="server" placeholder="Search"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-warning" Text="Search" OnClick="btnSearch_Click"/>
                            </div>
                        <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound" runat="server" CellPadding="4" OnRowCommand="GridView1_RowCommand" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" PageSize="10">
                            <Columns>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>SNo</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSNo" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Name</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltName" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>MobileNo</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltMobNo" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Email</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltEmail" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Password</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltPassword" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>State</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltState" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>City</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltCity" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Locality</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltLocality" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Organisation Name</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltOName" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Organisation Type</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltOType" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Joining Date</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltJoiningDate" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                    </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Is Active</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltIsActive" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Actions</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="btnDisable" runat="server" CssClass="btn btn-danger" Text="Disable" CommandName="Disable" OnClientClick="return confirm('Are U Sure');"/>
                                        <asp:Button ID="btnEnable" runat="server" CssClass="btn btn-success" Text="Enable" CommandName="Enable" OnClientClick="return confirm('Are U Sure');"/>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

