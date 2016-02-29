<%-- 
    Document   : addPhim
    Created on : Nov 18, 2015, 10:10:19 PM
    Author     : Tuan Anh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link href="css.css" type="text/css" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Online Movie Streaming</title>
    </head>

    <body>
        <div id="wrapper">
            <div id="header">
                <div class="headcontainer">
                    <div class="logo">
                        <a href="/OnlineMovieStreaming"><img src="/OnlineMovieStreaming/logo.png" alt="Online Movie Streaming" title="Online Movie Streaming" /></a>
                    </div></div> 
                <div id="body-wrap" class="container">

                    <div class="td"><center>Add more movie to Website</center></div>
                    <div style="background: white;">
                        <form name="f" action="controller?action=insertMovie" method="post" enctype="multipart/form-data">
                            <table class="table" >
                                <tr >
                                    <td class="tdcon">Name:</td>
                                    <td class="tdcon"><input type="text" name="Movie_Name" /></td>
                                </tr>
                                <tr >
                                    <td class="tdcon">Picture:</td>
                                    <td class="tdcon"><input type="file" name="Movie_Picture" /></td>
                                </tr>
                                <tr >
                                    <td class="tdcon">Actor:</td>
                                    <td class="tdcon"><input type="text" name="Movie_Actor" /></td>
                                </tr>
                                <tr >
                                    <td class="tdcon">Detail:</td>
                                    <td class="tdcon"><textarea name="Movie_Information" rows="20" cols="122"></textarea>
                                    </td>
                                </tr>
                                <tr >
                                    <td class="tdcon">Genre</td>
                                    <td class="tdcon"><select name="Movie_Genre" size="1" onChange="replace(this.options.selectedIndex)">
                                            <%
                                                DatabaseConnection db = new DatabaseConnection();
                                                Connection con = db.setConnection();
                                                String sql3 = "Select * from genre";
                                                ResultSet rs3 = db.getResult(sql3, con);
                                                while (rs3.next()) {
                                            %>
                                            <option value="<%= rs3.getString("ID")%>"><%= rs3.getString("Genre_Name")%></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr >
                                    <td class="tdcon">Director:</td>
                                    <td class="tdcon"><input type="text" name="Movie_Director" /></td>
                                </tr>

                                <tr >
                                    <td class="tdcon">Length:</td>
                                    <td class="tdcon"><input type="text" name="Movie_Length" /></td>
                                </tr>
                                <tr >
                                    <td class="tdcon">Year:</td>
                                    <td class="tdcon"><input type="date" name="Movie_Year" /></td>
                                </tr>
                                <tr >
                                    <td class="tdcon">Place:</td>
                                    <td class="tdcon"><input type="text" name="Movie_Place" /></td>
                                </tr>

                            </table><br />
                            <input type="submit" name="submit" value="Add" />
                            <a href="controller?action=manageMovie"><input type="button" value="Back"/></a>	

                        </form>
                    </div>
                    <div class="bar"><a href="controller?action=manageMovie"><font color="yellow">Back to Manage Movie page</font></a></div>
                </div>
                <div id="footer">
                    <div class="container info">
                        <div class="text"><b>
                                Copyright © 2015 by Group For Fun - All Rights Reserved.<br /></b>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
