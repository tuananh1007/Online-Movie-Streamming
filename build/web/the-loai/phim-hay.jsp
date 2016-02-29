
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DatabaseConnection"%>
<div class="block" id="movie-update"><br />
    <div class="blocktitle">
        <div class="icon movie2"></div>
        <h2 class="title">New Movies </h2>
        <div class="tabs" data-target="#list-movie-update">
        </div>
    </div><br/><br/>
    <div class="blockbody" id="list-movie-update">
        <div class="divider"></div>
        <ul class="list-film tab phim-chieu-rap">
            <%
                DatabaseConnection db = new DatabaseConnection();
                Connection con = db.setConnection();
                int numPerPage = 6;
                int numOfMovie = 0, numOfPage = 0;
                String sql3 = "Select count(*) from movie";
                ResultSet rs3 = db.getResult(sql3, con);
                while (rs3.next()) {
                    numOfMovie = Integer.parseInt(rs3.getString("count(*)"));
                }
//                int Page = Integer.parseInt(request.getParameter("page"));
//                if (request.getParameter("page").trim().isEmpty()) {
//                    request.setAttribute("page", 0);
//                } else {
//                    request.setAttribute("page", Page);
//                }
                numOfPage = numOfMovie / numPerPage;
                String sql4 = "Select * from movie";
//                String sql5 = "Select * from movie limit " + Page*numOfPage + " , " + numOfPage;
                ResultSet rs4 = db.getResult(sql4, con);
                while (rs4.next()) {

            %>
            <li>
                <div class="inner">
                    <div>
                        <a href="controller?action=detailMovie&id=<%=rs4.getInt("Movie_ID")%>" title="<%= rs4.getString("Movie_Name")%>">
                            <img class="khung" src="/OnlineMovieStreaming/<%= rs4.getString("Movie_Picture")%>" alt="<%= rs4.getString("Movie_Name")%>" />
                        </a>
                    </div>
                    <div class="statustop">
                        <span><%= rs4.getString("Movie_Views")%> views</span>
                    </div>
                    <div class="statusbot">
                        <span class="statusbotleft"><%= rs4.getString("Movie_Year")%></span>
                        <span class="statusbotright"><%= rs4.getString("Movie_Length")%></span>
                    </div>
                    <div class="name">
                        <a href="controller?action=detailMovie&id=<%=rs4.getInt("Movie_ID")%>" title="<%= rs4.getString("Movie_Name")%>"><%= rs4.getString("Movie_Name")%></a>
                    </div>
                </div>
            </li>

            <%}%>

        </ul></div>



</div>