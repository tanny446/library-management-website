<%@ Page Title="" Language="C#" MasterPageFile="~/SuperAdmin/SuperMasterPage.master" AutoEventWireup="true" CodeFile="City.aspx.cs" Inherits="SuperAdmin_City" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>City</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="content-header">
            <br />
            <h1>Cities</h1>
        </div>
        <div class="container-fluid">
            <hr />
            <div class="row-fluid">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-map-marker"></i></span>
                            <h5>Cities</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <asp:TextBox ID="txtAddCity" runat="server" placeholder="Enter City"></asp:TextBox>
                            <asp:DropDownList ID="ddAddState" runat="server"></asp:DropDownList>
                            
                            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
                            
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-warning" Visible="false" OnClick="btnUpdate_Click" />
                            <asp:Label ID="Label1" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                            <br />
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:Button ID="btnSort" runat="server" Text="SortByState" CssClass="btn btn-info" OnClick="btnSort_Click" />
                            <br />
                            <asp:TextBox ID="txtSearchCity" runat="server" placeholder="Search City"></asp:TextBox>
                            <asp:Button ID="btnSearch" CssClass="btn btn-inverse" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </div>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" CellPadding="3" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" BackColor="White" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10" OnRowDeleting="GridView1_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>SNo</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblsno" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>City Name</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltcityname" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>State Name</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Literal ID="ltstatename" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                    <HeaderTemplate>Actions</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-warning" Text="Edit" CommandName="Edit" />
                                        <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
            </div>
        </div>
    </div>
</asp:Content>

