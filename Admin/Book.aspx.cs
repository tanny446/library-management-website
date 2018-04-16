using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;
public partial class Admin_Book : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownCategory();
            bindBook();
            DropDownRackName();
        }

    }

    private void DropDownRackName()
    {
        SqlCommand cmd = new SqlCommand("AdminMastersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewRackName");
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            ddRackName.DataSource = dt;
            ddRackName.DataTextField = "CharName";
            ddRackName.DataValueField = "ID";
            ddRackName.DataBind();
            ddRackName.Items.Insert(0, "Select");
        }

    }
    private void bindBook()
    {
        SqlCommand cmd = new SqlCommand("Booksp", cn);
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
        if (FileUpload1.HasFile && ddCategory.SelectedValue != "Select")
            {
                string extension = Path.GetExtension(FileUpload1.FileName.ToLower());
                if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
                {
                    string s = txtISBN.Text + "_" + FileUpload1.FileName;
                    string _path = Server.MapPath("BookImages");
                    FileUpload1.SaveAs(_path + "/" + s);
                    SqlCommand cmd = new SqlCommand("Booksp", cn);
                    cn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@isbn", txtISBN.Text);
                    cmd.Parameters.AddWithValue("@bookname", txtBookName.Text);
                    cmd.Parameters.AddWithValue("@bookauthor", txtBookAuthor.Text);
                    cmd.Parameters.AddWithValue("@bookedition", txtBookEdition.Text);
                    cmd.Parameters.AddWithValue("@noofcopies", txtNoOfCopies.Text);
                    cmd.Parameters.AddWithValue("@category", ddCategory.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@subcategory", ddSubCategory.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@rack", ddRackName.SelectedItem.Text + '-' + ddRackNo.Text);
                    cmd.Parameters.AddWithValue("@bookimg", s);
                    cmd.Parameters.AddWithValue("@session", Session["admin"]);
                    cmd.Parameters.AddWithValue("@action", "Add");
                    int a = cmd.ExecuteNonQuery();
                    cn.Close();
                    if (a > 0)
                    {
                        lblSave.Visible = true;
                        lblSave.Text = "Added Successfully";
                        bindBook();
                    }
                }
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
            ddSubCategory.Items.Insert(0, "Select Category");
        }
    }
    private void DropDownSubCategory()
    {
        SqlCommand cmd = new SqlCommand("AdminMastersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewSubCategory");
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        cmd.Parameters.AddWithValue("@bookcategory", ddCategory.SelectedItem.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            ddSubCategory.DataSource = dt;
            ddSubCategory.DataTextField = "SubCategory";
            ddSubCategory.DataValueField = "ID";
            ddSubCategory.DataBind();
            ddSubCategory.Focus();
        }
    }
    protected void ddCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownSubCategory();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Booksp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Delete");
            cmd.Parameters.AddWithValue("@bookid", rowID);
            cmd.Parameters.AddWithValue("@session", Session["admin"]);
            int a = cmd.ExecuteNonQuery();
            cn.Close();
            if (a > 0)
            {
                bindBook();
            }
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindBook();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindBook();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int rowID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        TextBox t1 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtNOC");
        TextBox t2 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtRack");
        SqlCommand cmd = new SqlCommand("Booksp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "Update");
        cmd.Parameters.AddWithValue("@noofcopies", t1.Text);
        cmd.Parameters.AddWithValue("@rack", t2.Text);
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        cmd.Parameters.AddWithValue("@bookid", rowID);
        int a = cmd.ExecuteNonQuery();
        cn.Close();
        if (a > 0)
        {
            GridView1.EditIndex = -1;
            bindBook();
        }

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindBook();
    }
    protected void ddSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void btnNameSearch_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Booksp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SearchBook");
        cmd.Parameters.AddWithValue("@bookname", txtNameSearch.Text);
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
        else
        {
            txtNameSearch.Text = "";
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
    protected void btnCategorySearch_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Booksp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SearchCategory");
        cmd.Parameters.AddWithValue("@category", txtCategorySearch.Text);
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
        else
        {
            txtCategorySearch.Text = "";
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
    protected void btnReload_Click(object sender, EventArgs e)
    {
        bindBook();
    }
    protected void btnRackNameSearch_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Booksp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "SearchRackName");
        cmd.Parameters.AddWithValue("@rack", txtRackNameSearch.Text);
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
        else
        {
            txtRackNameSearch.Text = "";
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
}