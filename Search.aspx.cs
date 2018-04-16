using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Search : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            pnlOInfo.Visible = false;
            pnlOName.Visible = false;
            pnlSearch.Visible = true;
        }
    }
    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchBook(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select distinct BookName from Books where " + "BookName like @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> books = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        books.Add(sdr["BookName"].ToString());
                    }
                }
                conn.Close();
                return books;
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text.Length > 2)
        {
            SqlCommand cmd = new SqlCommand("Booksp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "ViewOName");
            cmd.Parameters.AddWithValue("@bookname", txtSearch.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            cn.Close();
            if (dt.Rows.Count > 0)
            {
                pnlSearch.Visible = false;
                pnlOName.Visible = true;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                lblSearch.Visible = true;
                lblSearch.Text = "No Book Present";
            }
        }
        else
        {
            txtSearch.Focus();
        }
    }
    protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if(e.CommandName=="Click")
        {
            pnlOInfo.Visible = true;
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Booksp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "ViewOInfo");
            cmd.Parameters.AddWithValue("@session", rowID);
            cmd.Parameters.AddWithValue("@bookname", txtSearch.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            cn.Close();
            if (dt.Rows.Count > 0)
            {
                lblAC.Text = dt.Rows[0]["PresentCopies"].ToString();
                lblAddress.Text = dt.Rows[0]["Locality"].ToString() + ',' + dt.Rows[0]["City"].ToString() + ',' + dt.Rows[0]["State"].ToString();
                lblAuthor.Text = dt.Rows[0]["BookAuthor"].ToString();
                lblEdition.Text = dt.Rows[0]["BookEdition"].ToString();
                lblEmail.Text = dt.Rows[0]["Email"].ToString();
                lblHeading.Text = dt.Rows[0]["BookName"].ToString();
                lblMobNo.Text = dt.Rows[0]["MobileNo"].ToString();
                lblOName.Text = dt.Rows[0]["OrganisationName"].ToString();
            }
            
        }
    }
}