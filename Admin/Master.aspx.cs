using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;

public partial class Admin_Master : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownCategory();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("AdminMastersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "Add");
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        if (!string.IsNullOrWhiteSpace(txtExpiryDays.Text))
        {
            cmd.Parameters.AddWithValue("@expirydays", txtExpiryDays.Text);
        }
        if (!string.IsNullOrWhiteSpace(txtPenalty.Text))
        {
            cmd.Parameters.AddWithValue("@penalty", txtPenalty.Text);
        }
        if (!string.IsNullOrWhiteSpace(txtRackName.Text))
        {
            int index = char.ToUpper(Convert.ToChar(txtRackName.Text)) - 64;
            cmd.Parameters.AddWithValue("@rackname", index);
        }
        if (!string.IsNullOrWhiteSpace(txtBookSubCategory.Text))
        {
            if (ddCategory.SelectedValue != "Select")
            {
                if (ddCategory.SelectedValue != "Add New")
                {
                    cmd.Parameters.AddWithValue("@bookcategory", ddCategory.SelectedItem.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@bookcategory", txtBookCategory.Text);
                }
                cmd.Parameters.AddWithValue("@subcategory", txtBookSubCategory.Text);
                   
            }
            else
            {
                lblCategory.Visible = true;
            }

        }
        if (!string.IsNullOrEmpty(txtProgramme.Text))
        {
            cmd.Parameters.AddWithValue("@programme", txtProgramme.Text);
        }
        int a = cmd.ExecuteNonQuery();
        cn.Close();
        if (a > 0)
        {
            lblSave.Visible = true;
            lblSave.Text = "**Added**";
        }
        else
        {
            lblSave.Visible = true;
            lblSave.Text = "All Empty";
        }
        
    }
    private void DropDownCategory()
    {
        SqlCommand cmd = new SqlCommand("AdminMastersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewCategory");
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();

        if (dt.Rows.Count > 0)
        {
            ddCategory.DataSource = dt;
            ddCategory.DataTextField = "Category";
            ddCategory.DataValueField = "ID";
            ddCategory.DataBind();
            ddCategory.Items.Insert(0, "Select");
            ddCategory.Items.Insert(1, "Add New");

        }
    }
    protected void ddCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddCategory.SelectedValue == "Add New")
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("AdminMastersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewInitialize");
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            
            lblRack.Text = "A-"+dt.Rows[0]["CharName"].ToString();
            lblExpiry.Text = dt.Rows[0]["ExpiryDays"].ToString();
            lblPenalty.Text = "Rs."+ dt.Rows[0]["Penalty"].ToString()+ "(Per Day)";
        }
        SqlCommand cmd1 = new SqlCommand("AdminMastersp", cn);
        cn.Open();
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.Parameters.AddWithValue("@action", "ViewProgramme");
        cmd1.Parameters.AddWithValue("@session", Session["admin"]);
        dr = cmd1.ExecuteReader();
        DataTable dt1 = new DataTable();
        dt1.Load(dr);
        cn.Close();
        int i;
        if (dt1.Rows.Count > 0)
        {
            lblProgramme.Text = dt1.Rows[0]["Programme"].ToString();
            for(i=1;i<dt1.Rows.Count;i++)
            lblProgramme.Text = lblProgramme.Text + ", " + dt1.Rows[i]["Programme"].ToString();
        }
        bindBookClass();
        ModalPopupExtender1.Show();
        }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindBookClass();
    }
    private void bindBookClass()
    {
        SqlCommand cmd2 = new SqlCommand("AdminMastersp", cn);
        cn.Open();
        cmd2.CommandType = CommandType.StoredProcedure;
        cmd2.Parameters.AddWithValue("@action", "ViewBookClass");
        cmd2.Parameters.AddWithValue("@session", Session["admin"]);
        SqlDataReader dr = cmd2.ExecuteReader();
        DataTable dt2 = new DataTable();
        dt2.Load(dr);
        cn.Close();
        if (dt2.Rows.Count > 0)
        {
            GridView1.DataSource = dt2;
            GridView1.DataBind();
        }
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Registersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ChangePassword");
        cmd.Parameters.AddWithValue("@userID", Session["admin"]);
        cmd.Parameters.AddWithValue("@password",txtCP.Text);
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