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
public partial class MovieSearch : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr,dr1;
    String mid=null, mname, mposter;
   // DropDownList masterdrop;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        deleteData();
        getConnection();
        getData();
        getConnection();
        getDataCast();
        LabelDesc.Text = "Hollywood";
      //  TextBox masterTextBox = (TextBox)Master.FindControl("TextBox1");
      //      masterdrop = (DropDownList)Master.FindControl("DropDownList1");
      //if (Session["page"].Equals("Master"))
      //  {

        String movieName = Session["movieName"].ToString();
            if (movieName.Equals("0"))
            {
                LabelDesc.Text = "";
            }
            else
            {
                movieName = Session["movieName"].ToString();
                movieSearch(movieName);
                Session["movieName"] = "0";
            }
         
           
     //   }
     // else if (Session["page"].Equals("child"))
     // {
     //     movieName = null;
     //     movieName = Session["movieName"].ToString();
     ////     masterdrop.Enabled = false;
     //     movieSearch(movieName);
     //    // masterdrop.Enabled = true;
     //   }
     //   else
     //   {
     //      // movieName = masterTextBox.Text;

     //      // masterdrop.Enabled = false;
     //     //  movieSearch(movieName);
     //      // LabelDesc.Text = "";
     //       movieName = null;
     //       Session["page"] = "child";
     //   }
        
        //if (!Session["movieName"].Equals(null))
        //{
        //    movieName = Session["movieName"].ToString();
        //}
        //else
        //{
        //    masterdrop.Enabled = false;
        //}

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
        
        cmd.CommandText = "Select * from tbl_holly";
        cmd.CommandType = CommandType.Text;
        dr = cmd.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr);
        DataList1.DataSource = dt;
        DataList1.DataBind();
        
        con.Close();
       // getConnection();
     
    }
    public void getDataCast()
    {
        cmd = new SqlCommand();
        cmd.Connection = con;

        cmd.CommandText = "Select * from temp_cast";
        cmd.CommandType = CommandType.Text;
        dr1 = cmd.ExecuteReader();
        DataTable dt1 = new DataTable();
        dt1.Load(dr1);
        DataList2.DataSource = dt1;
        DataList2.DataBind();

        con.Close();
    }
    public void deleteData()
    {
        getConnection();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Delete from tbl_holly";
        cmd.CommandType = CommandType.Text;
       
        cmd.ExecuteNonQuery();
        con.Close();
        getConnection();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Delete from temp_cast";
        cmd.CommandType = CommandType.Text;

        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void movieSearch(String name)
    {
        if (name.Equals(null))
        {
            LabelDesc.Text = "";
        }
        else
        {
            ImageButton1.ImageUrl = "~/images/star.png";
            var response = new WebClient().DownloadString("https://api.themoviedb.org/3/search/movie?api_key=7c14b3c520f5e652edc2180b5190f404&language=en-US&query=" + name);

            var obj = JObject.Parse(response);

            if (obj["results"] is JArray)
            {
                foreach (var error in obj["results"])
                {

                    if (name.Equals(error["title"].ToString()))
                    {
                        String movieId = error["id"].ToString();
                        String urlPoster = error["poster_path"].ToString();
                        String backPoster = error["backdrop_path"].ToString();
                        String desc = error["overview"].ToString();
                        String releaseDate = error["release_date"].ToString();

                        Image1.ImageUrl = "https://image.tmdb.org/t/p/w300" + urlPoster;
                        Image2.ImageUrl = "https://image.tmdb.org/t/p/w300" + backPoster;
                        LabelDesc.Text += "Movie Name: " + name + "<br> Movie Description: " + desc + "<br>Release Date: " + releaseDate;
                       
                       Session["mid"] = movieId;
                       Session["mname"] = name;
                       Session["mposter"] = urlPoster;
                       
                        cast(movieId);
                        mDetails(movieId);
                        mVideos(movieId);
                        //movieName = null;
                         //masterdrop.Enabled = true;
                    }
                }

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       // movieName = TextBox1.Text;
        //if (Session["movieName"].Equals(null))
        //{
        //    TextBox masterTextBox = (TextBox)Master.FindControl("TextBox1");
        //    masterdrop = (DropDownList)Master.FindControl("DropDownList1");
        //    movieName = masterTextBox.Text;
            
        //}
           
    }

    public void mDetails(String id)
    {
        var response1 = new WebClient().DownloadString("https://api.themoviedb.org/3/movie/" + int.Parse(id) + "?api_key=7c14b3c520f5e652edc2180b5190f404&language=en-US&append_to_response=undefined");
        var result = JsonConvert.DeserializeObject<TmdbMovieSearch>(response1);
        LabelDetails.Text = "TagLine: " + result.tagline + "<br/>Homepage: " + result.homepage + "<br/>Runtime: " + result.runtime + "<br/>Budget: " + result.budget + "<br/>Status: " + result.status; 
    }

    public void mVideos(String id)
    {
          var response = new WebClient().DownloadString("https://api.themoviedb.org/3/movie/"+int.Parse(id)+"/videos?api_key=7c14b3c520f5e652edc2180b5190f404&language=en-US");

            var obj = JObject.Parse(response);
            String[] keyId=new String[10];
            String[] videoName=new String[10];
            int i = 0;
            if (obj["results"] is JArray)
            {
               
             foreach (var error in obj["results"])
                {
                    getConnection();
                    cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "Insert into tbl_holly(keyId,videoName) values(@keyId,@videoName)";
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.Add(new SqlParameter("@keyId", error["key"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("@videoName", error["name"].ToString()));
                    cmd.ExecuteNonQuery();
                    con.Close();
              }
             
            }
           // DataList1.Enabled = true;
            getConnection();
            getData();
           
        
    }

    public void cast(String id)
    {
          var response = new WebClient().DownloadString(" https://api.themoviedb.org/3/movie/"+ int.Parse(id)+"/credits?api_key=7c14b3c520f5e652edc2180b5190f404");

            var obj = JObject.Parse(response);

            if (obj["cast"] is JArray)
            {
                foreach (var error in obj["cast"])
                {
                    getConnection();
                    cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "Insert into temp_cast(actorName,charName,imgPath) values(@actorName,@charName,@imgPath)";
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.Add(new SqlParameter("@actorName", error["name"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("@charName", error["character"].ToString()));
                    String url = "https://image.tmdb.org/t/p/w300" + error["profile_path"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@imgPath", url));
                    cmd.ExecuteNonQuery();
                    con.Close();
                    
                }
            }
            getConnection();
            getDataCast();
    }
           
    //{
    //    movieName = TextBox1.Text;
    //    if (int.Parse(Session["id"].ToString()).Equals(0))
    //    {
    //      //  name = TextBox1.Text;
    //        var response = new WebClient().DownloadString("https://api.themoviedb.org/3/search/movie?api_key=7c14b3c520f5e652edc2180b5190f404&language=en-US&query=" + TextBox1.Text);

    //        var obj = JObject.Parse(response);

    //        if (obj["results"] is JArray)
    //        {
    //            foreach (var error in obj["results"])
    //            {

    //                if (movieName.Equals(error["title"].ToString()))
    //                {
    //                    String movieId = error["id"].ToString();
    //                    String urlPoster = error["poster_path"].ToString();
    //                    String backPoster = error["backdrop_path"].ToString();
    //                    String desc = error["overview"].ToString();
    //                    String releaseDate = error["release_date"].ToString();

    //                    //String genereId = error["genre_ids"][0].ToString();
    //                    Image1.ImageUrl = "https://image.tmdb.org/t/p/w300" + urlPoster;
                       
    //                    Label1.Text += "Movie Name: " + movieName + "<br> Movie Description: " + desc + "<br>Release Date: " + releaseDate + "<br>";
    //                    //mov(movieId);
    //                }
    //            }

    //        }

            
    //    }
    //   // else if (Session["id"].Equals(1))
        //{
                                //var response = new WebClient().DownloadString("http://api.cinemalytics.in/v2/movie/title/?value=" + movieName + "&auth_token=40674B399A129A4977DCE36CD06785DE");
                                //Class1Cinemalytics[] c1 = JsonConvert.DeserializeObject<Class1Cinemalytics[]>(response);
                                //for (int i = 0; i < c1.Length; i++)
                                //{
                                //    String str = null;
               
                                //    if (c1[i].Title.Equals(movieName))
                                //    { 
                                //            String movieId =c1[i].Id;

                                //        Image imgPoster = new Image();
                                //        imgPoster.ImageUrl += c1[i].PosterPath;
                                //        PlaceHolder1.Controls.Add(imgPoster);
                                //        Literal lDetail = new Literal();
                                //        lDetail.Text += "<br/><br/><br/>Movie Name : " + c1[i].Title;
                                //        if (!c1[i].Description.Equals(str))
                                //        {
                                //            lDetail.Text += "<br/><br/>Description:" + c1[i].Description;
                                //        }
                    
                                //        if (!c1[i].Genre.Equals(str))
                                //        {
                                //            lDetail.Text += "<br/><br/>Genre:" + c1[i].Genre;
                                //        }
                    
                                //        PlaceHolder1.Controls.Add(lDetail);

                                //        if (!c1[i].TrailerEmbedCode.Equals(str))
                                //        {
                                //               Literal lTrailer = new Literal();

                                //               lTrailer.Text += "<br/> <br/> <br/> Trailer<br/><br/>" + c1[i].TrailerEmbedCode +"<br/><br/><br/>Songs<br/>";
                                //               PlaceHolder1.Controls.Add(lTrailer);
                                //         }

                                //        //Songs
                                //           var response1 = new WebClient().DownloadString("http://api.cinemalytics.in/v2/movie/"+movieId+"/songs/?auth_token=40674B399A129A4977DCE36CD06785DE");
                                //            CinemaSongs[] cs1 = JsonConvert.DeserializeObject<CinemaSongs[]>(response1);
                                //            if (cs1.Length > 0)
                                //              {
                                //                    for (int j = 0; j < cs1.Length; j++)
                                //                    {
                                //                        Literal lsong = new Literal();
                                //                        lsong.Text = GetYouTubeScript(cs1[j].YouTubeVideoId)+"               ";
                                //                        PlaceHolder1.Controls.Add(lsong);
                                //                    }
                                //             }

                                       
        //                           }
        //        }
        //}
        //else
        //{
        //    Label l1 = new Label();
        //    l1.Text += "null";
        //    PlaceHolder1.Controls.Add(l1);
       // }
  //  }
    protected string GetYouTubeScript(string id)
    {
        string scr = @"<object width='320' height='240'> ";
        scr = scr + @"<param name='movie' value='http://www.youtube.com/v/" + id + "'></param> ";
        scr = scr + @"<param name='allowFullScreen' value='true'></param> ";
        scr = scr + @"<param name='allowscriptaccess' value='always'></param> ";
        scr = scr + @"<embed src='http://www.youtube.com/v/" + id + "' ";
        scr = scr + @"type='application/x-shockwave-flash' allowscriptaccess='always' ";
        scr = scr + @"allowfullscreen='true' width='320' height='240'> ";
        scr = scr + @"</embed></object>";
        return scr;
    }
    protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
  
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
       // Response.Write("<script>alert('"+Session["mid"].ToString()+","+Session["mname"].ToString()+","+Session["mposter"].ToString()+"')</script>");

        getConnection();
        cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Insert into tbl_favourites(uname,movieId,movieName,moviePoster) values(@uname,@movieId,@movieName,@moviePoster)";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Add(new SqlParameter("@uname", Session["loginId"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@movieId", Session["mid"].ToString()));
        cmd.Parameters.Add(new SqlParameter("@movieName", Session["mname"].ToString()));
        String url = "https://image.tmdb.org/t/p/w300" + Session["mposter"].ToString();
        cmd.Parameters.Add(new SqlParameter("@moviePoster", url));
      int status=  cmd.ExecuteNonQuery();
      if (status >= 1)
      {

      }
      else
      {
          Response.Write("<script>alert('Movie Already is Favourite')</script>");
      }
        con.Close();
        ImageButton1.Enabled = false;

    }
}