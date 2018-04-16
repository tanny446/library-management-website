using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.IO;
using System.Data.OleDb;

public partial class Admin_Student : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindStudent();
            DropDownProgramme();
        }

    }
    private void DropDownProgramme()
    {
        SqlCommand cmd = new SqlCommand("AdminMastersp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewProgramme");
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        SqlDataReader dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            ddProgramme.DataSource = dt;
            ddProgramme.DataTextField = "Programme";
            ddProgramme.DataValueField = "ID";
            ddProgramme.DataBind();
            ddProgramme.Items.Insert(0, "Select");
        }

    }
    private void bindStudent()
    {
        SqlCommand cmd = new SqlCommand("Studentsp", cn);
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
        if (FileUpload1.HasFile && ddProgramme.SelectedValue != "Select")
        {
            string extension = Path.GetExtension(FileUpload1.FileName.ToLower());
            if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
            {
                string s = txtRollNo.Text + "_" + FileUpload1.FileName;
                string _path = Server.MapPath("StudentImages");
                FileUpload1.SaveAs(_path + "/" + s);
                SqlCommand cmd = new SqlCommand("Studentsp", cn);
                cn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@rollno", txtRollNo.Text);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@mobileno", txtMobileNo.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@programme", ddProgramme.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@session", Session["admin"]);
                cmd.Parameters.AddWithValue("@studentimg", s);
                cmd.Parameters.AddWithValue("@action", "Add");
                int a = cmd.ExecuteNonQuery();
                cn.Close();
                if (a > 0)
                {
                    lblSave.Visible = true;
                    lblSave.Text = "Added Successfully";
                    txtAddress.Text = null;
                    txtEmail.Text = null;
                    txtMobileNo.Text = null;
                    txtName.Text = null;
                    txtRollNo.Text = null;
                    // lblProgramme.Visible = false;
                    //lblUpload.Visible = false;
                    ddProgramme.SelectedValue = "Select";
                    bindStudent();
                }
                else
                {
                    lblSave.Visible = true;
                    lblSave.Text = "Error";
                }

            }
        }
        else
        {
            lblSave.Visible = true;
            lblSave.Text = "Error Occured";
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int rowID = Convert.ToInt16(e.CommandArgument);
            SqlCommand cmd = new SqlCommand("Studentsp", cn);
            cn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "Delete");
            cmd.Parameters.AddWithValue("@studentid", rowID);
            cmd.Parameters.AddWithValue("@session", Session["admin"]);
            int a = cmd.ExecuteNonQuery();
            cn.Close();
            if (a > 0)
            {
                bindStudent();
            }
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindStudent();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindStudent();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int rowID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        TextBox Email = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditEmail");
        TextBox Mobile = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditMobileNo");
        TextBox Address = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditAddress");
        TextBox Programme = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditProgramme");
        SqlCommand cmd = new SqlCommand("Studentsp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "Edit");
        cmd.Parameters.AddWithValue("@email", Email.Text);
        cmd.Parameters.AddWithValue("@mobileno", Mobile.Text);
        cmd.Parameters.AddWithValue("@address", Address.Text);
        cmd.Parameters.AddWithValue("@programme", Programme.Text);
        cmd.Parameters.AddWithValue("@session", Session["admin"]);
        cmd.Parameters.AddWithValue("@studentid", rowID);
        int a = cmd.ExecuteNonQuery();
        cn.Close();
        if (a > 0)
        {
            GridView1.EditIndex = -1;
            bindStudent();
        }

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindStudent();
    }
    protected void btnUploadExcel_Click(object sender, EventArgs e)
    {
        UploadExcel();
    }
    private void UploadExcel()
    {
        try
        {
            if (flupload.HasFile)
            {
                if (flupload.PostedFile.ContentLength < 20728650) //code for check file size
                {
                    if (System.IO.Path.GetExtension(flupload.FileName) == ".xls" || System.IO.Path.GetExtension(flupload.FileName) == ".xlsx")
                    {
                        #region
                        string DuplicateData = string.Empty;
                        string connectionString = "";
                        string str = flupload.FileName;
                        string path = Server.MapPath("Excel/");

                        flupload.SaveAs(path + "/" + str);
                        string str1 = System.IO.Path.GetExtension(flupload.FileName);
                        str = path + "\\" + flupload.FileName;
                        if (str1 == ".xlsx")
                            connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + str + ';' + "Extended Properties=" + '"' + "Excel 12.0;HDR=Yes;" + '"';
                        else
                            connectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + str + ';' + "Extended Properties=" + '"' + "Excel 8.0;HDR=Yes;IMEX=1;" + '"';
                        string strSQL = "SELECT * FROM [Sheet1$]";
                        OleDbConnection excelConnection = new OleDbConnection(connectionString);
                        excelConnection.Open();
                        OleDbDataAdapter adpt = new OleDbDataAdapter(strSQL, excelConnection);
                        DataTable dt = new DataTable();
                        adpt.Fill(dt);

                        string strSQL1 = "SELECT top 1 * FROM [Sheet1$]";
                        OleDbDataAdapter adpt1 = new OleDbDataAdapter(strSQL1, excelConnection);
                        DataTable dt1 = new DataTable();
                        adpt1.Fill(dt1);
                        dt1.Rows.RemoveAt(0);
                        int a = 0;
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            SqlCommand cmdDuplicate = new SqlCommand("select StudentID from Student where RollNo='" + dt.Rows[i]["RollNo"].ToString() + "' and SessionID='" + Session["admin"] + "'", cn);
                            cn.Open();
                            SqlDataReader drdup = cmdDuplicate.ExecuteReader();
                            DataTable dtduplicate = new DataTable();
                            dtduplicate.Load(drdup);
                            cn.Close();
                            if (dtduplicate.Rows.Count > 0)
                            {
                                DuplicateData += dt.Rows[i]["RollNo"].ToString() + ",";
                            }
                            else
                            {
                                DataRow dr = dt1.NewRow();
                                dr["Rollno"] = dt.Rows[i]["Rollno"].ToString();
                                dr["Name"] = dt.Rows[i]["Name"].ToString();
                                dr["Email"] = dt.Rows[i]["Email"].ToString();
                                dr["MobileNo"] = dt.Rows[i]["MobileNo"].ToString();
                                dr["Programme"] = dt.Rows[i]["Programme"].ToString();
                                dr["Address"] = dt.Rows[i]["Address"].ToString();
                                dr["SessionID"] = Session["admin"];
                                dt1.Rows.Add(dr);
                            }
                        }
                        #region Bulk code here
                        cn.Open();
                        SqlBulkCopy sbc = new SqlBulkCopy(cn);
                        sbc.DestinationTableName = "Student"; //destination file name 

                        sbc.ColumnMappings.Add(0, 2);// Excel to Db eg 0 is excel file column and it will be insert into db column 2
                        sbc.ColumnMappings.Add(1, 1);//Excel to Db
                        sbc.ColumnMappings.Add(2, 5);
                        sbc.ColumnMappings.Add(3, 3);
                        sbc.ColumnMappings.Add(4, 4);
                        sbc.ColumnMappings.Add(5, 6);
                        sbc.ColumnMappings.Add(6, 8);
                        sbc.BatchSize = 100;
                        try
                        {
                            sbc.BulkCopyTimeout = 300;
                            sbc.WriteToServer(dt1);
                            cn.Close();
                            if (a == 0)
                            {
                                if (DuplicateData == null || DuplicateData == "")
                                {
                                    lblSave.Text = "Uploaded Successfully";
                                }
                                else
                                {
                                    DuplicateData = DuplicateData.Remove(DuplicateData.Length - 1, 1);
                                    lblSave.Text = "Uploaded Successfully ! These  are duplicate data " + DuplicateData;
                                }
                                bindStudent();
                            }
                            else
                            {
                                lblSave.Text = "Duplicate Data" + DuplicateData;
                            }
                        }
                        catch
                        {
                            excelConnection.Close();
                            File.Delete(str);
                            cn.Close();
                            lblSave.Text = "Duplicate Data" + DuplicateData;
                        }
                        finally { }
                        excelConnection.Close();
                        File.Delete(str);
                        cn.Close();
                        #endregion
                        #endregion
                    }
                }
                else
                { }
            }
            else
            {
            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    protected void btnRollNoSearch_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Studentsp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewRollNo");
        cmd.Parameters.AddWithValue("@rollno", txtRollNoSearch.Text);
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
            txtRollNoSearch.Text = null;
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
    protected void btnNameSearch_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Studentsp", cn);
        cn.Open();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@action", "ViewName");
        cmd.Parameters.AddWithValue("@name", txtSearchName.Text);
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
            txtSearchName.Text = null;
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
    }
    protected void btnReload_Click(object sender, EventArgs e)
    {
        bindStudent();
    }
}