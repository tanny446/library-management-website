using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// Summary description for Rack
/// </summary>
public class Rack
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
	public Rack()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataTable GetRack(string alpha)
    {
        SqlCommand cmd = new SqlCommand("AtoZsp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "View");
     int    index = char.ToUpper(Convert.ToChar(alpha)) - 64;
        cmd.Parameters.AddWithValue("@id", index);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if(dt.Rows.Count>0)
        {
            return dt;
        }
        else
        {
            return null;
        }
    }
}