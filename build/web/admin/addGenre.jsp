
<jsp:include page="../admin/header.jsp" flush="true" />
<%
    String isStaff = (String) session.getAttribute("isStaff");
    if (isStaff.equals("true")) {
%>
<br /><br />
<div class="bar"><b>Add Genre </b></div>
<div class="noidung"><br /><br />
    <form name="f" action="controller?action=insertGenre" method="POST"> 
        Genre name: <input type="text" name="genre" />
        <br /><br /><input type="submit" name="submit"  value="Add more"/>
        <a href="controller?action=manageGenre"><input type="button" value="Back" name="back" /></a>
    </form>
    <br /><br />
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