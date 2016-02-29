<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DatabaseConnection"%>
<jsp:include page="../admin/header.jsp" flush="true" />
<%
    String isStaff = (String) session.getAttribute("isStaff");
    if (isStaff.equals("true")) {
%>
<%
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();
    String sql = "Select * from genre where Genre_Name='" + request.getParameter("genre") + "'";
    ResultSet rs = db.getResult(sql, con);
    while (rs.next()) {
%>
<div class="bar"><b>Edit genre</b></div>
<div class="noidung1"><br /><br />
    <form name="f" action="controller?action=updateGenre" method="POST">
        
        <table width="35%" >
            <tr>
                <td height="30">Genre name:</td>
                <td><input type="text" name="newGenre"  value="<%= rs.getString("Genre_Name")%>" ></td>
            </tr>
            <tr>
                <td height="30"><input type="submit" value="  Edit  " name="submit" /></td>
                <td height="30"><a href="controller?action=manageGenre"><input type="button" value="  Back  " name="back" /></a></td>
            </tr>
        </table>
    </form>
</div>
        
        
<%}%>
<%} else {%>
<div class="noidung">
    <h1>You don't have permissions to access this page</h1>
</div>
<div class="bar2">
    <a href="controller?action=error"><font color="yellow">Back to Homepages </font></a></div>
</div>
<%}%>
<jsp:include page="../admin/footer.jsp" flush="true" />