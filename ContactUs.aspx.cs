using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class ContactUs : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Messagesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mobno", txtUN.Text);
        cmd.Parameters.AddWithValue("@password", txtP.Text);
        cmd.Parameters.AddWithValue("@subject", txtSubject.Text);
        cmd.Parameters.AddWithValue("@message", txtMessage.Text);
        cmd.Parameters.AddWithValue("@action", "Contact");
        int a = cmd.ExecuteNonQuery();
        if (a > 0)
        {
            lblSendResult.Visible = true;
            lblSendResult.Text = "Successfully Sent";
            txtMessage.Text = null;
            txtSubject.Text = null;
            txtUN.Text = null;
        }
        else
        {
            lblSendResult.Visible = true;
            lblSendResult.Text = "Incorrect UserName Or Password";
        }
    }
}