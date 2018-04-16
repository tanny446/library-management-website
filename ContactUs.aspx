<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="registrationform" >
            <div class="form-horizontal">
                <fieldset>
                    <legend>Message Us<i class="fa fa-comment-o pull-right"></i></legend>
                    <div class="form-group">
                        <asp:Label ID="Label7" runat="server" Text="UserName" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtUN" runat="server" placeholder="Mobile No" MaxLength="10" CssClass="form-control" ValidationGroup="h"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" FilterType="Numbers" TargetControlID="txtUN" runat="server"></cc1:FilteredTextBoxExtender>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label12" runat="server" Text="Password" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtP" runat="server" placeholder="Password" CssClass="form-control" ValidationGroup="h" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Subject" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtSubject" runat="server" MaxLength="30" placeholder="Subject" CssClass="form-control" ValidationGroup="h"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Message" CssClass="col-lg-3 control-label"></asp:Label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtMessage" runat="server" placeholder="Enter Your Message here..." CssClass="form-control" ValidationGroup="h" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <asp:Button ID="btnSend" runat="server" CssClass="btn btn-success" ValidationGroup="h" Text="Send" OnClick="btnSend_Click" />
                            <br />
                            <asp:Label ID="lblSendResult" runat="server" Visible="false"></asp:Label>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="registrationform" >
            <div class="form-horizontal">
                <fieldset>
                    <legend>Contact Us<i class="fa fa-phone pull-right"></i></legend>
                    <asp:Label ID="Label3" runat="server" ForeColor="Red" Font-Size="20px" Text="Not Our Member??" ></asp:Label>
                    <br />
                    <b style="font-size:14px">Email Us At:&nbsp;&nbsp;&nbsp;</b><a href="https://mail.google.com/mail/u/0/#inbox?compose=15d187bb5eaf37de">Tanish.VVerma@gmail.com</a>
                    <br />
                     <b style="font-size:14px">Ring Us On:&nbsp;&nbsp;&nbsp;&nbsp;</b>9462022985
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>

