<%@ Page Title="" Language="C#" MasterPageFile="~/SuperAdmin/SuperMasterPage.master" AutoEventWireup="true" CodeFile="StateTable.aspx.cs" Inherits="SuperAdmin_StateTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>States</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="content-header">
            <br />
            <h1>States</h1>
        </div>
        <div class="container-fluid">
            <hr />
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-map-marker"></i></span>
                            <h5>States</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <asp:TextBox ID="txtState" runat="server" placeholder="Enter State to Add"></asp:TextBox>
                            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
                            
                        </div>
                        <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound" runat="server" CellPadding="4" OnRowCommand="GridView1_RowCommand1" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" ShowFooter="True">
                            <Columns>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>SNo</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSNo" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>State Name</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltStateName" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                   <FooterTemplate>
                                       <asp:TextBox ID="txtStateName1" runat="server"></asp:TextBox>
                                   </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Actions</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="btnAdd1" runat="server" CssClass="btn btn-success" CommandName="AddNew" Text="AddNew" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="lblDelete" Text="Delete City First" ForeColor="Red" Font-Size="14px" Visible="false" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

