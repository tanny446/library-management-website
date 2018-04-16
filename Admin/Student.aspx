<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Admin_Student" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Student</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="content-header">
            <br />
            <h1>Student</h1>
        </div>
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
            <hr />
            <div class="row-fluid">
                <div class="span8">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-edit"></i></span>
                            <h5>Student Registration</h5>
                            <div style="float: right">
                            </div>
                        </div>
                        <div class="widget-content nopadding">
                            <table>
                                <tr class="form-group">
                                    <td class="form-label">
                                        <asp:Label ID="Label9" runat="server" Text="Roll No" Font-Size="14px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRollNo" runat="server" placeholder="Roll No" ValidationGroup="g" MaxLength="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRollNo" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtRollNo" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                                    </td>
                                    <td class="form-label">
                                        <asp:Label ID="Label8" runat="server" Text="Name" Font-Size="14px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server" placeholder="Name Of Student" ValidationGroup="g"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtName" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="form-group">
                                    <td class="form-label">
                                        <asp:Label ID="Label2" runat="server" Text="Email" Font-Size="14px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" placeholder="E-Mail ID" ValidationGroup="g"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" Text="**" ForeColor="Red" ValidationGroup="g" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                    <td class="form-label">
                                        <asp:Label ID="Label3" runat="server" Text="Mobile No" Font-Size="14px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMobileNo" runat="server" placeholder="Mobile No" MaxLength="13" ValidationGroup="g"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtMobileNo" ValidChars="+0123456789"></cc1:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr class="form-group">
                                    <td class="form-label">
                                        <asp:Label ID="Label4" runat="server" Text="Address" Font-Size="14px"></asp:Label>
                                    </td>
                                    <td style="padding: 10px 0" colspan="3">
                                        <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" ValidationGroup="g" Width="570px" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="form-group">
                                    <td class="form-label">
                                        <asp:Label ID="Label5" runat="server" Text="Programme" Font-Size="14px"></asp:Label>
                                    </td>
                                    <td class="form-text">
                                        <asp:DropDownList ID="ddProgramme" runat="server" CssClass=" dropdown"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddProgramme" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="form-label">
                                        <asp:Label ID="Label7" runat="server" Text="Photo" Font-Size="14px"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            <div class="form-actions">
                                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="g" CssClass="btn btn-success" OnClick="btnSave_Click" />
                                <asp:Label ID="lblSave" runat="server" Visible="false" Font-Size="14px"></asp:Label>
                                <hr />
                                <h4>Or Upload a Excel File</h4>
                                <br />
                                <asp:FileUpload ID="flupload" runat="server" />
                                <asp:Button ID="btnUploadExcel" CssClass="btn btn-info" runat="server" Text="Upload" OnClick="btnUploadExcel_Click" OnClientClick="return confirm('Are you sure the File is in Correct Format')" />
                                <a target="_blank" style="float:right;font-size:15px;color:red;" href="img/Student.xlsx">**Please Ensure this Excel Format before Uploading**</a>
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
                                        <asp:Label ID="Label11" runat="server" Text="Roll No" Font-Size="14px"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtRollNoSearch" Display="Dynamic" ValidationGroup="h" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtRollNoSearch" runat="server" MaxLength="10" placeholder="Search via Roll No" ValidationGroup="h"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtRollNoSearch" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnRollNoSearch" runat="server" Text="Search" CssClass="btn btn-warning" ValidationGroup="h" OnClick="btnRollNoSearch_Click" />
                                    </td>
                                </tr>
                                <tr class="form-group">
                                    <td class="form-label-small">
                                        <asp:Label ID="Label12" runat="server" Text="Name" Font-Size="14px"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtSearchName" Display="Dynamic" ValidationGroup="k" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSearchName" runat="server" placeholder="Search via Name" ValidationGroup="k"></asp:TextBox>

                                    </td>
                                    <td>
                                        <asp:Button ID="btnNameSearch" runat="server" Text="Search" CssClass="btn btn-warning" ValidationGroup="k" OnClick="btnNameSearch_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <div class="widget-box">
                            <div class="widget-title">
                                <span class="icon"><i class="icon-align-justify"></i></span>
                                <h5>Students</h5>
                                <span style="float: right; margin: 3px">
                                    <asp:Button ID="btnReload" CssClass="btn btn-inverse" runat="server" Text="Reload" OnClick="btnReload_Click" />
                                </span>
                            </div>
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" PagerStyle-CssClass="pagination alternate" AutoGenerateColumns="false" runat="server" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="4" OnRowEditing="GridView1_RowEditing" DataKeyNames="StudentID" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                                <Columns>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>SNo</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Eval("sn") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Roll No</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltRollNo" runat="server" Text='<%#Eval("RollNo") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Name</HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltName" runat="server" Text='<%#Eval("Name") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>E-Mail</HeaderTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditEmail" runat="server" CssClass="span8" Text='<%#Eval("Email") %>' ValidationGroup="h"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEditEmail" Display="Dynamic" ValidationGroup="h" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEditEmail" Display="Dynamic" Text="**" ForeColor="Red" ValidationGroup="h" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Mobile No</HeaderTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditMobileNo" runat="server" Text='<%#Eval("MobileNo") %>' MaxLength="10" CssClass="span8" ValidationGroup="h"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEditMobileNo" Display="Dynamic" ValidationGroup="h" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtEditMobileNo" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltMobileNo" runat="server" Text='<%#Eval("MobileNo") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Address</HeaderTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditAddress" runat="server" CssClass="span5" Text='<%#Eval("Address") %>' ValidationGroup="h"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtEditAddress" Display="Dynamic" ValidationGroup="h" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>

                                        <ItemTemplate>
                                            <asp:Literal ID="ltAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">
                                        <HeaderTemplate>Programme</HeaderTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEditProgramme" runat="server" CssClass="span4" Text='<%#Eval("Programme") %>' ValidationGroup="h"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtEditProgramme" Display="Dynamic" ValidationGroup="h" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltProgramme" runat="server" Text='<%#Eval("Programme") %>'></asp:Literal>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-BackColor="#efefef">

                                        <HeaderTemplate>Actions</HeaderTemplate>
                                        <EditItemTemplate>
                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-primary" CommandArgument='<%#Eval("StudentID") %>' />

                                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-warning" Text="Cancel" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Button ID="btnEdit" runat="server" CommandArgument='<%#Eval("StudentID") %>' CssClass="btn btn-info" CommandName="Edit" Text="Edit" />
                                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('Are U Sure');" CommandArgument='<%#Eval("StudentID") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>


    </div>
</asp:Content>


<%--www.businesssms.co.in--%>
