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
public partial class ActorSearch : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr, dr1,dr2;
   
    String actorName = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        deleteData();
        getConnection();
        getData();
        getConnection();
        getDatatv();
        getConnection();
        getDataImage();
        String actorName = Session["actorName"].ToString();
        if (actorName.Equals("0"))
        {
            LabelDesc.Text = "";
        }
        else
        {
            actorName = Session["actorName"].ToString();
            actorSearch(actorName);
            Session["actorName"] = "0";
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

        cmd.CommandText = "Select * from tbl_actorCredits";
        cmd.CommandType = CommandType.Text;
        dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        DataList2.DataSource = dt;
        DataList2.DataBind();

        con.Close();
        // getConnection();

    }
    public void getDatatv()
    {
        cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "Select * from tbl_actorCreditstv";
        cmd.CommandType = CommandType.Text;
        dr1 = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr1);
        DataList3.DataSource = dt;
        DataList3.DataBind();

        con.Close();
        // getConnection();

    }
    public void getDataImage()
    {
        cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "Select * from tbl_actorImages";
        cmd.CommandType = CommandType.Text;
        dr2= cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr2);
        DataList1.DataSource = dt;
        DataList1.DataBind();

        con.Close();
        // getConnection();

    }
    public void deleteData()
    {
        getConnection();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Delete from tbl_actorCredits";
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        con.Close();
        getConnection();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Delete from tbl_actorCreditstv";
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        con.Close();
        getConnection();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Delete from tbl_actorImages";
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       // actorName = TextBox2.Text;
        //search(actorName);
    }
    public void actorSearch(String person)
    {
        if (person.Equals(null))
        {
            LabelDesc.Text = "";
        }
        else
        {
            ImageButton1.ImageUrl = "~/images/star.png";
            var response = new WebClient().DownloadString("https://api.themoviedb.org/3/search/person?api_key=7c14b3c520f5e652edc2180b5190f404&language=en-US&query=" + person);

            var obj = JObject.Parse(response);
            if (obj["results"] is JArray)
            {
                foreach (var error in obj["results"])
                {

                    if (person.Equals(error["name"].ToString()))
                    {
                        String actorId = error["id"].ToString();
                        String actorPoster = error["profile_path"].ToString();

                        L1.Text = person + "<br/>";
                        Image1.ImageUrl = "https://image.tmdb.org/t/p/w300" + actorPoster;
                        Session["aid"] = actorId;
                        Session["aname"] = person;
                        Session["aposter"] = actorPoster;
                        actorDetails(actorId);
                        externalUrl(actorId);
                        movieCredits(actorId);
                        tvCredits(actorId);
                        actorImages(actorId);
                    }
                }
            }
        }
    }
    public void externalUrl(String id)
    {
        var response = new WebClient().DownloadString("https://api.themoviedb.org/3/person/"+id+"/external_ids?api_key=7c14b3c520f5e652edc2180b5190f404&language=en-US");
        var obj = JObject.Parse(response);
        hpr1.ImageUrl = "~/images/fblogo.png";
        HyperLink1.ImageUrl = "~/images/instalogo.png";
        HyperLink2.ImageUrl = "~/images/twitterlogo.png";
        hpr1.NavigateUrl ="https://www.facebook.com/" + obj["facebook_id"].ToString();
        HyperLink1.NavigateUrl = "https://www.instagram.com/"+obj["instagram_id"].ToString();
        HyperLink2.NavigateUrl = "https://www.twitter.com/" + obj["twitter_id"].ToString();
    }
    public void actorDetails(String id)
    {
        var response = new WebClient().DownloadString("https://api.themoviedb.org/3/person/"+id+"?api_key=7c14b3c520f5e652edc2180b5190f404&language=en-US&append_to_response=undefined");
        var obj = JObject.Parse(response);
        LabelDesc.Text += "<br/>Biography : " + obj["biography"].ToString() + "<br/> Birthday: " + obj["birthday"].ToString() + "<br/> Birth Place: " +obj["place_of_birth"];
    }
    public void movieCredits(String id)
    {
        var response = new WebClient().DownloadString(" https://api.themoviedb.org/3/person/" +id+ "/movie_credits?api_key=7c14b3c520f5e652edc2180b5190f404&language=en-US");

        var obj = JObject.Parse(response);
     
      
        if (obj["cast"] is JArray)
        {

            foreach (var error in obj["cast"])
            {
                getConnection();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Insert into tbl_actorCredits(movieId,movieName,posterUrl,character,releaseDate) values(@movieId,@movieName,@posterUrl,@character,@releaseDate)";

                cmd.CommandType = CommandType.Text;
                String url="https://image.tmdb.org/t/p/w300"+ error["poster_path"].ToString();
                cmd.Parameters.Add(new SqlParameter("@movieId", error["id"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@movieName", error["title"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@posterUrl",url));
                cmd.Parameters.Add(new SqlParameter("@character", error["character"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@releaseDate", error["release_date"].ToString()));
                
                cmd.ExecuteNonQuery();
                con.Close();
             }

        }
        // DataList1.Enabled = true;
                getConnection();
                getData();
    }
    public void tvCredits(String id)
    {
        var response = new WebClient().DownloadString(" https://api.themoviedb.org/3/person/" +id+ "/tv_credits?api_key=7c14b3c520f5e652edc2180b5190f404&language=en-US");

        var obj = JObject.Parse(response);


        if (obj["cast"] is JArray)
        {

            foreach (var error in obj["cast"])
            {
                getConnection();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Insert into tbl_actorCreditstv(tvId,tvName,posterUrl,character,releaseDate,episode) values(@tvId,@tvName,@posterUrl,@character,@releaseDate,@episode)";

                cmd.CommandType = CommandType.Text;
                String url = "https://image.tmdb.org/t/p/w300" + error["poster_path"].ToString();
                cmd.Parameters.Add(new SqlParameter("@tvId", error["id"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@tvName", error["original_name"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@posterUrl", url));
                cmd.Parameters.Add(new SqlParameter("@character", error["character"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@releaseDate", error["first_air_date"].ToString()));
                cmd.Parameters.Add(new SqlParameter("@episode","Episode:"+ error["episode_count"].ToString()));
                cmd.ExecuteNonQuery();
                con.Close();
            }

        }
        // DataList1.Enabled = true;
        getConnection();
        getDatatv();
    }
    public void actorImages(String id)
    {
        var response = new WebClient().DownloadString(" https://api.themoviedb.org/3/person/" + id + "/images?api_key=7c14b3c520f5e652edc2180b5190f404");

        var obj = JObject.Parse(response);


        if (obj["profiles"] is JArray)
        {

            foreach (var error in obj["profiles"])
            {
                getConnection();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Insert into tbl_actorImages(posterUrl) values(@posterUrl)";

                cmd.CommandType = CommandType.Text;
                String url = "https://image.tmdb.org/t/p/w300" + error["file_path"].ToString();
                cmd.Parameters.Add(new SqlParameter("@posterUrl", url));
           
                cmd.ExecuteNonQuery();
                con.Close();
            }

        }
        // DataList1.Enabled = true;
        getConnection();
        getDataImage();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
          getConnection();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Insert into tbl_favouritesActor(uname,actorId,actorName,actorPoster) values(@uname,@actorId,@actorName,@actorPoster)";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add(new SqlParameter("@uname", Session["loginId"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@actorId", Session["aid"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@actorName", Session["aname"].ToString()));
        String url = "https://image.tmdb.org/t/p/w300" + Session["aposter"].ToString();
        cmd.Parameters.Add(new SqlParameter("@actorPoster", url));
      int status=  cmd.ExecuteNonQuery();
      if (status >= 1)
      {

      }
      else
      {
          Response.Write("<script>alert('Person Already is Favourite')</script>");
      }
        con.Close();
        ImageButton1.Enabled = false;

        }
    
}