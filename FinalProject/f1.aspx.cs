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
public partial class f1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String[] imgurl=new String[10];
        var response = new WebClient().DownloadString("https://api.themoviedb.org/3/movie/now_playing?api_key=7c14b3c520f5e652edc2180b5190f404&language=en-US&page=undefined");

        var obj = JObject.Parse(response);

        if (obj["results"] is JArray)
        {int i=0;
            foreach (var error in obj["results"])
            {
               imgurl[i] = error["poster_path"].ToString();
               if (i < 9)
               {
                   i++;
               }
               else { break; }
            }
        }
        ImageButton1.ImageUrl = "https://image.tmdb.org/t/p/w300" + imgurl[0];
        ImageButton2.ImageUrl = "https://image.tmdb.org/t/p/w300" + imgurl[1];
        ImageButton3.ImageUrl = "https://image.tmdb.org/t/p/w300" + imgurl[2];
        ImageButton4.ImageUrl = "https://image.tmdb.org/t/p/w300" + imgurl[3];
        ImageButton5.ImageUrl = "https://image.tmdb.org/t/p/w300" + imgurl[4];
        ImageButton6.ImageUrl = "https://image.tmdb.org/t/p/w300" + imgurl[5];
        ImageButton7.ImageUrl = "https://image.tmdb.org/t/p/w300" + imgurl[6];
        ImageButton8.ImageUrl = "https://image.tmdb.org/t/p/w300" + imgurl[7];
        ImageButton9.ImageUrl = "https://image.tmdb.org/t/p/w300" + imgurl[8];
        ImageButton10.ImageUrl = "https://image.tmdb.org/t/p/w300" + imgurl[9];
       
       // releasedThisWeek
    /*    var response1 = new WebClient().DownloadString("http://api.cinemalytics.in/v2/movie/releasedthisweek?auth_token=40674B399A129A4977DCE36CD06785DE");
        Class1Cinemalytics[] relThisWeek = JsonConvert.DeserializeObject<Class1Cinemalytics[]>(response1);
        ImageButton1.ImageUrl = relThisWeek[0].PosterPath;
        ImageButton2.ImageUrl = relThisWeek[1].PosterPath;
        ImageButton3.ImageUrl = relThisWeek[2].PosterPath;
        ImageButton4.ImageUrl = relThisWeek[3].PosterPath;
        //upcomingMovies
        var response2 = new WebClient().DownloadString("http://api.cinemalytics.in/v2/movie/latest-trailers/?auth_token=40674B399A129A4977DCE36CD06785DE");
        Class1Cinemalytics[] upcmingMovie = JsonConvert.DeserializeObject<Class1Cinemalytics[]>(response2);

        if (upcmingMovie.Length > 5)
        {
            ImageButton5.ImageUrl = upcmingMovie[0].PosterPath;
            ImageButton6.ImageUrl = upcmingMovie[1].PosterPath;
            ImageButton7.ImageUrl = upcmingMovie[2].PosterPath;
            ImageButton8.ImageUrl = upcmingMovie[3].PosterPath;
            ImageButton9.ImageUrl = upcmingMovie[4].PosterPath;
            ImageButton10.ImageUrl = upcmingMovie[5].PosterPath;
          //  ImageButton11.ImageUrl = upcmingMovie[6].PosterPath;
        }
        else
        {

        }*/
    }
}