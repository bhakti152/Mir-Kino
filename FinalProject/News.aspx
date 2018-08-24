<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="GoogleNews_API.News" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/f1.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-2.1.0.min.js"></script>
    <script>

        //For Enter Key Press Event
        function runScript(e) {
            if (e.keyCode == 13) {

                //Call GetNews Function
                GetNews();

                return false;
            }
        }

        //Function for GetNews Usinf Ajax Post Method
        function GetNews() {

            //Set FadeIn for Progressive Div
            $("#ProgressiveDiv").fadeIn();

            //Create Ajax Post Method
            $.ajax({
                type: "POST", // Ajax Mehod
                url: "News.aspx/GetNewsContent",  //Page URL / Method name
                data: "{'NewsParameters':'" + document.getElementById("txtSubject").value + "'}", // Pass Parameters
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) { // Function call on success

                    $("#DivNews").empty(); // Set Div Empty

                    //Set For loop for binding Div Row wise
                    for (var i = 0; i < data.d.length; i++) {

                        //Design Div Dynamically using append
                        $("#DivNews").append("<tr><td><B style='color:Red'>" + data.d[i].title + "- By: Nirav Prabtani</B> </td></tr><tr><td>" + data.d[i].Description + "</td></tr>");

                    }

                    //set fadeOut for ProgressiveDiv
                    $("#ProgressiveDiv").fadeOut(500);
                },

                error: function (result) { // Function call on failure or error
                    alert(result.d);
                }


            });


        }
    </script>
    <style type="text/css">
        .classname
        {
            -moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
            -webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
            box-shadow: inset 0px 1px 0px 0px #ffffff;
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
            background: -moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
            background-color: #ededed;
            -webkit-border-top-left-radius: 6px;
            -moz-border-radius-topleft: 6px;
            border-top-left-radius: 6px;
            -webkit-border-top-right-radius: 6px;
            -moz-border-radius-topright: 6px;
            border-top-right-radius: 6px;
            -webkit-border-bottom-right-radius: 6px;
            -moz-border-radius-bottomright: 6px;
            border-bottom-right-radius: 6px;
            -webkit-border-bottom-left-radius: 6px;
            -moz-border-radius-bottomleft: 6px;
            border-bottom-left-radius: 6px;
            text-indent: 0;
            border: 1px solid #dcdcdc;
            display: inline-block;
            color: #777777;
            font-family: arial;
            font-size: 15px;
            font-weight: bold;
            font-style: normal;
            height: 25px;
            line-height: 50px;
            width: 100px;
            text-decoration: none;
            text-align: center;
            text-shadow: 1px 1px 0px #ffffff;
        }
        .classname:hover
        {
            background: -webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed) );
            background: -moz-linear-gradient( center top, #dfdfdf 5%, #ededed 100% );
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed');
            background-color: #dfdfdf;
        }
        .classname:active
        {
            position: relative;
            top: 1px;
        }
        
        
        
        .textbox
        {
            background: #FFF url(http://html-generator.weebly.com/files/theme/input-text-9.png) no-repeat 4px 4px;
            border: 1px solid #999;
            outline: 0;
            padding-left: 25px;
            height: 25px;
            width: 275px;
        }
        .style1
        {
            height: 61px;
        }
        #ProgressiveDiv
        {
            width: 100%;
            height: 100%;
            display: none;
            opacity: 0.4;
            position: fixed;
            top: 0px;
            left: 0px;
            vertical-align: middle;
        }
        .auto-style1 {
            height: 61px;
            width: 297px;
        }
        .auto-style2 {
            width: 297px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Home" OnClick="Button1_Click"  />
                </td>
            </tr>
            <tr>
                <td align="center" class="auto-style1">
                    <h3>
                        News</h3>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox runat="server" ID="txtSubject" CssClass="textbox" onkeypress="return runScript(event)" />
                </td>
            </tr>
            <tr>
                <td align="right" class="auto-style2">
                    &nbsp;</td>
            </tr>
        </table>
        <div id="DivNews">
        </div>

    </div>
    <%--This Div is For Binding News--%>
    <div id="ProgressiveDiv" style="padding-left: 500px">
        <img src="images/giphy.gif" />
    </div>
    </form>
</body>
</html>
