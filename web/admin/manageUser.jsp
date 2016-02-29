<%-- 
    Document   : listuser
    Created on : Dec 23, 2015, 1:48:21 PM
    Author     : Tuan Anh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="db.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>

<jsp:include page="../admin/header.jsp" flush="true" />


<%
    String admin = (String) session.getAttribute("isAdmin");
    if (admin.equals("true")) {
%>
<div class="bar">Manage User</div>

<div style="background: white;">
    <table class="table" width="100%">
        <tbody><tr> 
                <td class="td">Full name</td>
                <td class="td">User name</td>
                <td class="td">Phone</td>
                <td class="td">Email</td>
                <td class="td">Role</td>
                <td class="td">Edit</td>
                <td class="td">Delete</td>
            </tr>
            <%
                DatabaseConnection db = new DatabaseConnection();
                Connection con = db.setConnection();
//                String sql = "Select * from account where Role_ID != 1";
                String sql = "Select account.User_ID,account.Fullname, account.Username, account.Pass_word, account.Email, account.Phone_Num, role.Role_Name from account INNER JOIN role on account.Role_ID = role.Role_ID WHERE account.Role_ID != 1 ";
                ResultSet rs = db.getResult(sql, con);
                while (rs.next()) {%>
            <tr><td class="tdcon"><%=rs.getString("Fullname")%></td>
                <td class="tdcon"><%=rs.getString("Username")%></td>
                <td class="tdcon"><%=rs.getString("Phone_Num")%></td>
                <td class="tdcon"><%=rs.getString("Email")%></td>
                <td class="tdcon"><%=rs.getString("Role_Name")%></td>
                <td class="tdcon"><a href="controller?action=editUser&id=<%=rs.getString("User_ID")%>">Edit</a></td>
                <td class="tdcon"><a href="controller?action=deleteUser&id=<%=rs.getString("User_ID")%>" onClick="return confirm('Are you sure to delete this user?');">Delete</a></td>
            </tr>
            <%}%>
        </tbody></table>
    <div class="bar">
        <a href="controller?action=admin"><font color="yellow">Back to Admin Center</font></a></div>
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