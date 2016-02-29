
<jsp:include page="../admin/header.jsp" flush="true" />
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DatabaseConnection"%>
<%
    String isStaff = (String) session.getAttribute("isStaff");
    if (isStaff.equals("true")) {
%>
<div class="td"><center>Add more movie to Website</center></div>
<div style="background: white;">
    <form name="f" action="controller?action=insertMovie" method="post" enctype="multipart/form-data">
        <!--<form name="f" action="controller?action=insertMovie" method="post">-->
        <table class="table" >
            <tr >
                <td class="tdcon">Name:</td>
                <td class="tdcon"><input type="text" name="MovieName" /></td>
            </tr>
            <tr >
                <td class="tdcon">Picture:</td>
                <td class="tdcon"><input type="file" name="MoviePicture" /></td>
            </tr>
            <tr >
                <td class="tdcon">Actor:</td>
                <td class="tdcon"><input type="text" name="MovieActor" /></td>
            </tr>
            <tr >
                <td class="tdcon">Detail:</td>
                <td class="tdcon"><textarea name="MovieInformation" rows="20" cols="122"></textarea>
                </td>
            </tr>
            <tr >
                <td class="tdcon">Genre</td>
                <td class="tdcon"><select name="MovieGenre" size="1" onChange="replace(this.options.selectedIndex)">
                        <%
                            DatabaseConnection db = new DatabaseConnection();
                            Connection con = db.setConnection();
                            String sql3 = "Select * from genre";
                            ResultSet rs3 = db.getResult(sql3, con);
                            while (rs3.next()) {
                        %>
                        <option value="<%= rs3.getString("ID")%>"><%= rs3.getString("Genre_Name")%></option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr >
                <td class="tdcon">Director:</td>
                <td class="tdcon"><input type="text" name="MovieDirector" /></td>
            </tr>

            <tr >
                <td class="tdcon">Length:</td>
                <td class="tdcon"><input type="text" name="MovieLength" /></td>
            </tr>
            <tr >
                <td class="tdcon">Year:</td>
                <td class="tdcon"><input type="date" name="MovieYear" /></td>
            </tr>
            <tr >
                <td class="tdcon">Place:</td>
                <td class="tdcon"><input type="text" name="MoviePlace" /></td>
            </tr>
            <tr >
                <td class="tdcon">Links:</td>
                <td class="tdcon"><input type="file" name="MovieLinks" /></td>
            </tr>
        </table><br />
        <input type="submit" name="submit" value="Add more" style="padding: 5px; margin-left: 50px; margin-bottom: 10px"/>
        <input type="button" value="Go back" style="padding: 5px; margin-left: 50px; margin-bottom: 10px"/>

    </form>
</div>
<div class="bar"><a href="controller?action=manageMovie"><font color="yellow">Back to Manage Movie page</font></a></div>


<%} else {%>
<div class="noidung">
    <h1>You don't have permissions to access this page</h1>
</div>
<div class="bar2">
    <a href="controller?action=error"><font color="yellow">Back to Homepages </font></a></div>
</div>
<%}%>
<jsp:include page="../admin/footer.jsp" flush="true" />