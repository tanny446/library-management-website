<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="content">
         <div class="col-lg-5 col-md-6 col-sm-6 col-xs-12">
        <div class="registrationform">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Registration Form <i class="fa fa-pencil pull-right"></i></legend>
                    <div class="control-group">
                        <asp:Label ID="Label6" runat="server" Text="Name" CssClass="col-lg-2 control-label">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Style="color: #FF3300" ControlToValidate="txtName" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                        </asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="form-control" ValidationGroup="g"></asp:TextBox>
                        </div>
                        <asp:Label ID="Label4" runat="server" Text="MobileNo" CssClass="col-lg-2 control-label">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Style="color: #FF3300" ControlToValidate="txtMobNo" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                        </asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtMobNo" placeholder="MobileNo" runat="server" CssClass="form-control" ValidationGroup="g"></asp:TextBox>
                            <%--<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers" TargetControlID="txtMobNo" Enabled="True"></cc1:FilteredTextBoxExtender>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Email" CssClass="col-lg-2 control-label">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Style="color: #FF3300" ControlToValidate="txtEmail" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                        </asp:Label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txtEmail" placeholder="Email" runat="server" CssClass="form-control" ValidationGroup="g"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Password" CssClass="col-lg-2 control-label">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Style="color: #FF3300" ControlToValidate="txtPW" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                        </asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtPW" runat="server" placeholder="Password" CssClass="form-control" ValidationGroup="g" TextMode="Password"></asp:TextBox>
                        </div>
                        <asp:Label ID="Label8" runat="server" Text="Confirm Password" CssClass="col-lg-2 control-label">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Style="color: #FF3300" ControlToValidate="txtCP" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                        </asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtCP" runat="server" placeholder="Confirm Password" CssClass="form-control" ValidationGroup="g"
                                TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    
                    
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Address" CssClass="col-lg-2 control-label" ValidationGroup="g">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Style="color: #FF3300" ControlToValidate="txtAddress" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control" ValidationGroup="g"></asp:TextBox>
                                </div>
                                <asp:Label ID="Label5" runat="server" Text="State" CssClass="col-lg-2 control-label" ValidationGroup="g">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Style="color: #FF3300" ControlToValidate="ddState" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-lg-4">
                                    <asp:DropDownList ID="ddState" runat="server" CssClass="form-control ddl" AutoPostBack="True" ValidationGroup="g">
                                    </asp:DropDownList>
                                </div>
                                <br />
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="City" CssClass="col-lg-2 control-label" ValidationGroup="g">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Style="color: #FF3300" ControlToValidate="ddCity" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-lg-4">
                                    <asp:DropDownList ID="ddCity" runat="server" CssClass="form-control ddl" AutoPostBack="True" ValidationGroup="g">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        

                    <div class="form-group">
                        <asp:Label ID="Label11" runat="server" Text="Organisation Name" CssClass="col-lg-2 control-label">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Style="color: #FF3300" ControlToValidate="txtOName" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                        </asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtOName" runat="server" placeholder="OrganisationName" CssClass="form-control" ValidationGroup="g"></asp:TextBox>
                        </div>
                        <asp:Label ID="Label10" runat="server" Text="Organisation Type" CssClass="col-lg-2 control-label">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Style="color: #FF3300" ValidationGroup="g" ControlToValidate="ddOType" Text="**" Display="Dynamic"></asp:RequiredFieldValidator>
                        </asp:Label>
                        <div class="col-lg-4">
                            <asp:DropDownList ID="ddOType" runat="server" CssClass="form-control ddl" ValidationGroup="g">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblResult" runat="server" CssClass="col-lg-2 control-label" Visible="false"></asp:Label>
                        <div class="col-lg-4 col-lg-offset-3">
                            <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-primary" Text="SignUp" ValidationGroup="g"/>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
         </div>
</asp:Content>

