
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DatabaseConnection"%>
<jsp:include page="../admin/header.jsp" flush="true" />
<%
    String isStaff = (String) session.getAttribute("isStaff");
    if (isStaff.equals("true")) {
        DatabaseConnection db = new DatabaseConnection();
        Connection con = db.setConnection();
        String sql3 = "Select * from movie where Movie_Name='" + request.getParameter("movie") + "'";
        ResultSet rs3 = db.getResult(sql3, con);
        while (rs3.next()) {
%>


<div style="background: white;">
    <form name="f" action="controller?action=updateMovie" method="POST" enctype="multipart/form-data">

        <div class="bar">Edit movie : <%= rs3.getString("Movie_Name")%></div>
        <table class="table" width="100%">
            <tr >
                <td class="tdcon">Name:</td>
                <td class="tdcon"><input type="text" name="MovieName" value="<%= rs3.getString("Movie_Name")%>"/></td>
            </tr>
            <tr >
                <td class="tdcon">Picture:</td>
                <td class="tdcon"><input type="file" name="MoviePicture" /></td>
            </tr>
            <tr >
                <td class="tdcon">Actor:</td>
                <td class="tdcon"><input type="text" name="MovieActor" value="<%= rs3.getString("Movie_Actor")%>"/></td>
            </tr>
            <tr >
                <td class="tdcon">Detail:</td>
                <td class="tdcon"><textarea name="MovieInformation" rows="20" cols="122" ><%= rs3.getString("Movie_Information")%></textarea>
                </td>
            </tr>
            <tr >
                <td class="tdcon">Genre</td>
                <td class="tdcon"><select name="MovieGenre" size="1" onChange="replace(this.options.selectedIndex)">

                        <%
                            String sql4 = "Select * from genre";
                            ResultSet rs4 = db.getResult(sql4, con);
                            while (rs4.next()) {
                        %>
                        <option value="<%= rs4.getString("ID")%>"><%= rs4.getString("Genre_Name")%></option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr >
                <td class="tdcon">Director:</td>
                <td class="tdcon"><input type="text" name="MovieDirector" value="<%= rs3.getString("Movie_Director")%>"/></td>
            </tr>
            <tr >
                <td class="tdcon">Length:</td>
                <td class="tdcon"><input type="text" name="MovieLength" value="<%= rs3.getString("Movie_Length")%>"/></td>
            </tr>
            <tr >
                <td class="tdcon">Year:</td>
                <td class="tdcon"><input type="date" name="MovieYear" value="<%= rs3.getString("Movie_Year")%>"/></td>
            </tr>
            <tr >
                <td class="tdcon">Place:</td>
                <td class="tdcon"><input type="text" name="MoviePlace" value="<%= rs3.getString("Movie_Place")%>"/></td>
            </tr>
            <tr >
                <td class="tdcon">Links:</td>
                <td class="tdcon"><input type="file" name="MovieLinks" /></td>
            </tr>

        </table> 
        <br/>

        <input type="submit" name="submit" value="  Edit  " />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="controller?action=manageMovie"><input type="button" value="  Back  "/></a>
        <input type="hidden" name="oldName" value="<%=request.getParameter("movie")%>">
        <input type="hidden" name="MovieID" value="<%=rs3.getInt("Movie_ID")%>">
        <!--<input type="hidden" name="MoviePicture" value="">-->
        <input type="hidden" name="MovieView" value="<%=rs3.getInt("Movie_Views")%>">
        <%}%>
    </form>
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