<%-- 
    Document   : center
    Created on : Nov 18, 2015, 5:02:31 AM
    Author     : Tuan Anh
--%>
<%
    String isStaff = (String) session.getAttribute("isStaff");
    if (isStaff.equals("true")) {
%>
<div class="noidung"><h1> Welcome to Administrator's page</h1></div>
<div class="menu"><img src="/OnlineMovieStreaming/giao-dien/images/new.gif" /> <a href="controller?action=manageUser"><font color="white">Manage user</font></a></div>
<div class="menu"><img src="/OnlineMovieStreaming/giao-dien/images/new.gif" /> <a href="controller?action=manageMovie"><font color="white">Manage movie</font></a></div>
<div class="menu"><img src="/OnlineMovieStreaming/giao-dien/images/new.gif" /> <a href="controller?action=manageGenre"><font color="white">Manage genre</font></a></div>
<div class="menu"><img src="/OnlineMovieStreaming/giao-dien/images/new.gif" /> <a href="controller?action=logout"><font color="white">Log out</font></a></div>
</div>
<%} else {%>
<div class="noidung">
    <h1>You don't have permissions to access this page</h1>
</div>
<div class="bar2">
    <a href="controller?action=error"><font color="yellow">Back to Homepages </font></a></div>
</div>
<%}%>