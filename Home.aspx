<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
    
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnLogin">
                
    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
        <div class="registrationform" >
            <div class="form-horizontal">
                <fieldset>
                    <legend>Login <i class="fa fa-unlock-alt pull-right"></i></legend>
                    <div class="form-group">
                        <asp:Label ID="Label7" runat="server" Text="UserName" CssClass="col-lg-3 control-label">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="**" ForeColor="Red" ControlToValidate="txtUN" ValidationGroup="h"></asp:RequiredFieldValidator>
                        </asp:Label>
                        
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtUN" runat="server" MaxLength="13" placeholder="Mobile No" CssClass="form-control" ValidationGroup="h"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" FilterType="Numbers" TargetControlID="txtUN" runat="server"></cc1:FilteredTextBoxExtender>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label12" runat="server" Text="Password" CssClass="col-lg-3 control-label">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="**" ForeColor="Red" ControlToValidate="txtP" ValidationGroup="h"></asp:RequiredFieldValidator>
                        </asp:Label>
                        
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtP" runat="server" MaxLength="10" placeholder="Password" CssClass="form-control" ValidationGroup="h" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-success" ValidationGroup="h" Text="Login" OnClick="btnLogin_Click" />
                            <br />
                            <asp:Label ID="lblLoginResult" runat="server" Visible="false"></asp:Label>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
          
                </asp:Panel>
                  </ContentTemplate>
        </asp:UpdatePanel>
    
    <div class="col-lg-7 col-md-6 col-sm-6 col-xs-12" style="float: right">
        <div class="registrationform">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Sign Up<i class="fa fa-edit pull-right"></i></legend>
                    <div class="form-group">
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
                            <asp:TextBox ID="txtMobNo" placeholder="MobileNo" MaxLength="10" runat="server" CssClass="form-control" ValidationGroup="g"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers" TargetControlID="txtMobNo" Enabled="True"></cc1:FilteredTextBoxExtender>
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
                            <asp:TextBox ID="txtPW" runat="server" MaxLength="10" placeholder="Password" CssClass="form-control" ValidationGroup="g" TextMode="Password"></asp:TextBox>
                        </div>
                        <asp:Label ID="Label8" runat="server" Text="Confirm Password" CssClass="col-lg-2 control-label">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Style="color: #FF3300" ControlToValidate="txtCP" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                        </asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtCP" MaxLength="10" runat="server" placeholder="Confirm Password" CssClass="form-control" ValidationGroup="g"
                                TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    
                    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Address" CssClass="col-lg-2 control-label" ValidationGroup="g">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Style="color: #FF3300" ControlToValidate="txtAddress" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control" ValidationGroup="g"></asp:TextBox>
                                </div>
                                <asp:Label ID="Label5" runat="server" Text="State" CssClass="col-lg-2 control-label" ValidationGroup="g">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" InitialValue="Select" Style="color: #FF3300" ControlToValidate="ddState" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-lg-4">
                                    <asp:DropDownList ID="ddState" runat="server" CssClass="form-control ddl" AutoPostBack="True" ValidationGroup="g" OnSelectedIndexChanged="ddState_SelectedIndexChanged1"></asp:DropDownList>
                                </div>
                                <br />
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="City" CssClass="col-lg-2 control-label" ValidationGroup="g">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Style="color: #FF3300" InitialValue="Select" ControlToValidate="ddCity" Text="**" Display="Dynamic" ValidationGroup="g"></asp:RequiredFieldValidator>
                                </asp:Label>
                                <div class="col-lg-4">
                                    <asp:DropDownList ID="ddCity" runat="server" CssClass="form-control ddl" AutoPostBack="True" ValidationGroup="g">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

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
                            <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-primary" Text="SignUp" ValidationGroup="g"  OnClick="btnSignUp_Click" />
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    
</asp:Content>

