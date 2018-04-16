using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;

public partial class Admin_index : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindInfo();
            bindCount();
        }
    }
    private void bindInfo()
    {
        SqlCommand cmd = new SqlCommand("Registersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewInfo");
        cmd.Parameters.AddWithValue("@userid", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            lblWelcome.Text = dt.Rows[0]["Name"].ToString();
            lblOName.Text = dt.Rows[0]["OrganisationName"].ToString();
            txtOName.Text = dt.Rows[0]["OrganisationName"].ToString();
            lblMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
            lblEmail.Text = dt.Rows[0]["Email"].ToString();
            lblCity.Text = dt.Rows[0]["City"].ToString();
            lblState.Text = dt.Rows[0]["State"].ToString();
            lblAddress.Text = dt.Rows[0]["Locality"].ToString();
            lblOType.Text = dt.Rows[0]["OTypeName"].ToString();
            txtMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
            txtEmail.Text = dt.Rows[0]["Email"].ToString();
            txtCity.Text = dt.Rows[0]["City"].ToString();
            txtState.Text = dt.Rows[0]["State"].ToString();
            txtAddress.Text = dt.Rows[0]["Locality"].ToString();
        }
    }
    private void bindCount()
    {
        SqlCommand cmd = new SqlCommand("Registersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "Count");
        cmd.Parameters.AddWithValue("@userid", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            cntStudents.Text = dt.Rows[0]["cntStudents"].ToString();
            cntBooks.Text = dt.Rows[0]["cntBooks"].ToString();
            cntIssue.Text = dt.Rows[0]["cntIssue"].ToString();
            cntMessages.Text = dt.Rows[0]["cntMessages"].ToString();
            cntPenalty.Text = dt.Rows[0]["cntPenalty"].ToString();
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        pnlInfo.Visible = false;
        pnlText.Visible = true;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Registersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "Edit");
        cmd.Parameters.AddWithValue("@oname", txtOName.Text);
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@mobno", txtMobileNo.Text);
        cmd.Parameters.AddWithValue("@state", txtState.Text);
        cmd.Parameters.AddWithValue("@city", txtCity.Text);
        cmd.Parameters.AddWithValue("@password", txtPassword.Text);
        cmd.Parameters.AddWithValue("@userid", Session["admin"]);
        int a = cmd.ExecuteNonQuery();
        cn.Close();
        if (a > 0)
        {
            bindInfo();
            pnlInfo.Visible = true;
            pnlText.Visible = false;
            lblSave.Visible = false;
        }
        else
        {
            lblSave.Text = "Incorrect Password or MobileNo already Registered";
            lblSave.Visible = true;
        }
    }
}