using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class Admin_Return : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    private void bindIssue()
    {
        SqlCommand cmd = new SqlCommand("Issuesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@rollno", txtRollNo.Text);
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        cmd.Parameters.AddWithValue("@action", "ReturnView");
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Panel3.Visible = true;
        }
        else
        {
            Panel3.Visible = false;
            GridView1.Visible = false;
            ModalPopupExtender1.Show();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Studentsp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewInfo");
        cmd.Parameters.AddWithValue("@rollno", txtRollNo.Text);
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            bindIssue();
        }
        else
        {
            GridView1.Visible = false;
            ModalPopupExtender2.Show();
            pnlStudentInfo.Visible = false;
            pnlStudentError.Visible = true;
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Issuesp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Return");
            cmd.Parameters.AddWithValue("@session", Session["admin"]);
            cmd.Parameters.AddWithValue("@bookisbn", rowID);
            cmd.Parameters.AddWithValue("@rollno", txtRollNo.Text);
            int a = cmd.ExecuteNonQuery();
            cn.Close();
            if (a > 0)
            {
                bindIssue();
            }
        }
    }
    protected void ViewInfo_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Studentsp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewInfo");
        cmd.Parameters.AddWithValue("@rollno", txtRollNo.Text);
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            imgStudent.ImageUrl = "StudentImages/" + dt.Rows[0]["StudentImage"].ToString();
            lblStudentName.Text = dt.Rows[0]["Name"].ToString();
            lblEmail.Text = dt.Rows[0]["Email"].ToString();
            lblAddress.Text = dt.Rows[0]["Address"].ToString();
            lblMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
            lblProgramme.Text = dt.Rows[0]["Programme"].ToString();
            pnlStudentError.Visible = false;
            pnlStudentInfo.Visible = true;
        }
        else
        {
            pnlStudentInfo.Visible = false;
            pnlStudentError.Visible = true;

        }
        ModalPopupExtender2.Show();
    }
    }