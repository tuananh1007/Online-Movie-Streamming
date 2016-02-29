
<%@page import="java.sql.PreparedStatement"%>
<jsp:include page="/include/header.jsp" flush="true" />

<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DatabaseConnection"%>

<%
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();
    String Id = request.getParameter("id");
    String sql = "Select * from movie where Movie_ID = " + Id;
    ResultSet rs = db.getResult(sql, con);

    while (rs.next()) {
        String sql3 = "Select * from genre where Id=" + rs.getString("Movie_Genre");
        ResultSet rs3 = db.getResult(sql3, con);
%>

<div id="content">
    <div class="block" id="page-info">
        <div class="watch">
            <br />
            <div class="blocktitle breadcrumbs"><div class="item"><span><img src="/OnlineMovieStreaming/giao-dien/images/new.gif" /> Watching : <%= rs.getString("Movie_Name")%></span></div> </div>
            <div>
                <div class="info hreview-aggregate">
                    <div class="divider"></div>
                    <div class="poster">
                        <img src="/OnlineMovieStreaming/<%= rs.getString("Movie_Picture")%>" alt="<%= rs.getString("Movie_Name")%>" />
                    </div>
                    <div class="col2">
                        <h2 class="title fn"><font color="white">Name : <%= rs.getString("Movie_Name")%></font></h2><dl>
                            <dt><font color="white">Director :</dt><dd><%= rs.getString("Movie_Director")%></font></dd>
                            <dt><font color="white">Actor :</dt><dd><%= rs.getString("Movie_Actor")%></font></dd>
                            <dt><font color="white">Country :</dt><dd><%= rs.getString("Movie_Place")%></font></dd>
                            <dt><font color="white">Year :</dt><dd><%= rs.getString("Movie_Year")%></font></dd>
                            <dt><font color="white">Length :</dt><dd><%= rs.getString("Movie_Length")%></font></dd>
                            <dt><font color="white">Views :</dt><dd><%= rs.getString("Movie_Views")%> views</font></dd>
                            <%
                                while (rs3.next()) {
                            %>
                            <dt><font color="white">Genre :</dt><dd><%= rs3.getString("Genre_Name")%></font></dd>
                            <%}%>
                            <a href="controller?action=watching&id=<%= rs.getString("Movie_ID")%>" alt="<%= rs.getString("Movie_Name")%>" ><img src="/OnlineMovieStreaming/giao-dien/images/xemphim.png" /></a>
                    </div>
                </div>
            </div>
            <div class="detail">
                <div class="blocktitle">
                    <div class="tabs">
                        <div class="tab">Movie Detail: </div>
                    </div>
                </div>
                <div class="noidungphim">
                    <font color="white"><p><%= rs.getString("Movie_Information")%></p></font></div>
            </div>
        </div>


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

                String sql5 = "Select * from movie where Movie_Genre = " + rs.getString("Movie_Genre") + " and Movie_ID != " + rs.getString("Movie_ID");
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
                
    <jsp:include page="/include/footer.jsp" flush="true" />