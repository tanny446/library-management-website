<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Return.aspx.cs" Inherits="Admin_Return" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Return</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="content">
        <div id="content-header">
            <br />
            <h1>Return</h1>
        </div>
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
            <hr />
            <div class="row-fluid">
                
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-undo"></i></span>
                            <h5>Return Book</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div class="control-group">
                                <asp:Label ID="Label7" runat="server" Text="Student Roll No" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                    <asp:TextBox ID="txtRollNo" MaxLength="10" runat="server" placeholder="Student's Roll No" ValidationGroup="g"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRollNo" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtRollNo" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                                    <asp:Button ID="ViewInfo" runat="server" CssClass="btn btn-info" ValidationGroup="g" Text="View Details" OnClick="ViewInfo_Click" />
                                    <asp:Button ID="Button1" CssClass="hidden" runat="server" Enabled="false" />
                                    <asp:Button ID="Button2" CssClass="hidden" runat="server" Enabled="false" />
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="cl" TargetControlID="Button2" PopupControlID="Panel1" BackgroundCssClass="modal-backdrop"></cc1:ModalPopupExtender>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" CancelControlID="cl2" TargetControlID="Button1" PopupControlID="Panel2" BackgroundCssClass="modal-backdrop"></cc1:ModalPopupExtender>
                                    
                                    <asp:Panel ID="Panel1" runat="server">
                                        <div class="modal">
                                            <div class="modal-header">
                                                <span class="icon" style="float:right;padding-top:5px"><i class="icon-remove btn btn-danger" id="cl"></i></span>
                                                <h3>Error</h3>
                                                </div>
                                            <div class="modal-body">
                                                No book issued by provided Roll No  
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel2" runat="server">
                                        
                                            <div class="modal">
                                                <div class="modal-header">
                                                    <span class="icon" style="float:right;padding-top:5px"><i class="icon-remove btn btn-danger" id="cl2"></i></span>
                                                    <h3>Student Info</h3>
                                                </div>
                                                <asp:Panel ID="pnlStudentInfo" runat="server" Visible="false">
                                                <div class="modal-body">
                                                    <span style="float: left">
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Name:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblStudentName" runat="server" Font-Size="16px"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Email:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblEmail" runat="server" Font-Size="16px"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Mobile No:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblMobileNo" runat="server" Font-Size="16px"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Address:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblAddress" runat="server" Font-Size="16px"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Programme:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblProgramme" runat="server" Font-Size="16px"></asp:Label>
                                                    </span>
                                                    <span style="float: right">
                                                        <asp:Image ID="imgStudent" runat="server" Height="180px" Width="130px" />
                                                    </span>
                                                </div>
                                                    </asp:Panel>
                                        <asp:Panel ID="pnlStudentError" runat="server" Visible="false">
                                                <div class="modal-body">
                                                    No student present of provided Roll No
                                                </div>
                                            </asp:Panel>
                                            </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="form-actions">
                                <asp:Button ID="btnSave" runat="server" Text="Submit"  ValidationGroup="g" CssClass="btn btn-success" OnClick="btnSave_Click" />
                                <asp:Label ID="lblSave" runat="server" Visible="false" Font-Size="14px"></asp:Label>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="widget-box">
                    <asp:Panel ID="Panel3" runat="server" Visible="false">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Issued Books</h5>
                        </div>
                        </asp:Panel>
                <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" AutoGenerateColumns="false" runat="server" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="BookISBN">
                    <Columns>
                        <asp:TemplateField HeaderStyle-BackColor="#efefef">
                            <HeaderTemplate>SNo</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSNo" runat="server" Text='<%#Eval("sn") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-BackColor="#efefef">
                            <HeaderTemplate>Book's Name</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Literal ID="ltBookISBN" runat="server" Text='<%#Eval("BookName") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-BackColor="#efefef">
                            <HeaderTemplate>Date Of Issue</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Literal ID="ltDOF" runat="server" Text='<%#Eval("DateOfIssue") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-BackColor="#efefef">
                            <HeaderTemplate>Date Of Expiry</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Literal ID="ltDOE" runat="server" Text='<%#Eval("DateOfExpiry") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-BackColor="#efefef">
                            <HeaderTemplate>Penalty</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Literal ID="ltPenalty" runat="server" Text='<%#Eval("Penalty") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-BackColor="#efefef">
                            <HeaderTemplate>Action</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" CssClass="btn btn-primary" runat="server" Text="Return" CommandName="Delete" OnClientClick="return confirm('Are U Sure');" CommandArgument='<%#Eval("BookISBN") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                    </div>
            </div>
        </div>

    </div>
</asp:Content>



