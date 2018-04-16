<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Master.aspx.cs" Inherits="Admin_Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Master</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="content-header">
            <br />
            <h1>My Account</h1>
        </div>
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
            <hr />
            <div class="row-fluid">
                
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-briefcase"></i></span>
                            <h5>PreDefined Values</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div class="control-group">
                                <asp:Label ID="Label6" runat="server" Text="Update Rack Name" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtRackName" runat="server" placeholder="Capitals Only (A-Z)" ValidationGroup="g" MaxLength="1"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtRackName" FilterType="UppercaseLetters"></cc1:FilteredTextBoxExtender>

                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="Label5" runat="server" Text="Update Per Day Penalty" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtPenalty" runat="server" placeholder="In Rs." ValidationGroup="g" MaxLength="4"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPenalty" FilterType="Numbers"></cc1:FilteredTextBoxExtender>

                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="Label7" runat="server" Text="Update Expiry Days" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtExpiryDays" runat="server" placeholder="No Of Days" ValidationGroup="g" MaxLength="4"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtExpiryDays" FilterType="Numbers"></cc1:FilteredTextBoxExtender>

                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="Label1" runat="server" Text="Programme" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtProgramme" runat="server" placeholder="Add New Programme" ValidationGroup="g" MaxLength="10"></asp:TextBox>

                                </div>

                            </div>

                            <div class="control-group">
                                <asp:Label ID="Label3" runat="server" Text="Book SubCategory" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtBookSubCategory" runat="server" placeholder="Add New Book SubCategory" ValidationGroup="g"></asp:TextBox>

                                </div>
                                <asp:Panel ID="Panel1" runat="server">
                                    <asp:Label ID="Label4" runat="server" Text="Choose Book Category" Font-Size="14px" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddCategory" runat="server" CssClass="dropdown" AutoPostBack="True" OnSelectedIndexChanged="ddCategory_SelectedIndexChanged">
                                            <asp:ListItem>Select</asp:ListItem>
                                            <asp:ListItem>Add New</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Label ID="lblCategory" runat="server" Visible="false" ForeColor="Red" Text="**" Font-Size="14px"></asp:Label>
                                    </div>
                                </asp:Panel>


                                <asp:Panel ID="Panel2" runat="server" Visible="false">
                                    <asp:Label ID="Label2" runat="server" Text="Book Category" Font-Size="14px" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtBookCategory" runat="server" placeholder="Add New Book Category" ValidationGroup="g"></asp:TextBox>
                                    </div>
                                </asp:Panel>
                            </div>


                            <div class="form-actions">
                                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="g" CssClass="btn btn-success" OnClick="btnSave_Click" />
                                <asp:Label ID="lblSave" Visible="false" runat="server" ForeColor="Red"></asp:Label>
                                <asp:Button ID="btnView" runat="server" Style="float: right" Text="View Values" ValidationGroup="g" CssClass="btn btn-info" OnClick="btnView_Click" />
                                <asp:Button ID="Button1" runat="server" CssClass="hidden" Enabled="false" />
                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button1"  CancelControlID="cl" PopupControlID="Panel3" BackgroundCssClass="modal-backdrop"></cc1:ModalPopupExtender>
                                <asp:Panel ID="Panel3" runat="server">
                                    <div class="modal">
                                        <div class="modal-header">
                                            <span class="icon" style="float:right;padding-top:5px"><i class="icon-remove btn btn-danger" id="cl"></i></span>
                                            <h3>My Library's Info</h3>
                                        </div>
                                        <div class="modal-body">
                                            <span style="float: left">
                                                <p>
                                                    <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Rack Name:&nbsp;&nbsp; </span>
                                                    <asp:Label ID="lblRack" runat="server" Font-Size="16px"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Penalty:&nbsp;&nbsp; </span>
                                                    <asp:Label ID="lblPenalty" runat="server" Font-Size="16px"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Expiry Days:&nbsp;&nbsp; </span>
                                                    <asp:Label ID="lblExpiry" runat="server" Font-Size="16px"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Programme(s):&nbsp;&nbsp; </span>
                                                    <asp:Label ID="lblProgramme" runat="server" Font-Size="16px"></asp:Label>
                                                    <br />
                                                    <br />
                                                </p>
                                            </span>
                                            <div class="row-fluid">
                                                <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" BorderColor="White" AutoGenerateColumns="false" runat="server" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>Serial No</HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Eval("sn") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>Book Category</HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltBookCategory" runat="server" Text='<%#Eval("Category") %>'></asp:Literal>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>Book Sub-Category</HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Literal ID="ltSubCategory" runat="server" Text='<%#Eval("SubCategory") %>'></asp:Literal>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>


                                        </div>
                                    </div>
                                </asp:Panel>

                            </div>

                        </div>


                    </div>
                </div>
                <div class="span5">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-cogs"></i></span>
                            <h5>Change Password</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div class="control-group">
                                <asp:Label ID="Label8" runat="server" Text="Current Password" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtCP" TextMode="Password" runat="server" placeholder="Enter Current Password" ValidationGroup="h"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="h" runat="server" ForeColor="Red" ControlToValidate="txtCP" ErrorMessage="**"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="Label9" runat="server" Text="New Password" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtNP" TextMode="Password" runat="server" placeholder="Enter New Password" ValidationGroup="h"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="h"  ForeColor="Red" ControlToValidate="txtNP" ErrorMessage="**"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="Label10" runat="server" Text="Confirm Password" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtCNP" TextMode="Password" runat="server"  placeholder="Confirm New Password" ValidationGroup="h"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="h"  runat="server" ForeColor="Red" ControlToValidate="txtCNP" ErrorMessage="**"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="h"  ControlToValidate="txtCNP" ErrorMessage="Didnt Match" Display="Dynamic" ControlToCompare="txtNP"></asp:CompareValidator>

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

