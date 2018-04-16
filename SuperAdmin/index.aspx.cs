using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
public partial class SuperAdmin_index : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindCount();
        }
    }
    private void bindCount()
    {
        SqlCommand cmd = new SqlCommand("Registersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "CountSuper");
        cmd.Parameters.AddWithValue("@userid", Session["super"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            cntCity.Text = dt.Rows[0]["cntCity"].ToString();
            cntEnable.Text = dt.Rows[0]["cntEnable"].ToString();
            cntMessage.Text = dt.Rows[0]["cntMessage"].ToString();
            cntState.Text = dt.Rows[0]["cntState"].ToString();
            cntUsers.Text = dt.Rows[0]["cntUsers"].ToString();
        }
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Registersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ChangePassword");
        cmd.Parameters.AddWithValue("@userID",Session["super"]);
        cmd.Parameters.AddWithValue("@password", txtCP.Text);
        cmd.Parameters.AddWithValue("@newpassword", txtNP.Text);
        int a = cmd.ExecuteNonQuery();
        cn.Close();
        if (a > 0)
        {
            lblChange.Text = "Updated Successfully";
            lblChange.Visible = true;
        }
        else
        {
            lblChange.Text = "InCorrect Password";
            lblChange.Visible = true;
        }
    }
}