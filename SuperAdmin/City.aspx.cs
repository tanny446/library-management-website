using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class SuperAdmin_City : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["super"] == null || Session["super"].ToString() == "")
        {
            Response.Redirect("../Home.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                Label1.Visible = false;
                bindCity();
                dropdownState();
            }
        }
    }
    private void dropdownState()
    {
        SqlCommand cmd = new SqlCommand("Statesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "View");
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            ddAddState.DataSource = dt;
            ddAddState.DataTextField = "StateName";
            ddAddState.DataValueField = "StateID";
            ddAddState.DataBind();
            ddAddState.Items.Insert(0, "Select");

        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Citysp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@cityname", txtAddCity.Text);
        cmd.Parameters.AddWithValue("@stateid", ddAddState.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@action", "Add");
        int a = cmd.ExecuteNonQuery();
        cn.Close();
        if(a>0)
        {
            txtAddCity.Text = null;
            ddAddState.SelectedValue = "Select";
            Label1.Visible = true;
            Label1.Text = "Added Successfully";
            bindCity();
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "Already Present";
        }
        
    }
    protected void btnSort_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Citysp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SortState");
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            Label1.Visible = false;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Citysp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@cityname", txtSearchCity.Text);
        cmd.Parameters.AddWithValue("@action", "Search");
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            Label1.Visible = false;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    private void bindCity()
    {

        SqlCommand cmd = new SqlCommand("Citysp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "Show");
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

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ((Label)e.Row.FindControl("lblsno")).Text = DataBinder.Eval(e.Row.DataItem, "sn").ToString();
            ((Literal)e.Row.FindControl("ltcityname")).Text = DataBinder.Eval(e.Row.DataItem, "CityName").ToString();
            ((Literal)e.Row.FindControl("ltstatename")).Text = DataBinder.Eval(e.Row.DataItem, "State").ToString();
            ((Button)e.Row.FindControl("btnEdit")).CommandArgument = DataBinder.Eval(e.Row.DataItem, "CityID").ToString();
            ((Button)e.Row.FindControl("btnDelete")).CommandArgument = DataBinder.Eval(e.Row.DataItem, "CityID").ToString();
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Citysp", cn);
            cn.Open();
            HiddenField1.Value = rowID.ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Edit");
            cmd.Parameters.AddWithValue("@cityid", rowID);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            cn.Close();
            if (dt.Rows.Count > 0)
            {
                Label1.Visible = false;
                ddAddState.SelectedItem.Text = dt.Rows[0]["State"].ToString();
                txtAddCity.Text = dt.Rows[0]["CityName"].ToString();
                btnAdd.Visible = false;
                btnUpdate.Visible = true;
            }
            
        }
        if (e.CommandName == "Delete")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Citysp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Delete");
            cmd.Parameters.AddWithValue("@cityid", rowID);
            int a = cmd.ExecuteNonQuery();
            cn.Close();
            if (a > 0)
            {
                Label1.Visible = true;
                Label1.Text = "Deleted Successfully";
                bindCity();
            }
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Citysp", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cn.Open();
        cmd.Parameters.AddWithValue("@action","Update");
        cmd.Parameters.AddWithValue("@cityname",txtAddCity.Text);
        cmd.Parameters.AddWithValue("@stateid",ddAddState.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@cityid", HiddenField1.Value);
        int a = cmd.ExecuteNonQuery();
        cn.Close();
        if(a>0)
        {
            Label1.Visible = true;
            Label1.Text = "Updated Successfully";
            txtAddCity.Text = null;
            dropdownState();
            bindCity();
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindCity();
        
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    
}