<%@ Page Title="" Language="C#" MasterPageFile="~/SuperAdmin/SuperMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="SuperAdmin_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>SuperAdmin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--main-container-part-->
    <div id="content">
        <!--breadcrumbs-->
        <div id="content-header">
            <br />
            <h1 style="text-align:center">Welcome Admin</h1>
        </div>
        <!--End-breadcrumbs-->
        
        <!--Action boxes-->
        <div class="container-fluid">
            <hr />
            <div class="span7">
            <div class="quick-actions_homepage">
                <ul class="quick-actions">
                    <li class="bg_lb span4"><a href="Register.aspx"><i class="icon-group"></i><strong><asp:Label ID="cntUsers" runat="server"></asp:Label></strong><br /><small>Total Users</small></a></li>
                    <li class="bg_lg span3"><a href="Register.aspx"><i class="icon-dashboard"></i><strong><asp:Label ID="cntEnable" runat="server"></asp:Label></strong><br /><small>Active Users</small></a></li>
                    <li class="bg_ly span6"><a href="SuperMessage.aspx"><i class="icon-envelope-alt"></i><strong><asp:Label ID="cntMessage" runat="server"></asp:Label></strong><br /><small>Unread Messages</small></a></li>
                    <li class="bg_lr span4"><a href="StateTable.aspx"><i class="icon-sitemap"></i><strong><asp:Label ID="cntState" runat="server"></asp:Label></strong><br /><small>Total States</small></a></li>
                    <li class="bg_lo span3"><a href="City.aspx"><i class="icon-map-marker"></i><strong><asp:Label ID="cntCity" runat="server"></asp:Label></strong><br /><small>Total Cities</small></a></li>
                </ul>
            </div>
                </div>
            <!--End-Action boxes-->
            <div class="row-fluid">
                <div class="span5">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Change Password</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div class="control-group">
                                <asp:Label ID="Label8" runat="server" Text="Current Password" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtCP" TextMode="Password" runat="server" placeholder="Enter Current Password" ValidationGroup="h"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="Label9" runat="server" Text="New Password" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtNP" runat="server" TextMode="Password" placeholder="Enter New Password" ValidationGroup="h"></asp:TextBox>
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="Label10" runat="server" Text="Confirm Password" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtCNP" runat="server" TextMode="Password" placeholder="Confirm New Password" ValidationGroup="h"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCNP" ErrorMessage="Didnt Match" Display="Dynamic" ControlToCompare="txtNP"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="form-actions">
                                <asp:Button ID="btnChangePassword" runat="server" Text="Change" CssClass="btn btn-warning" ValidationGroup="h" OnClick="btnChangePassword_Click" />
                                <asp:Label ID="lblChange" Visible="false" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </asp:Content>