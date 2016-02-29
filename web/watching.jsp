<%-- 
    Document   : watching
    Created on : Dec 16, 2015, 3:28:27 PM
    Author     : Tuan Anh
--%>


<jsp:include page="/include/header.jsp" flush="true" />

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DatabaseConnection"%>



<div id="content">
    <div class="block" id="page-info">
        <%
            String user = (String) session.getAttribute("user");
            if (user == null) {
                user = " ";

            }
            if (user != " ") {
        %>
        <%
            DatabaseConnection db = new DatabaseConnection();
            Connection con = db.setConnection();
            String Id = request.getParameter("id");
            String sql = "Select * from movie where Movie_ID = " + Id;
            String sql2 = "update movie set Movie_Views=Movie_Views+1 where Movie_ID=" + Id;
            ResultSet rs = db.getResult(sql, con);
            PreparedStatement ps = con.prepareStatement(sql2);
            int rowCount = ps.executeUpdate();

            while (rs.next()) {
                String sql3 = "Select * from genre where Id=" + rs.getString("Movie_Genre");
                ResultSet rs3 = db.getResult(sql3, con);
        %>
        <div class="xemphim" id="play" style="text-align:center;">You are watching <font color="red"><%= rs.getString("Movie_Name")%></font> online on website
            <font color="red">MovieHD.com</font>. Have a nice moment !!!</div>

<!--                <script type="text/javascript" src="/OnlineMovieStreaming/jwplayer/jwplayer.js"></script>  
        
                <div id="myElement">Loading the player...</div>
        
                <script type="text/javascript">
                    jwplayer("myElement").setup({
                        file: "/OnlineMovieStreaming/<%= rs.getString("Movie_Links")%>",
                        image: "/OnlineMovieStreaming/<%= rs.getString("Movie_Picture")%>"
                    });
                </script>-->

        <div class="play">
            <video controls width="676px" height="500px" type="video/mp4">
                <source src="/OnlineMovieStreaming/<%= rs.getString("Movie_Links")%>">
            </video>
        </div>



        <!--<div class="fb-comments" data-colorscheme="dark" data-href="https://www.facebook.com/Movie-HD-1689438874646476" data-width="500" data-numposts="5"></div>-->

        <br/>
        <div class="fb-like" data-colorscheme="dark" data-href="https://www.facebook.com/Movie-HD-1689438874646476" data-width="682" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>

        <div class="fb-comments" data-colorscheme="dark" data-href="http://localhost:8084/OnlineMovieStreaming/controller?action=watching&id=<%= rs.getString("Movie_ID")%>" data-width="682" data-numposts="5"></div>


        <div class="block" id="movie-update"><br />
            <div class="blocktitle">
                <div class="icon movie2"></div>
                <h2 class="title">Related</h2>
                <div class="tabs" data-target="#list-movie-update">
                </div></div><br /><br />
            <div class="blockbody" id="list-movie-update">
                <div class="divider"></div>
                <ul class="list-film tab phim-chieu-rap">

                    <%

                        String sql5 = "Select * from movie where Movie_Genre = " + rs.getString("Movie_Genre")+ " and Movie_ID != " + rs.getString("Movie_ID");
                        ResultSet rs5 = db.getResult(sql5, con);
                        while (rs5.next()) {
                    %>
                    <li>
                        <div class="inner">
                            <div>
                                <a href="controller?action=detailMovie&id=<%=rs5.getInt("Movie_ID")%>" title="<%= rs5.getString("Movie_Name")%>">
                                    <img class="khung" src="/OnlineMovieStreaming/<%= rs5.getString("Movie_Picture")%>" alt="<%= rs5.getString("Movie_Name")%>" />
                                </a>
                            </div>
                            <div class="statustop">
                                <span><%= rs5.getString("Movie_Views")%> views</span>
                            </div>
                            <div class="statusbot">
                                <span class="statusbotleft"><%= rs5.getString("Movie_Year")%></span>
                                <span class="statusbotright"><%= rs5.getString("Movie_Length")%></span>
                            </div>
                            <div class="name">
                                <a href="controller?action=detailMovie&id=<%=rs5.getInt("Movie_ID")%>" title="<%= rs5.getString("Movie_Name")%>"><%= rs5.getString("Movie_Name")%></a>
                            </div>
                        </div>
                    </li>

                    <%
                            }
                        }
                        out.print("</ul></div></div>");%>
            </div>
        </div>

        <%} else {%>

        <div class="xemphim" id="play" style="text-align:center;">This feature is only for <font color="red">member</font>. Please <a style="text-decoration: underline; color: red; font-size: x-large" href="controller?action=log">login</a> to watching movie<br/><a style="text-decoration: underline; font-size: x-large" href="controller?action=error"><font color="red">Back to Homepages </font></a></div>
    </div></div>
    <%}%>
    <jsp:include page="/include/footer.jsp" flush="true" />


