<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Admin_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--main-container-part-->
    <div id="content">
        <!--breadcrumbs-->
        <div id="content-header">
            <br />
            <h1 style="text-align:center">
                Welcome <asp:Label ID="lblWelcome" runat="server"></asp:Label></h1>
        </div>
        <!--End-breadcrumbs-->

        <!--Action boxes-->
        <div class="container-fluid">
            <!--Chart-box-->
            <div class="row-fluid">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="icon-user"></i></span>
                        <h5>My Profile</h5>
                    </div>
                    <div class="widget-content">
                        <div class="row-fluid">
                            <div class="span1"></div>
                            <div class="span6">
                                <asp:Panel ID="pnlInfo" runat="server">
                                    <div class="control-group">
                                        <asp:Label ID="Label3" runat="server" Text="Organisation Name" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblOName" runat="server" Font-Size="16px"></asp:Label>
                                        </div>
                                        <asp:Label ID="Label1" runat="server" Text="E-Mail" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblEmail" runat="server" Font-Size="16px"></asp:Label>
                                        </div>
                                        <asp:Label ID="Label4" runat="server" Text="Mobile No" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblMobileNo" runat="server" Font-Size="16px"></asp:Label>
                                        </div>
                                        <asp:Label ID="Label6" runat="server" Text="Address" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblAddress" runat="server" Font-Size="16px"></asp:Label>

                                        </div>
                                        <asp:Label ID="Label8" runat="server" Text="City" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblCity" runat="server" Font-Size="16px"></asp:Label>

                                        </div>
                                        <asp:Label ID="Label10" runat="server" Text="State" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblState" runat="server" Font-Size="16px"></asp:Label>

                                        </div>
                                        <asp:Label ID="Label12" runat="server" Text="Organisation Type" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblOType" runat="server" Font-Size="16px"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-info" OnClick="btnEdit_Click" />
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlText" runat="server" Visible="false">
                                    <div class="control-group">
                                        <asp:Label ID="Label2" runat="server" Text="Organisation Name" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtOName" runat="server" ValidationGroup="g"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtOName" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Label ID="Label7" runat="server" Text="E-Mail" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtEmail" runat="server" ValidationGroup="g"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Label ID="Label11" runat="server" Text="Mobile No" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="13" ValidationGroup="g"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Label ID="Label14" runat="server" Text="Address" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtAddress" runat="server" ValidationGroup="g" TextMode="MultiLine"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Label ID="Label16" runat="server" Text="City" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtCity" runat="server" ValidationGroup="g"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCity" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Label ID="Label18" runat="server" Text="State" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtState" runat="server" ValidationGroup="g"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtState" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Label ID="Label20" runat="server" Text="Password" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtPassword" runat="server" ValidationGroup="g" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ValidationGroup="g" Text="Please Enter Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="g" CssClass="btn btn-success" OnClick="btnSave_Click" />
                                        <asp:Label ID="lblSave" runat="server" Visible="false" ForeColor="Red" Font-Size="14px"></asp:Label>
                                    </div>
                                </asp:Panel>

                            </div>
                            <div class="span4">
                                <ul class="site-stats">
                                    <li class="bg_lh"><a href="Message.aspx" class="anew"><i class="icon-envelope-alt"></i><strong>
                                        <asp:Label ID="cntMessages" runat="server"></asp:Label></strong><small>Unread Messages</small></a></li>
                                    <li class="bg_lh"><a href="Student.aspx" class="anew"><i class="icon-user"></i><strong>
                                        <asp:Label ID="cntStudents" runat="server"></asp:Label></strong> <small>Total Users</small></a></li>
                                    <li class="bg_lh"><a href="Book.aspx" class="anew"><i class="icon-book"></i><strong>
                                        <asp:Label ID="cntBooks" runat="server"></asp:Label></strong> <small>Total Books</small></a></li>
                                    <li class="bg_lh"><a href="Issue.aspx" class="anew"><i class="icon-inbox"></i><strong>
                                        <asp:Label ID="cntIssue" runat="server"></asp:Label></strong> <small>Books Issued</small></a></li>
                                    <li class="bg_lh"><a href="Issue.aspx" class="anew"><i class="icon-repeat"></i><strong>Rs.
                                        <asp:Label ID="cntPenalty" runat="server"></asp:Label></strong> <small>Pending Penalty Amount</small></a></li>
                                    <%--<li class="bg_lh"><i class="icon-globe"></i><strong>8540</strong> <small>Online Orders</small></li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End-Chart-box-->
        </div>
    </div>

    <!--end-main-container-part-->
</asp:Content>



