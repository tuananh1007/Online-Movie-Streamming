<%-- 
    Document   : editUser
    Created on : Dec 23, 2015, 2:08:02 PM
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
<div class="bar"><b style="font-size: x-large">Update user information</b><br/></div>

<div style="background-color: white">
    <table class="table" width="100%">
        <tbody><tr> 
                <td class="td">Full name</td>
                <td class="td">User name</td>
                <td class="td">Phone</td>
                <td class="td">Email</td>
                <td class="td">Role</td>
            </tr>
            <%
                DatabaseConnection db = new DatabaseConnection();
                Connection con = db.setConnection();
                String sql = "Select account.User_ID,account.Fullname, account.Username, account.Pass_word, account.Email, account.Phone_Num, role.Role_Name from account INNER JOIN role on account.Role_ID = role.Role_ID WHERE User_ID = '" + request.getParameter("id") + "'";
                ResultSet rs = db.getResult(sql, con);
                while (rs.next()) {%>
            <tr><td class="tdcon"><%=rs.getString("Fullname")%></td>
                <td class="tdcon"><%=rs.getString("Username")%></td>
                <td class="tdcon"><%=rs.getString("Phone_Num")%></td>
                <td class="tdcon"><%=rs.getString("Email")%></td>
                <td class="tdcon"><%=rs.getString("Role_Name")%></td>
            </tr>

        </tbody></table>
</div>


<div class="noidung1">
    <br /><br /><b style="font-size: large; text-align: center">The above table is user's current information</b><br/><br /><br />
    <form action="controller?action=updateUser" method="post">
        <table width="35%" >
            <tr>
                <td height="25">Full name:</td>
                <td><input type="text" name="Fullname" value="<%=rs.getString("Fullname")%>"/></td>
            </tr>
            <tr>
                <td height="25">User name:</td>
                <td><input type="text" name="Username" value="<%=rs.getString("Username")%>"/></td>
            </tr>
            <tr>
                <td height="25">Phone number:</td>
                <td><input type="text" name="Phone_num" value="<%=rs.getString("Phone_Num")%>"/></td>
            </tr>
            <tr>
                <td height="25">Email:</td>
                <td><input type="text" name="Email" value="<%=rs.getString("Email")%>"/></td>
            </tr>
            <tr>
                <td height="25">Role:</td>
                <td><select name="Role" size="1" onChange="replace(this.options.selectedIndex)">

                        <%
                            String sql2 = "Select * from role";
                            ResultSet rs2 = db.getResult(sql2, con);
                            while (rs2.next()) {
                                String currentRole = rs.getString("Role_Name");
                                String newRole = rs2.getString("Role_Name");
                        %>
                        <option value="<%= rs2.getString("Role_ID")%>" <%if (currentRole.equals(newRole)) {%>selected="selected"<%}%>><%= rs2.getString("Role_Name")%></option>
                        <%}%>
                    </select></td>
            </tr>
            <tr>
                <td height="30">
                    <input type="hidden" name="User_ID" value="<%=rs.getInt("User_ID")%>">
                    <input type="hidden" name="Pass_word" value="<%=rs.getString("Pass_word")%>">
                    <input type="submit" name="submit" value="  Update  "></td>
                <td height="30"><a href="controller?action=manageUser"><input type="button" value="  Cancel  " ></a></td>
            </tr>
            
            <%}%>
        </table>
    </form>
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