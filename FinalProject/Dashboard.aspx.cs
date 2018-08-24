using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Sockets;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;
using System.Data;
using System.Data.SqlClient;
public partial class Dashboard : System.Web.UI.Page
{
     SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr,dr1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginId"].Equals("0"))
        {
            Label1.Text = "Login Please!!!!!";
        }
        else
        {
            getConnection();
            getData();
            getConnection();
            getDataActor();
        }
    }
    public void getConnection()
    {
        con = new SqlConnection();
        con.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Admin\Documents\db_finalProject.mdf;Integrated Security=True;Connect Timeout=30";
        con.Open();
    }
    public void getData()
    {
        cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "Select * from tbl_favourites where uname='"+Session["loginId"].ToString()+"'";
        cmd.CommandType = CommandType.Text;
        dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        DataList2.DataSource = dt;
        DataList2.DataBind();

        con.Close();
        // getConnection();

    }
    public void getDataActor()
    {
        cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "Select * from tbl_favouritesActor where uname='" + Session["loginId"].ToString() + "'";
        cmd.CommandType = CommandType.Text;
        dr1 = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr1);
        DataList1.DataSource = dt;
        DataList1.DataBind();

        con.Close();
        // getConnection();

    }
    protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["loginId"] = "0";
        Response.Redirect("~/f1.aspx");
    }
}