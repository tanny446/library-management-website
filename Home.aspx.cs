using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Home : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session.Abandon();
            DropDownOrganisation();
            DropDownState();
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Registersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mobno", txtUN.Text);
        cmd.Parameters.AddWithValue("@password", txtP.Text);
        cmd.Parameters.AddWithValue("@action", "Login");
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            if (Convert.ToInt16(dt.Rows[0]["isSuper"]) == 0)
            {
                if (Convert.ToInt16(dt.Rows[0]["isActive"]) == 1)
                {
                    Session["admin"] = dt.Rows[0]["id"].ToString();
                    Response.Redirect("Admin/index.aspx");
                }
                else
                {
                    string str = string.Empty;
                    str += "<a href=ContactUs.aspx>Contact us</a>";
                    lblLoginResult.Visible = true;
                    lblLoginResult.Text = "Account Temporarily Disabled" + "<br/>" + str;
                }
            }
            else
            {
                Session["super"] = dt.Rows[0]["id"].ToString();
                Response.Redirect("SuperAdmin/index.aspx");
            }
        }
        else
        {
            lblLoginResult.Visible = true;
            lblLoginResult.Text = "Incorrect UserName or Password";
        }

    }

    private void DropDownOrganisation()
    {
        SqlCommand cmd = new SqlCommand("Organisationtypesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "View");
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            ddOType.DataSource = dt;
            ddOType.DataTextField = "otypename";
            ddOType.DataValueField = "id";
            ddOType.DataBind();
            ddOType.Items.Insert(0, "Select");

        }
    }

    private void DropDownState()
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
            ddState.DataSource = dt;
            ddState.DataTextField = "statename";
            ddState.DataValueField = "stateid";
            ddState.DataBind();
            ddState.Items.Insert(0, "Select");
            ddCity.Items.Insert(0, "Select State");

        }
    }

    private void DropDownCity()
    {


        SqlCommand cmd = new SqlCommand("Citysp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@stateid", ddState.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@action", "View");
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            ddCity.Items.Clear();
            ddCity.DataSource = dt;
            ddCity.DataTextField = "cityname";
            ddCity.DataValueField = "cityid";
            ddCity.DataBind();
            ddCity.Items.Insert(0, "Select");

        }
        else
        {
            ddCity.Items.Clear();
            ddCity.Items.Insert(0, "No Item");

        }
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Registersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@name", txtName.Text);
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@mobno", txtMobNo.Text);
        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@oname", txtOName.Text);
        cmd.Parameters.AddWithValue("@state", ddState.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@city", ddCity.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@password", txtPW.Text);
        cmd.Parameters.AddWithValue("@otype", ddOType.SelectedValue);
        cmd.Parameters.AddWithValue("@action", "Add");
        int a = cmd.ExecuteNonQuery();
        cn.Close();
        if (a > 0)
        {
            lblResult.Visible = true;
            lblResult.Text = "Successfull";
        }
        else
        {

            lblResult.Visible = true;
            lblResult.Text = "Try Again....";
        }
    }

    protected void ddState_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DropDownCity();
    }
}
