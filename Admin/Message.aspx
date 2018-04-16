<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="Admin_Message" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Messages</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="content-header">
            <br />
            <h1>Messages</h1>
        </div>
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
            <hr />
            <div class="row-fluid">

                <cc1:TabContainer ID="TabContainer1" Enabled="true" runat="server" CssClass="a" ActiveTabIndex="1">
                    <cc1:TabPanel ID="s1" runat="server">
                        <HeaderTemplate>
                            <div class="btn btn-large btn-danger"><i class="icon icon-pencil"></i>&nbsp;Compose</div>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="widget-content tab-content">
                                <div class="widget-box span10">
                                    <h2 style="padding: 0px 20px">Compose New Message</h2>
                                    <div class="widget-content">
                                        <div class="control-group">
                                            <asp:Label ID="Label1" runat="server" Text="To" Font-Size="14px" CssClass="control-label"></asp:Label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddOName" runat="server" CssClass="dropdown span5" ValidationGroup="g"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" Display="Dynamic" ValidationGroup="g" ForeColor="Red" ControlToValidate="ddOName" InitialValue="Select"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <asp:Label ID="Label2" runat="server" Text="Subject" Font-Size="14px" CssClass="control-label"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtSubject" runat="server" ValidationGroup="g" placeholder="Enter Subject" CssClass="span5"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="**" Display="Dynamic" ValidationGroup="g" ForeColor="Red" ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <asp:Label ID="Label3" runat="server" Text="Compose" Font-Size="14px" CssClass="control-label"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtMessage" CssClass="span8" ValidationGroup="g" MaxLength="200" TextMode="MultiLine" placeholder="Enter Your Message Here..." runat="server" Rows="5"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="**" Display="Dynamic" ValidationGroup="g" ForeColor="Red" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <asp:Button ID="Button1" runat="server" Text="Send" ValidationGroup="g" CssClass="btn btn-success" OnClick="Button1_Click" />
                                            <asp:Label ID="lblSend" runat="server" Visible="false" ForeColor="Green"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="s2" runat="server">
                        <HeaderTemplate>
                            <div class="btn btn-large btn-success"><i class="icon icon-inbox"></i>&nbsp;Inbox</div>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="widget-content tab-content">
                                <div class="widget-box">
                                    <div class="widget-title">
                                        <span class="icon"><i class="icon-inbox"></i></span>
                                        <h5>Inbox</h5>
                                    </div>
                                    <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" CellPadding="10" BorderColor="White" DataKeyNames="ID" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderTemplate>SNo.</HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Eval("sn") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>Subject</HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnSubject" runat="server" Text='<%#Eval("v") %>' CommandName="Show" Width="1000px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%#Eval("ID") %>' Text="Delete" OnClientClick="return confirm('Are U Sure');" CssClass="btn btn-danger" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel1" runat="server">
                        <HeaderTemplate>
                            <div class="btn btn-large btn-info"><i class="icon icon-share-alt"></i>&nbsp;Sent Items</div>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="widget-content tab-content">
                                <div class="widget-box">
                                    <div class="widget-title">
                                        <span class="icon"><i class="icon-share-alt"></i></span>
                                        <h5>Sent Items</h5>
                                    </div>
                                    <asp:GridView ID="GridView2" OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="False" runat="server" CellPadding="10" BorderColor="White" DataKeyNames="ID" OnRowDataBound="GridView2_RowDataBound" OnRowCommand="GridView2_RowCommand">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderTemplate>
                                                    SNo.
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Eval("sn") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>Subject</HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnSubject" runat="server" Text='<%#Eval("v") %>' CommandName="Show" Width="1000px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnDelete" runat="server" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('Are U Sure');" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
                <asp:HiddenField runat="server" ID="HiddenField1" />
                <asp:Button runat="server" ID="Button2" Enabled="false" CssClass="hidden" />
                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button2" CancelControlID="cl" PopupControlID="Panel3" BackgroundCssClass="modal-backdrop"></cc1:ModalPopupExtender>
                <asp:Panel ID="Panel3" runat="server">
                    <div class="modal">
                        <div class="modal-header">
                            <span class="icon" style="float: right; padding-top: 5px"><i class="icon-remove btn btn-danger" id="cl"></i></span>
                            <h3><asp:Label ID="Label5" runat="server"></asp:Label></h3>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label4" runat="server" Font-Size="16px"></asp:Label>
                            <br />
                            <br />

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Button runat="server" ID="btnReply" CssClass="btn btn-inverse" OnClick="btnReply_Click" Text="Reply" />
                                    <asp:Panel ID="pnlReply" runat="server" Visible="false">
                                        <asp:Label ID="Label7" runat="server" Text="Compose" Font-Size="14px" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtReply" ValidationGroup="i" MaxLength="200" TextMode="MultiLine" placeholder="Enter Your Message Here..." runat="server" Rows="5"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="**" Display="Dynamic" ValidationGroup="i" ForeColor="Red" ControlToValidate="txtReply"></asp:RequiredFieldValidator>
                                        </div>
                                        <br />
                                        <div class="controls">
                                            <asp:Button ID="Button3" runat="server" Text="Send" OnClick="Button3_Click" ValidationGroup="i" CssClass="btn btn-success" />
                                            <asp:Label ID="lblSend1" runat="server" Visible="false" ForeColor="Green"></asp:Label>
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>



                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>

