using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class SuperAdmin_Register : System.Web.UI.Page
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
                bindUser();
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Registersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@name", txtSearchUser.Text);
        cmd.Parameters.AddWithValue("@action", "Search");
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            GridView1.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            GridView1.Visible = false;
        }
    }
    private void bindUser()
    {
        SqlCommand cmd = new SqlCommand("Registersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        if (DropDownList1.SelectedIndex == 0)
        {
            cmd.Parameters.AddWithValue("@action", "View");
        }
        if (DropDownList1.SelectedIndex == 1)
        {
            cmd.Parameters.AddWithValue("@action", "ViewEnabled");
        }
        if (DropDownList1.SelectedIndex == 2)
        {
            cmd.Parameters.AddWithValue("@action", "ViewDisabled");
        }
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {

            GridView1.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            GridView1.Visible = false;

        }

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ((Label)e.Row.FindControl("lblSNo")).Text = DataBinder.Eval(e.Row.DataItem, "sn").ToString();
            ((Literal)e.Row.FindControl("ltName")).Text = DataBinder.Eval(e.Row.DataItem, "Name").ToString();
            ((Literal)e.Row.FindControl("ltmobno")).Text = DataBinder.Eval(e.Row.DataItem, "MobileNo").ToString();
            ((Literal)e.Row.FindControl("ltemail")).Text = DataBinder.Eval(e.Row.DataItem, "Email").ToString();
            ((Literal)e.Row.FindControl("ltpassword")).Text = DataBinder.Eval(e.Row.DataItem, "Password").ToString();
            ((Literal)e.Row.FindControl("ltstate")).Text = DataBinder.Eval(e.Row.DataItem, "State").ToString();
            ((Literal)e.Row.FindControl("ltcity")).Text = DataBinder.Eval(e.Row.DataItem, "City").ToString();
            ((Literal)e.Row.FindControl("ltlocality")).Text = DataBinder.Eval(e.Row.DataItem, "Locality").ToString();
            ((Literal)e.Row.FindControl("ltoname")).Text = DataBinder.Eval(e.Row.DataItem, "OrganisationName").ToString();
            ((Literal)e.Row.FindControl("ltotype")).Text = DataBinder.Eval(e.Row.DataItem, "OrganisationType").ToString();
            ((Literal)e.Row.FindControl("ltjoiningdate")).Text = DataBinder.Eval(e.Row.DataItem, "JoiningDate").ToString();
            ((Literal)e.Row.FindControl("ltisactive")).Text = DataBinder.Eval(e.Row.DataItem, "active").ToString();
            if (DataBinder.Eval(e.Row.DataItem, "IsActive").ToString() == "0")
            {
                ((Button)e.Row.FindControl("btnDisable")).Visible = false;
            }
            else if (DataBinder.Eval(e.Row.DataItem, "IsActive").ToString() == "1")
            {
                ((Button)e.Row.FindControl("btnEnable")).Visible = false;
            }
            ((Button)e.Row.FindControl("btnDisable")).CommandArgument = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            ((Button)e.Row.FindControl("btnEnable")).CommandArgument = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Disable")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Registersp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Disable");
            cmd.Parameters.AddWithValue("@userID", rowID);
            int a = cmd.ExecuteNonQuery();
            cn.Close();
            if (a > 0)
            {
                bindUser();
            }
        }
        if (e.CommandName == "Enable")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Registersp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Enable");
            cmd.Parameters.AddWithValue("@userID", rowID);
            int a = cmd.ExecuteNonQuery();
            cn.Close();
            if (a > 0)
            {
                bindUser();
            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindUser();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindUser();
    }
}