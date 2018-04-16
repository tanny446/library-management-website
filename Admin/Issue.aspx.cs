using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;

public partial class Admin_Issue : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindIssue();
        }
    }
    private void bindIssue()
    {
        SqlCommand cmd = new SqlCommand("Issuesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "View");
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
            SqlCommand cmd = new SqlCommand("Issuesp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rollno", txtRollNo.Text);
            cmd.Parameters.AddWithValue("@bookisbn", txtBookISBN.Text);
            cmd.Parameters.AddWithValue("@session", Session["admin"]);
            cmd.Parameters.AddWithValue("@action", "Add");
            int a = cmd.ExecuteNonQuery();
            cn.Close();
            if (a > 0)
            {
                lblSave.Visible = true;
                lblSave.Text = "Issued Successfully";
                txtBookISBN.Text = null;
                txtRollNo.Text = null;
                bindIssue();
            }
            else
        {
            lblSave.Text = "Already Issued or Not Available";
            lblSave.Visible = true;
            
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindIssue();
    }

    protected void btnViewBook_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Booksp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewInfo");
        cmd.Parameters.AddWithValue("@isbn", txtBookISBN.Text);
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            imgBook.ImageUrl = "BookImages/" + dt.Rows[0]["BookImage"].ToString();
            lblBookName.Text = dt.Rows[0]["BookName"].ToString();
            lblAuthor.Text = dt.Rows[0]["BookAuthor"].ToString();
            lblEdition.Text = dt.Rows[0]["BookEdition"].ToString();
            lblCategory.Text = dt.Rows[0]["Category"].ToString();
            lblSubCategory.Text = dt.Rows[0]["SubCategory"].ToString();
            lblAvailableCopies.Text = dt.Rows[0]["PresentCopies"].ToString();
            lblRack.Text = dt.Rows[0]["Rack"].ToString();
            pnlBookInfo.Visible = true;
            pnlBookError.Visible = false;
        }
        else
        {
            pnlBookError.Visible = true;
            pnlBookInfo.Visible = false;
        }
        ModalPopupExtender1.Show();
        
        
    }
    protected void btnViewStudent_Click(object sender, EventArgs e)
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
            pnlStudentInfo.Visible = true;
            pnlStudentError.Visible = false;
        }
        else
        {
            pnlStudentError.Visible = true;
            pnlStudentInfo.Visible = false;
        }
        ModalPopupExtender2.Show();
    }
}