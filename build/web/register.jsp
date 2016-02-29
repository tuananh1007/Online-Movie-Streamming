<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign Up</title>
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

                    <div class="panel-heading">Register</div>
                    <div class="panel-body">

                        <%if (user == " ") {%>	
                        <form role="form" action="controller" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Username" name="u_name" id="u_name" type="text" onkeyup="loadXMLDoc()" autocomplete="off" autofocus="">
                                    &nbsp;&nbsp; <span style="color:orangered" id="err"><%=error%></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="pass" id="pass" type="password" value="">
                                    &nbsp;&nbsp; <span style="color:orangered" id="pass_error" class="error"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Confirm Password" name="re_pass" id="re_pass" type="password" value="">
                                    &nbsp;&nbsp; <span style="color:orangered" id="re_pass_error" class="error"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Email Address" name="email" id="email" type="text" value="">
                                    &nbsp;&nbsp; <span style="color:orangered" id="email_error" class="error"></span> 
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Fullname" name="fullname" id="fullname" type="text" value="">
                                    &nbsp;&nbsp; <span style="color:orangered" id="fullname_error" class="error"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Telephone" name="phone" id="phone" type="text" value="">
                                    &nbsp;&nbsp; <span style="color:orangered" id="phone_error" class="error"></span>
                                </div>
                                <input type="hidden" name="action" value="register">
                            <input type="submit" value = "Sign Up" onclick="return validation()" class="btn btn-primary"/></form>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="controller?action=log">Already have an account? Login now</a>
                        </fieldset>

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
