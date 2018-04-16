using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;
public partial class Admin_Message : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindInbox();
            bindOutbox();
            DropDownOrg();
        }
    }
    private void DropDownOrg()
    {
        SqlCommand cmd = new SqlCommand("Messagesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewOName");
        cmd.Parameters.AddWithValue("@recieverid", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            ddOName.DataSource = dt;
            ddOName.DataTextField = "OrganisationName";
            ddOName.DataValueField = "ID";
            ddOName.DataBind();
            ddOName.Items.Insert(0, "Select");
        }
    }
    private void bindInbox()
    {
        SqlCommand cmd = new SqlCommand("Messagesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewInbox");
        cmd.Parameters.AddWithValue("@recieverid", Session["admin"]);
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
    private void bindOutbox()
    {
        SqlCommand cmd = new SqlCommand("Messagesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewOutbox");
        cmd.Parameters.AddWithValue("@senderid", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Messagesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@recieverid", ddOName.SelectedValue);
        cmd.Parameters.AddWithValue("@senderid", Session["admin"]);
        cmd.Parameters.AddWithValue("@message", txtMessage.Text);
        cmd.Parameters.AddWithValue("@subject", txtSubject.Text);
        cmd.Parameters.AddWithValue("@action", "Send");
        int a = cmd.ExecuteNonQuery();
        cn.Close();
        if (a > 0)
        {
            txtSubject.Text = null;
            ddOName.SelectedValue = "Select";
            txtMessage.Text = null;
            lblSend.Visible = true;
            lblSend.Text = "Sent Successfully";
            bindOutbox();
            bindInbox();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ((Button)e.Row.FindControl("btnSubject")).CommandArgument = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            if (DataBinder.Eval(e.Row.DataItem, "Status").ToString() == "0")
            {
                ((Button)e.Row.FindControl("btnSubject")).CssClass = "btn-large abc alert alert-block alert-error";
            }
            else if ((DataBinder.Eval(e.Row.DataItem, "Status").ToString() == "1"))
            {
                ((Button)e.Row.FindControl("btnSubject")).CssClass = "btn-large abc alert alert-success alert-block";
            }
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Show")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
            HiddenField1.Value = rowID.ToString();
            SqlCommand cmd = new SqlCommand("Messagesp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "ViewMessageInbox");
            cmd.Parameters.AddWithValue("@id", rowID);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            cn.Close();
            if (dt.Rows.Count > 0)
            {
                Label4.Text = dt.Rows[0]["Message"].ToString();
                Label5.Text = dt.Rows[0]["OrganisationName"].ToString();
                this.ModalPopupExtender1.Show();
                bindInbox();
                btnReply.Visible = true;
                pnlReply.Visible = false;
                txtReply.Text = null;
                lblSend1.Visible = false;
            }
        }
        if (e.CommandName == "Delete")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Messagesp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Delete");
            cmd.Parameters.AddWithValue("@id", rowID);
            int a = cmd.ExecuteNonQuery();
            cn.Close();
            
            if (a > 0)
            {
                bindInbox();
            }
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ((Button)e.Row.FindControl("btnSubject")).CommandArgument = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            if (DataBinder.Eval(e.Row.DataItem, "Status").ToString() == "0")
            {
                ((Button)e.Row.FindControl("btnSubject")).CssClass = "btn-large abc alert alert-block alert-error";
            }
            else if ((DataBinder.Eval(e.Row.DataItem, "Status").ToString() == "1"))
            {
                ((Button)e.Row.FindControl("btnSubject")).CssClass = "btn-large abc alert alert-block alert-success";
            }
        }
    }

    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Show")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Messagesp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "ViewMessageSentbox");
            cmd.Parameters.AddWithValue("@id", rowID);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            cn.Close();
            if (dt.Rows.Count > 0)
            {
                Label4.Text = dt.Rows[0]["Message"].ToString();
                Label5.Text = dt.Rows[0]["OrganisationName"].ToString() + " (" + dt.Rows[0]["MobileNo"].ToString()+")";
                btnReply.Visible = false;
                pnlReply.Visible = false;
                lblSend1.Visible = false;
                this.ModalPopupExtender1.Show();
                bindOutbox();
            }
        }
        if (e.CommandName == "Delete")
        {
            
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Messagesp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Delete");
            cmd.Parameters.AddWithValue("@id", rowID);
            int a = cmd.ExecuteNonQuery();
            cn.Close();
            
            if(a > 0)
            {
                bindOutbox();
            }
            
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void btnReply_Click(object sender, EventArgs e)
    {
        pnlReply.Visible = true;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Messagesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@id", HiddenField1.Value);
        cmd.Parameters.AddWithValue("@senderid", Session["admin"]);
        cmd.Parameters.AddWithValue("@message", txtReply.Text);
        cmd.Parameters.AddWithValue("@action", "Reply");
        int a = cmd.ExecuteNonQuery();
        cn.Close();
        if (a > 0)
        {
            GridView2.DataSource = null;
            bindOutbox();
            txtReply.Text = null;
            lblSend1.Visible = true;
            lblSend1.Text = "Sent Successfully";
           
        }
    }
}