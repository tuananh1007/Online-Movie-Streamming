
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
        <p style="font-size: x-large; text-align: center;">Manage Genre</p><br>
        <img src="/OnlineMovieStreaming/giao-dien/images/new.gif"> <a href="controller?action=addGenre"><font color="yellow">Add more genre to WebSite</font></a> <img src="/OnlineMovieStreaming/giao-dien/images/new.gif">
    </div>

    <table border="1" class="table" width="100%">
            <td class="td"><center>Genre name</center></td>
        <td class="td"><center>Action</center></td>
        </tr>
        <%
            DatabaseConnection db = new DatabaseConnection();
            Connection con = db.setConnection();
            String sql = "select * from genre ";
            ResultSet rs = db.getResult(sql, con);
            while (rs.next()) {
        %>
        <tr>
            <td class="tdcon"><center><%= rs.getString("Genre_Name")%></center></td>
        <td class="tdcon"><center>
            <a href="controller?action=editGenre&genre=<%=rs.getString("Genre_Name")%>">Edit</a> | 
            <a href="controller?action=deleteGenre&genre=<%=rs.getString("Genre_Name")%>" onClick="return confirm('Are you sure to delete?');">Delete</a>	
        </center>
        </td>
        </tr>
        <%}%>
    </table>
    <div class="bar">
        <a href="controller?action=admin"><font color="yellow">Back to Admin Center</font></a></div>
</div>
        
        
<%} else {%>
<div class="noidung">
    <h1>You don't have permissions to access this page</h1>
</div>
<div class="bar2">
    <a href="controller?action=error"><font color="yellow">Back to Homepages </font></a></div>
</div>
<%}%>
<jsp:include page="../admin/footer.jsp" flush="true" />