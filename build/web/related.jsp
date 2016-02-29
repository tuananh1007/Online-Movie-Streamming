<%-- 
    Document   : sameGenre
    Created on : Dec 17, 2015, 6:34:37 PM
    Author     : Tuan Anh
--%>

<div class="block" id="movie-update"><br />
    <div class="blocktitle">
        <div class="icon movie2"></div>
        <h2 class="title">Related</h2>
        <div class="tabs" data-target="#list-movie-update">
        </div></div><br /><br />
    <div class="blockbody" id="list-movie-update">
        <div class="divider"></div>
        <ul class="list-film tab phim-chieu-rap">

            <%@page import="java.sql.PreparedStatement"%>
            <%@page import="java.sql.Connection"%>
            <%@page import="java.util.ArrayList"%>
            <%@page import="java.sql.ResultSet"%>
            <%@page import="db.DatabaseConnection"%>
            <%
                DatabaseConnection db = new DatabaseConnection();
                Connection con = db.setConnection();
                String Id = request.getParameter("id");
                String sql = "Select * from movie where Movie_Genre = " + Id;
                ResultSet rs = db.getResult(sql, con);
                while (rs.next()) {
            %>
            <li>
                <div class="inner">
                    <div>
                        <a href="controller?action=detailMovie&id=<%=rs.getInt("Movie_ID")%>" title="<%= rs.getString("Movie_Name")%>">
                            <img class="khung" src="/OnlineMovieStreaming/<%= rs.getString("Movie_Picture")%>" alt="<%= rs.getString("Movie_Name")%>" />
                        </a>
                    </div>
                    <div class="statustop">
                        <span><%= rs.getString("Movie_Views")%> views</span>
                    </div>
                    <div class="statusbot">
                        <span class="statusbotleft"><%= rs.getString("Movie_Year")%></span>
                        <span class="statusbotright"><%= rs.getString("Movie_Length")%></span>
                    </div>
                    <div class="name">
                        <a href="controller?action=detailMovie&id=<%=rs.getInt("Movie_ID")%>" title="<%= rs.getString("Movie_Name")%>"><%= rs.getString("Movie_Name")%></a>
                    </div>
                </div>
            </li>

            <%
                }
                out.print("</ul></div></div>");%>
