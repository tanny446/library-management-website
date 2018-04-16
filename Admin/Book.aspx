<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Book.aspx.cs" Inherits="Admin_Book" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Books</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="content-header">
            <br />
            <h1>Books</h1>
        </div>
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
            <hr />
            <div class="row-fluid">

                <div class="span8">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-edit"></i></span>
                            <h5>Book Registration</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr class="form-group">
                                            <td class="form-label">
                                                <asp:Label ID="Label6" runat="server" Text="ISBN" Font-Size="14px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtISBN" runat="server" placeholder="ISBN"  ValidationGroup="g" MaxLength="10" TabIndex="1"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtISBN" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtISBN" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                                            </td>
                                            <td class="form-label">
                                                <asp:Label ID="Label1" runat="server" Text="Book Name" Font-Size="14px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtBookName" runat="server" placeholder="BookName" ValidationGroup="g" TabIndex="2"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBookName" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="form-group">
                                            <td class="form-label">
                                                <asp:Label ID="Label2" runat="server" Text="Book Author" Font-Size="14px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtBookAuthor" runat="server" placeholder="Book Author" ValidationGroup="g" TabIndex="3"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBookAuthor" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="form-label">
                                                <asp:Label ID="Label3" runat="server" Text="Book Edition" Font-Size="14px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtBookEdition" runat="server" placeholder="Numbers only" MaxLength="5" ValidationGroup="g" TabIndex="4"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBookEdition" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtBookEdition" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr class="form-group">
                                            <td class="form-label">
                                                <asp:Label ID="Label7" runat="server" Text="Category" Font-Size="14px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddCategory" runat="server" OnSelectedIndexChanged="ddCategory_SelectedIndexChanged" CssClass="dropdown" AutoPostBack="True" TabIndex="5"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddCategory" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="form-label">
                                                <asp:Label ID="Label8" runat="server" Text="Sub Category" Font-Size="14px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddSubCategory" runat="server" CssClass="dropdown" AutoPostBack="True" OnSelectedIndexChanged="ddSubCategory_SelectedIndexChanged" TabIndex="6"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddSubCategory" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red" InitialValue="Select Category"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="form-group">
                                            <td class="form-label">
                                                <asp:Label ID="Label9" runat="server" Text="Rack Name" Font-Size="14px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddRackName" runat="server" CssClass="dropdown" TabIndex="7"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddRackName" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="form-label">
                                                <asp:Label ID="Label10" runat="server" Text="Rack No" Font-Size="14px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddRackNo" runat="server" CssClass="dropdown" TabIndex="8">
                                                    <asp:ListItem>1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                    <asp:ListItem>4</asp:ListItem>
                                                    <asp:ListItem>5</asp:ListItem>
                                                    <asp:ListItem>6</asp:ListItem>
                                                    <asp:ListItem>7</asp:ListItem>
                                                    <asp:ListItem>8</asp:ListItem>
                                                    <asp:ListItem>9</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddRackNo" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red" InitialValue="1"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr class="form-group">
                                            <td class="form-label">
                                                <asp:Label ID="Label5" runat="server" Text="No Of Copies" Font-Size="14px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtNoOfCopies" runat="server" placeholder="No Of Copies" MaxLength="4" ValidationGroup="g" TabIndex="9"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtNoOfCopies" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNoOfCopies" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="form-label">
                                                <asp:Label ID="Label4" runat="server" Text="Image" Font-Size="14px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:FileUpload ID="FileUpload1" runat="server" TabIndex="10" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="form-actions">
                                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="g" CssClass="btn btn-success" OnClick="btnSave_Click" TabIndex="11" />
                                <asp:Label ID="lblSave" runat="server" Visible="false" Font-Size="14px"></asp:Label>
                            </div>

                        </div>


                    </div>
                </div>
                <div class="span4">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-search"></i></span>
                            <h5>Search</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <table>
                                <tr class="form-group">
                                    <td class="form-label-small">
                                        <asp:Label ID="Label11" runat="server" Text="Book" Font-Size="14px"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtNameSearch" Display="Dynamic" ValidationGroup="h" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNameSearch" runat="server" placeholder="Search via Book Name" ValidationGroup="h"></asp:TextBox>

                                    </td>
                                    <td>
                                        <asp:Button ID="btnNameSearch" runat="server" Text="Search" CssClass="btn btn-warning" ValidationGroup="h" OnClick="btnNameSearch_Click" />
                                    </td>
                                </tr>
                                <tr class="form-group">
                                    <td class="form-label-small">
                                        <asp:Label ID="Label12" runat="server" Text="Category" Font-Size="14px"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCategorySearch" Display="Dynamic" ValidationGroup="k" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCategorySearch" runat="server" placeholder="Search via Category" ValidationGroup="k"></asp:TextBox>

                                    </td>
                                    <td>
                                        <asp:Button ID="btnCategorySearch" runat="server" Text="Search" CssClass="btn btn-warning" ValidationGroup="k" OnClick="btnCategorySearch_Click" />
                                    </td>
                                </tr>
                                <tr class="form-group">
                                    <td class="form-label-small">
                                        <asp:Label ID="Label13" runat="server" Text="Rack Name" Font-Size="14px"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtRackNameSearch" Display="Dynamic" ValidationGroup="i" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtRackNameSearch" FilterType="UppercaseLetters"></cc1:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRackNameSearch" runat="server" placeholder="Capitals Only" ValidationGroup="i"></asp:TextBox>

                                    </td>
                                    <td>
                                        <asp:Button ID="btnRackNameSearch" runat="server" Text="Search" CssClass="btn btn-warning" ValidationGroup="i" OnClick="btnRackNameSearch_Click"/>
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="widget-box">
                            <div class="widget-title">
                                <span class="icon"><i class="icon-align-justify"></i></span>
                                <h5>Available Books</h5>
                                <span style="float: right; margin: 3px">
                                    <asp:Button ID="btnReload" CssClass="btn btn-inverse" runat="server" Text="Reload" OnClick="btnReload_Click" />
                                </span>
                            </div>
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" AutoGenerateColumns="false" runat="server" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="4" OnRowEditing="GridView1_RowEditing" DataKeyNames="BookID" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                                <Columns>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>SNo</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Eval("sn") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>ISBN</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltISBN" runat="server" Text='<%#Eval("ISBN") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Book Name</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltBookName" runat="server" Text='<%#Eval("BookName") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Book Author</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltBookAuthor" runat="server" Text='<%#Eval("BookAuthor") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Book Edition</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltBookEdition" runat="server" Text='<%#Eval("BookEdition") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Category</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltCategory" runat="server" Text='<%#Eval("Category") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Sub Category</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltSubCategory" runat="server" Text='<%#Eval("SubCategory") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Rack</HeaderTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtRack" runat="server" Text='<%#Eval("Rack") %>' Width="30px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltRack" runat="server" Text='<%#Eval("Rack") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>No Of Copies</HeaderTemplate>
                                        <EditItemTemplate>
                                            <asp:Literal ID="ltNOC" runat="server" Text='<%#Eval("NoOfCopies") %>'></asp:Literal>
                                            +
                                        <asp:TextBox ID="txtNOC" runat="server" MaxLength="3" Width="20px"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtNOC" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltNOC" runat="server" Text='<%#Eval("NoOfCopies") %>'></asp:Literal>
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Available Copies</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltPresentCopies" runat="server" Text='<%#Eval("PresentCopies") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Image</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="imgBook" runat="server" Width="50px" Height="50px" ImageUrl='<%#Eval("BookImage","BookImages/{0}")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">

                                        <HeaderTemplate>Actions</HeaderTemplate>
                                        <EditItemTemplate>
                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-primary" CommandArgument='<%#Eval("BookID") %>' />
                                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-warning" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Button ID="btnEdit" runat="server" CommandArgument='<%#Eval("BookID") %>' CommandName="Edit" Text="Edit" CssClass="btn btn-info" />
                                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("BookID") %>' CssClass="btn btn-danger" OnClientClick="return confirm('Are U Sure');" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>
        <script>
            function Confm() {
                alert("Are");
            }
        </script>
    </div>
</asp:Content>

