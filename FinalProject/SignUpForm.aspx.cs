using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SignUpForm : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    public void openCon()
    {
        con = new SqlConnection();
        con.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Admin\Documents\db_finalProject.mdf;Integrated Security=True;Connect Timeout=30";
        con.Open();
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
       
        openCon();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from tbl_LoginRegister where uname='" + txtUsername.Text + "';";
        cmd.CommandType = CommandType.Text;
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Response.Write("<script>alert('Username already exist')</script>");
            return;
        }

        con.Close(); 
        String uname = txtUsername.Text;
        String pass = txtPassword.Text;
        String email = txtEmail.Text;

        openCon();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Insert into tbl_LoginRegister values('" + uname + "','" + pass + "','" + email + "')";
        cmd.CommandType = CommandType.Text;
        int status = cmd.ExecuteNonQuery();
        if (status >= 1)
        {
            Response.Redirect("~/LoginForm.aspx");
           // Response.Write("<script>alert('Inserted')</script>");
        }
        con.Close();
       
    }
    
    protected void  TextValidate(object source, ServerValidateEventArgs args)
    {
       
    }
    protected void txtUsername_TextChanged(object sender, EventArgs e)
    {
        String uname = txtUsername.Text;
        openCon();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from tbl_LoginRegister where uname='" + uname + "';";
        cmd.CommandType = CommandType.Text;
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Response.Write("<script>alert('Username already exist')</script>");
            return;
        }

        con.Close();
    }
}