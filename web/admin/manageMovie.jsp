
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DatabaseConnection"%>
<jsp:include page="../admin/header.jsp" flush="true" />

<%
    String isStaff = (String) session.getAttribute("isStaff");
    if (isStaff.equals("true")) {
%>

<div style="background: white;">

    <div class="bar">
        <p style="font-size: x-large; text-align: center;">Manage Movie</p><br>
        <img src="/OnlineMovieStreaming/giao-dien/images/new.gif"> <a href="controller?action=addMovie"><font color="yellow">Add more movie to WebSite</font></a> <img src="/OnlineMovieStreaming/giao-dien/images/new.gif"><br>
    </div>

    <table class="table" >
        <tr align="center">
            <td class="td">Name</td>
            <td class="td">Director</td>
            <td class="td">Actor</td>
            <td class="td">Year</td>
            <td class="td">Place</td>
            <td class="td">Genre</td>
            <td class="td">Length</td>
            <td class="td">Picture</td>
            <td class="td">Details</td>
            <td class="td">Action</td>   
        </tr>
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

        <tr align="center">
            <td class="tdcon"><%=rs4.getString("Movie_Name")%></td>
            <td class="tdcon"><%=rs4.getString("Movie_Director")%></td>
            <td class="tdcon"><%=rs4.getString("Movie_Actor")%></td>
            <td class="tdcon"><%=rs4.getString("Movie_Year")%></td>
            <td class="tdcon"><%=rs4.getString("Movie_Place")%></td>
            <td class="tdcon"><%=rs4.getString("Movie_Genre")%></td>
            <td class="tdcon"><%=rs4.getString("Movie_Length")%></td>
            <td class="tdcon"><img src="/OnlineMovieStreaming/<%= rs4.getString("Movie_Picture")%>" height="150" width="150"/></td>
            <td class="tdcon"><%=rs4.getString("Movie_Information")%></td>
            <td class="tdcon"><div align="center">
                    <a href="controller?action=editMovie&movie=<%=rs4.getString("Movie_Name")%>">Edit</a><br /><br />
                    <a href="controller?action=deleteMovie&movie=<%=rs4.getString("Movie_Name")%>" onClick="return confirm('Are you sure to delete?');">Delete</a>	
                </div></td>
        </tr>
        <% }%>
    </table>    
    <div class="bar">
        <a href="controller?action=admin"><font color="yellow">Back to Admin Center</font></a></div>
</div>
</div>
<%} else {%>
<div class="noidung">
    <h1>You don't have permissions to access this page</h1>
</div>
<div class="bar2" style="background-color: none;">
    <a href="controller?action=error"><font color="yellow">Back to Homepages </font></a></div>
</div>
<%}%>

<jsp:include page="../admin/footer.jsp" flush="true" />
