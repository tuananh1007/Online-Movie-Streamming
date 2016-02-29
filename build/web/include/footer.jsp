
<%@page import="bean.Genre"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DatabaseConnection"%>
<style>
    #left_ads_float{ margin-left : 30px; bottom: 50px;left: 0px;position: fixed; }
    #right_ads_float{ bottom: 50px;right: 0px;position: fixed;  }
</style>

<script>

    var vtlai_remove_fads = false;
    function check_adswidth()
    {

        var lwidth = parseInt(document.body.clientWidth);
        if (lwidth < 1235)
        {
            document.getElementById('left_ads_float').style.display = 'none';
            document.getElementById('right_ads_float').style.display = 'none';
        }
        else
        {
            document.getElementById('left_ads_float').style.display = 'block';
            document.getElementById('right_ads_float').style.display = 'block';
        }
        setTimeout('check_adswidth()', 10);

    }

</script>

<!-- START QC SLide start 31/9  -->
<div id="left_ads_float" style="display: block;">

    <iframe src="/OnlineMovieStreaming/quang-cao/images/trai.gif" width="160" height="600" frameborder="0" scrolling="no"></iframe>

</div>

<div id="right_ads_float" style="display: block;">

    <iframe src="/OnlineMovieStreaming/quang-cao/images/phai.gif" width="160" height="600" frameborder="0" scrolling="no"></iframe>

</div>
<!-- END - QC SLide  -->

<script> check_adswidth();</script>
<div id="sidebar">


    <div class="thongke">
        <div class="block" id="chart">
            <div class="blocktitle">        
                <div class="tabs" data-target="#topview">                        
                    <div class="tab">Genre</div>
                </div>            
            </div>
            <div class="blockbody" id="topview">
                <ul class="tab topviewday ">

                    <%
                        DatabaseConnection db = new DatabaseConnection();
                        Connection con = db.setConnection();
                        String sql = "Select * from genre";
                        ResultSet rs = db.getResult(sql, con);

                        while (rs.next()) {
                            String ID = rs.getString("ID");
                            String Genre_Name = rs.getString("Genre_Name");


                    %>

                    <li><span class="st top">TL</span>
                        <div class="detail">
                            <div class="name" style="color: #FFF">
                                <a href="controller?action=genre&id=<%= ID%>"><%= Genre_Name%></a></div>      
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </div>



    <div class="thongke">
        <div class="block" id="chart">
            <div class="blocktitle">        
                <div class="tabs" data-target="#topview">                        
                    <div class="tab">WebSite's Statistics: </div>
                </div>            
            </div>
            <div class="blockbody" id="topview">
                <ul class="tab topviewday ">
                    <%
                        String sql1 = "Select count(*) from movie";
                        ResultSet rs1 = db.getResult(sql1, con);
                        String sql2 = "Select count(*) from account";
                        ResultSet rs2 = db.getResult(sql2, con);
                        while (rs1.next()) {
                    %>
                    <li style="color: white">Number of movie : <%= rs1.getString("count(*)")%></li>
                        <%}
                            while (rs2.next()) {
                        %>
                    <li style="color: white">Number of member: <%= rs2.getString("count(*)")%></li>
                        <%}
                        %>
                </ul></div></div></div>
    <div class="quangcao">
        <img src="/OnlineMovieStreaming/quang-cao/event-free-ship.png" style="width: 298px;" />
    </div></div></div>
<div id="footer">
    <div id="fb-root"></div>
    <div class="container info">
        <div class="text">
            <b>Copyright © 2015 by MovieHD - All Rights Reserved</b>
            <div class="fb-follow" data-href="https://www.facebook.com/Movie-HD-1689438874646476" data-layout="standard" data-show-faces="false"></div>
        </div>
    </div>
</div>
</body>    
</html>

