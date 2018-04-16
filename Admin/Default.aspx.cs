using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;

public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


        }
    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    SqlCommand cmd = new SqlCommand("AdminMastersp", cn);
    //        cn.Open();
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.AddWithValue("@action", "Add");
    //        cmd.Parameters.AddWithValue("@session", Session["admin"]);
    //        cmd.Parameters.AddWithValue("@programme", TextBox1.Text);
    //    cmd.Parameters.AddWithValue("@penalty",TextBox2.Text);
    //        int a = cmd.ExecuteNonQuery();
    //        cn.Close();
    //        if (a > 0)
    //        {
    //            TextBox1.Text=a.ToString();
    //        }
    //    }
    //}
}