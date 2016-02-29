<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Log In</title>
        <%@ include file="import.jsp" %>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">
    </head>

    <body>

        <div class="row">
            <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-body">

                        <em><FONT SIZE="3">Welcome to Online Movie Streaming </font></em>
                    </div>
                </div>
                <div class="login-panel panel panel-default">

                    <div class="panel-heading">Log in</div>
                    <div class="panel-body">

                        <%if (user == " ") {%>	
                        <form name="myForm" action="controller" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Username" name="u_name" id="username" type="text" autocomplete="off" autofocus="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="pass" id="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <div style="color:#0000FF" id="error"></div>
                                    <div style="color:#0000FF" id="myDiv"></div>
                                </div>


                                <div id="fb-root"></div>
                                <script>(function (d, s, id) {
                                        var js, fjs = d.getElementsByTagName(s)[0];
                                        if (d.getElementById(id))
                                            return;
                                        js = d.createElement(s);
                                        js.id = id;
                                        js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=463974190461658";
                                        fjs.parentNode.insertBefore(js, fjs);
                                    }(document, 'script', 'facebook-jssdk'));</script>
                                <div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="true" data-scope="public_profile,email">Login with Facebook</div>
                                

                                <br/><br/><input type="button" onclick="loadXML()" name="action"  class="btn btn-primary" value="Login"/>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="controller?action=reg">Don't have an account?</a> |
                                <a href="controller?action=lost">Forget password?</a>

                            </fieldset>
                        </form>
                        <%}%>
                        <%if (user != " ") {%>
                        You already logged in - please come <a href="controller?action=cancel">back</a>
                        <%}%>
                    </div>
                </div>

            </div><!-- /.col-->
        </div><!-- /.row -->	
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/chart.min.js"></script>
        <script src="js/chart-data.js"></script>
        <script src="js/easypiechart.js"></script>
        <script src="js/easypiechart-data.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
    </body>

</html>
