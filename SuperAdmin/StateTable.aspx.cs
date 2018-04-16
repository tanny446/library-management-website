using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;
public partial class SuperAdmin_StateTable : System.Web.UI.Page
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
                bindState();
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtState.Text.Length != 0)
        {
            SqlCommand cmd = new SqlCommand("Statesp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@statename", txtState.Text);
            cmd.Parameters.AddWithValue("@action", "Add");
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            cn.Close();
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            bindState();
        }
     }
    private void bindState()
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
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ((Label)e.Row.FindControl("lblsno")).Text = DataBinder.Eval(e.Row.DataItem, "sn").ToString();
            ((Literal)e.Row.FindControl("ltstatename")).Text = DataBinder.Eval(e.Row.DataItem, "StateName").ToString();
            ((Button)e.Row.FindControl("btnDelete")).CommandArgument = DataBinder.Eval(e.Row.DataItem, "StateID").ToString();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
                SqlCommand cmd = new SqlCommand("Statesp", cn);
                cn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Delete");
                cmd.Parameters.AddWithValue("@id", rowID);
                int a = cmd.ExecuteNonQuery();
                cn.Close();
                if (a > 0)
                {
                    bindState();
                }
                else
                {
                    lblDelete.Visible = true;
                }
            }
        if (e.CommandName == "AddNew")
        {
            if (((TextBox)GridView1.FooterRow.FindControl("txtStateName1")).Text.Length != 0)
            {
                TextBox t = (TextBox)GridView1.FooterRow.FindControl("txtStateName1");
                SqlCommand cmd = new SqlCommand("Statesp", cn);
                cn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@statename", t.Text);
                cmd.Parameters.AddWithValue("@action", "Add");
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                cn.Close();
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                bindState();
            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindState();
    }
}