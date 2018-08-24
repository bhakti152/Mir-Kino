using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GoogleNews_API;
public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.Equals("0"))
        {
            Session["movieName"] = TextBox1.Text;
          //  Session["id"] = "0";
           // Session["page"]="Master";
            //Session["id"] = "";
            Response.Redirect("~/MovieSearch.aspx");
            
        }
        else if (DropDownList1.SelectedValue.Equals("1"))
        {
            Session["actorName"] = TextBox1.Text;
          //  Session["id"] = "1";
            Response.Redirect("~/ActorSearch.aspx");
        }
        
    }
}
