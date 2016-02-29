
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Recovery Page</title>
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
                    <div class="panel-heading">Input correct username</div>
                    <div class="panel-body">
                        <form action="controller?action=recovery" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Fill in & Hit enter" name="u_name" type="text" autocomplete="off" autofocus="">                                         
                                </div>	
                            </fieldset>
                        </form>
                        <a href="/OnlineMovieStreaming">Click here to come back homepages !!!!</a>
                    </div>
                </div>
            </div><!-- /.col-->
        </div><!-- /.row -->	

    </body>

</html>
