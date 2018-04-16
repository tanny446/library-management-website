<%@ Page Title="" Language="C#" MasterPageFile="~/SuperAdmin/SuperMasterPage.master" AutoEventWireup="true" CodeFile="DynamicTableExample.aspx.cs" Inherits="DynamicTableExample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <link rel="stylesheet" href="cssadmin/bootstrap.min.css" />
    <link rel="stylesheet" href="cssadmin/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="cssadmin/uniform.css" />
    <link rel="stylesheet" href="cssadmin/select2.css" />
    <link rel="stylesheet" href="cssadmin/matrix-style.css" />
    <link rel="stylesheet" href="cssadmin/matrix-media.css" />
    <link href="font-awesomeadmin/css/font-awesome.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
    <div class="container-fluid">
        <hr/>
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                    <div class="widget-title">
                        <span class="icon"><i class="icon-th"></i></span>
                        <h5>State Table</h5>
                    </div>
                    <div class="widget-content nopadding">
                      <asp:Button ID="Button1" runat="server" Text="ShowData" OnClick="Button1_Click" />
                        <br />

                        <asp:Literal ID="Literal1" runat="server" Visible="false"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

