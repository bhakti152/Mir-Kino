using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class LoginForm : System.Web.UI.Page
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
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        openCon();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select count(*) from tbl_LoginRegister where uname ='" + txtUsername.Text + "' and pass='" + txtPassword.Text + "';";
        cmd.CommandType = CommandType.Text;
        int status = (int)cmd.ExecuteScalar();
        if (status == 1)
        {
            Session["loginId"] = txtUsername.Text;
          //  Response.Redirect("<script>alert('Login Success')</script>");
            Response.Redirect("~/f1.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "key", "alert('Login Unsuccessful..!!');", true);
        }
        con.Close();
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SignUpForm.aspx");
    }
}