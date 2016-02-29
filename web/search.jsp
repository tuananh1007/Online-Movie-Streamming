<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DatabaseConnection"%>
<!DOCTYPE html>
<jsp:include page="/include/header.jsp" flush="true" />

<%
    String keyword = request.getParameter("keyword");
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();

%>
<div class="mainside">
    <div class="block" id="movie-update"><br />
        <div class="blocktitle">
            <div class="icon movie2"></div>
            <h2 class="title">Result of keyword: <%= keyword%></h2>
            <div class="tabs" data-target="#list-movie-update">
            </div>
        </div><br /><br />
        <div class="blockbody" id="list-movie-update">
            <div class="divider"></div>
            <ul class="list-film tab phim-chieu-rap">
                <%
                    String sql4 = null;
                    if (!request.getParameter("keyword").trim().isEmpty()) {

                        sql4 = "select * from movie where Movie_Name like '%" + keyword + "%' or Movie_Actor like '%" + keyword + "%' or Movie_Director like '%" + keyword + "%'";

                    } else {
                        sql4 = "select * from movie ";
                    }
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
                <%
                    }
                %>

            </ul></div></div>
            <jsp:include page="/include/footer.jsp" flush="true" />

