<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Search</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
    <asp:Panel ID="pnlSearch" runat="server" >
    <div class="col-lg-8 col-md-20 col-sm-20 col-xs-20" style="margin:100px">
        <div class="registrationform">
            <div class="form-horizontal">
                <fieldset>
                    <%--<legend>Search <i class="fa fa-search pull-right"></i></legend>--%>
                    <div class="form-group">
                        <div class="col-lg-8 col-lg-offset-2">
                            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Book" CssClass="form-control" ValidationGroup="i"></asp:TextBox>
                            <cc1:AutoCompleteExtender MinimumPrefixLength="2" CompletionInterval="100" EnableCaching="false" CompletionSetCount="10" TargetControlID="txtSearch" ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false" ServiceMethod="SearchBook">
                            </cc1:AutoCompleteExtender>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-8">
                            
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-warning" ValidationGroup="i" Text="Search" OnClick="btnSearch_Click" />
                            <asp:Label ID="lblSearch" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
        </asp:Panel>
    
    <asp:Panel ID="pnlOName" runat="server" Visible="false">
    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
        <div class="registrationform">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Available At<i class="fa fa-bookmark-o pull-right"></i></legend>
                        <asp:GridView ID="GridView1" BorderStyle="None" GridLines="None" DataKeyNames="ID" AutoGenerateColumns="false" runat="server" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <asp:Button ID="btnOName" CssClass="btn btn-lg btn-link" ForeColor="#00ffff" CommandArgument='<%#Eval("ID") %>' CommandName="Click" runat="server" Text='<%#Eval("OrganisationName") %>'></asp:Button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                </Columns>
                        </asp:GridView>
                </fieldset>
            </div>
        </div>
    </div>
        </asp:Panel>
    <asp:Panel ID="pnlOInfo" runat="server" Visible="false">
        <div class="col-lg-7 col-md-6 col-sm-6 col-xs-12" style="float: right">
        <div class="registrationform">
            <div class="form-horizontal">
                <fieldset>
                    <legend><asp:Label ID="lblHeading" runat="server"></asp:Label><i class="fa fa-book pull-right"></i></legend>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Font-Size="14px" ForeColor="#ff99cc" Text="Book Edition" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-4">
                            <asp:Label ID="lblEdition" runat="server" CssClass="col-lg-2 control-label"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label16" runat="server" Font-Size="14px" ForeColor="#ff99cc"  Text="Book Author" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-4">
                            <asp:Label ID="lblAuthor" runat="server" CssClass="col-lg-2 control-label"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label12" runat="server" Font-Size="14px" ForeColor="#ff99cc"  Text="Available Copies" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-4">
                            <asp:Label ID="lblAC" runat="server" CssClass="col-lg-2 control-label"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Image ID="img" runat="server" />
                    </div>
                    <hr />
                    <div class="form-group">
                        <asp:Label ID="Label10" runat="server" Font-Size="14px" ForeColor="#ff99cc"  Text="Organisation Name" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-4">
                            <asp:Label ID="lblOName" runat="server" CssClass="col-lg-2 control-label"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label6" runat="server" Font-Size="14px" ForeColor="#ff99cc"  Text="Email-ID" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-4">
                            <asp:Label ID="lblEmail" runat="server" CssClass="col-lg-2 control-label"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Font-Size="14px" ForeColor="#ff99cc"  Text="Mobile No" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-4">
                            <asp:Label ID="lblMobNo" runat="server" CssClass="col-lg-2 control-label"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label8" runat="server" Font-Size="14px" ForeColor="#ff99cc"  Text="Address" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-4">
                            <asp:Label ID="lblAddress" runat="server" CssClass="col-lg-2 control-label"></asp:Label>
                        </div>
                    </div>
                    
                    
                </fieldset>
            </div>
        </div>
    </div>
    </asp:Panel>
</asp:Content>

