using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class DynamicTableExample : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Organisationtypesp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "View");
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        string str = string.Empty;

        str += " <table class='table table-bordered data-table'>";
        str += "<thead> <tr><th>Rendering engine</th> <th>Browser</th><th>Platform(s)</th><th>Engine version</th></tr></thead>";
        if (dt.Rows.Count > 0)
        {
            str += "<tbody>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str += "<tr class='gradeX'><td>" + dt.Rows[i]["ID"].ToString() + "</td><td>" + dt.Rows[i]["Name"].ToString() + " </td><td>Win 95+</td><td class='center'>4</td></tr>";


            }
            str += "</tbody>";
            Literal1.Visible = true;
            Literal1.Text = str;

        }
    }
}