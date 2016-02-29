

<%@page import="java.util.ArrayList"%>
<%@page import="bean.*"%>
<script type="text/javascript" src="js/js.js"></script>

<%

    String user = (String) session.getAttribute("user");
    if (user == null) {
        user = " ";

    }

    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        userId = " ";

    }

    String admin = (String) request.getAttribute("admin");
    if (admin == null) {
        admin = " ";
    }
    String error = (String) request.getAttribute("error");
    if (error == null) {
        error = "";
    }

    String error2 = (String) request.getAttribute("error2");
    if (error2 == null) {
        error2 = "";
    }

    String mess = (String) request.getAttribute("message");
    if (mess == null) {
        mess = "";
    }

    String sucess = (String) request.getAttribute("sucess");
    if (sucess == null) {
        sucess = "";
    }

    String userName = null;
    ArrayList<User> User_infor = (ArrayList<User>) request.getAttribute("User_infor");
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            Cookie cookie = cookies[i];
            if (cookie.getName().equals("user")) {
                userName = cookie.getValue();
            }
        }
    }

%>









