<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Issue.aspx.cs" Inherits="Admin_Issue" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Issue</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="content-header">
            <br />
            <h1>Issue</h1>
        </div>
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
            <hr />
            <div class="row-fluid">
                
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-info-sign"></i></span>
                            <h5>Book Issue</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div class="control-group">
                                <asp:Label ID="Label3" runat="server" Text="Book ISBN" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtBookISBN" runat="server" placeholder="Book ISBN" ValidationGroup="g" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBookISBN" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtBookISBN" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                                    <asp:Button ID="btnViewBook" runat="server" CssClass="btn btn-info" Text="View Details" OnClick="btnViewBook_Click" />
                                    <asp:Button ID="Button1" CssClass="hidden" runat="server" Visible="true" BackColor="White" ForeColor="White" BorderColor="White" Enabled="false" />
                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button1" PopupControlID="Panel1" BackgroundCssClass="modal-backdrop"></cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server">
                                         <asp:Panel ID="pnlBookInfo" runat="server" Visible="false">
                                        <div class="modal">
                                            <div class="modal-header">
                                                <asp:Button ID="Button2" style="float:right" runat="server" CssClass="btn btn-danger" Text="×" UseSubmitBehavior="false" data-dismiss="modal" />
                                                <h3>Book Info</h3>
                                            </div>
                                            <div class="modal-body">
                                                <p>
                                                    <span style="float: left">
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Name:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblBookName" runat="server" Font-Size="16px"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Author:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblAuthor" runat="server" Font-Size="16px"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Edition:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblEdition" runat="server" Font-Size="16px"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Category:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblCategory" runat="server" Font-Size="16px"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">SubCategory:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblSubCategory" runat="server" Font-Size="16px"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Rack:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblRack" runat="server" Font-Size="16px"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <span style="margin-left: 30px; float: left; font-size: 18px; font-weight: bold; font-family: 'Book Antiqua'">Available Copies:&nbsp;&nbsp;
                                                        </span>
                                                        <asp:Label ID="lblAvailableCopies" runat="server" Font-Size="16px"></asp:Label>
                                                    </span>
                                                </p>
                                                <span style="float: right;margin-top:10px">
                                                    <asp:Image ID="imgBook" runat="server" Height="230px" Width="150px" />
                                                </span>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                        <asp:Panel ID="pnlBookError" runat="server" Visible="false">
                                            <div class="modal">
                                               <div class="modal-body">
                                                    Not Present
                                                    <asp:Button ID="Button6" runat="server" class="close" Text="×" UseSubmitBehavior="false" data-dismiss="modal" />
                                                </div>
                                            </div>
                                        </asp:Panel>

                                    </asp:Panel>



                                </div>
                            </div>
                            <div class="control-group">
                                <asp:Label ID="Label7" runat="server" Text="Student Roll No" Font-Size="14px" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtRollNo" runat="server" placeholder="Student's Roll No" MaxLength="10" ValidationGroup="g"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRollNo" Display="Dynamic" ValidationGroup="g" Text="**" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtRollNo" FilterType="Numbers"></cc1:FilteredTextBoxExtender>
                                    <asp:Button ID="btnViewStudent" runat="server" CssClass="btn btn-info" Text="View Details" OnClick="btnViewStudent_Click" />
                                    <asp:Button ID="Button4" CssClass="hidden" runat="server" Visible="true" BackColor="White" ForeColor="White" BorderColor="White" Enabled="false" />

                                    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="Button4" PopupControlID="Panel2" BackgroundCssClass="modal-backdrop"></cc1:ModalPopupExtender>
                                    <asp:Panel ID="Panel2" runat="server">
                                        <asp:Panel ID="pnlStudentInfo" runat="server" Visible="false">
                                            <div class="modal">
                                                <div class="modal-header">
                                                    <asp:Button ID="Button3" style="float:right" runat="server" CssClass=" btn btn-danger" Text="×" UseSubmitBehavior="false" data-dismiss="modal" />
                                                    <h3>Student Info</h3>
                                                </div>
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
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlStudentError" runat="server" Visible="false">
                                            <div class="modal">
                                                <div class="modal-body">
                                                    Not Present
                                                    <asp:Button ID="Button5" runat="server" class="close" Text="×" UseSubmitBehavior="false" data-dismiss="modal" />
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </asp:Panel>

                                </div>
                            </div>
                            <div class="form-actions">
                                <asp:Button ID="btnSave" runat="server" Text="Issue" ValidationGroup="g" CssClass="btn btn-success" OnClick="btnSave_Click" />
                                <asp:Label ID="lblSave" runat="server" Visible="false" Font-Size="14px"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Issued Books</h5>
                        </div>
                <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" AutoGenerateColumns="false" runat="server" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="4">
                    <Columns>
                        <asp:TemplateField HeaderStyle-BackColor="#efefef">
                            <HeaderTemplate>SNo</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSNo" runat="server" Text='<%#Eval("sn") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-BackColor="#efefef">
                            <HeaderTemplate>Book's ISBN</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Literal ID="ltBookISBN" runat="server" Text='<%#Eval("BookISBN") %>'></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-BackColor="#efefef">
                            <HeaderTemplate>Student's Roll No</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Literal ID="ltRollNo" runat="server" Text='<%#Eval("StudentRollNo") %>'></asp:Literal>
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
                                <asp:Label ID="lblPenalty" runat="server" Text='<%#Eval("Penalty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                        </div>
            </div>
        </div>

    </div>
</asp:Content>

