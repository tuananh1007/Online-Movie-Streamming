/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import utilities.*;
import bean.*;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.SQLException;

import java.util.ArrayList;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.Part;
import com.oreilly.servlet.multipart.FilePart;
import db.DatabaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Enumeration;
import java.util.LinkedList;
import javax.servlet.annotation.MultipartConfig;

@WebServlet(name = "controller", urlPatterns = {"/controller"})
//@MultipartConfig
public class controller extends HttpServlet {

    final private String log = "login.jsp";
    final private String reg = "register.jsp";
    final private String update = "update.jsp";
    final private String lost = "lost.jsp";
    final private String index = "index.jsp";
    final private String search = "search.jsp";
    final private String admin = "/admin/index.jsp";
    final private String manageMovie = "/admin/manageMovie.jsp";
    final private String editMovie = "/admin/editMovie.jsp";
//    final private String deleteMovie = "/admin/deleteMovie.jsp";
    final private String addMovie = "admin/addMovie.jsp";
    final private String manageGenre = "/admin/manageGenre.jsp";
    final private String editGenre = "/admin/editGenre.jsp";
//    final private String delteGenre = "/admin/delteGenre.jsp";
    final private String addGenre = "/admin/addGenre.jsp";
    final private String manageUser = "/admin/manageUser.jsp";
    final private String editUser = "/admin/editUser.jsp";

    final private String detailMovie = "movieDetail.jsp";
    final private String watching = "watching.jsp";
    final private String genre = "genre.jsp";

    private final String dirNames = "C:/Users/Admin/Documents/NetBeansProjects/OnlineMovieStreaming/web/upload";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     * @throws java.lang.InstantiationException
     * @throws java.lang.IllegalAccessException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            String action = request.getParameter("action");

            switch (action) {
                case "admin":
                    dispatcher(request, response, admin);
                    break;
                case "search":
                    dispatcher(request, response, search);
                    break;
                case "detailMovie":
                    dispatcher(request, response, detailMovie);
                    break;
                case "genre":
                    dispatcher(request, response, genre);
                    break;
                case "watching":
                    dispatcher(request, response, watching);
                    break;
                case "manageUser":
                    dispatcher(request, response, manageUser);
                    break;
                case "editUser":
                    dispatcher(request, response, editUser);
                    break;
                case "updateUser":
                    DAO updateUser = new DAO();
                    updateUser.updateUser(request.getParameter("User_ID"), request.getParameter("Fullname"), request.getParameter("Username"),
                            request.getParameter("Pass_word"), request.getParameter("Email"), request.getParameter("Phone_num"), request.getParameter("Role"));
                    dispatcher(request, response, manageUser);
                    break;
                case "deleteUser":
                    DAO deleteUser = new DAO();
                    deleteUser.deleteUser(request.getParameter("id"));
                    dispatcher(request, response, manageUser);
                    break;
                case "manageMovie":
                    dispatcher(request, response, manageMovie);
                    break;
                case "editMovie":
                    dispatcher(request, response, editMovie);
                    break;
                case "updateMovie": //not yet

                    String MovieFile1 = null;
                    LinkedList<String> list1 = new LinkedList<>();
                    LinkedList<String> listFile1 = new LinkedList<>();
                    try {
                        MultipartRequest multi
                                = new MultipartRequest(request, dirNames, 512 * 1024 * 1024); // 512MB
                        out.println("Params:");
                        Enumeration params = multi.getParameterNames();
                        while (params.hasMoreElements()) {
                            String name = (String) params.nextElement();
                            String value = multi.getParameter(name);
                            list1.add(value);
                        }
//                        File file = null, file2 = null;
//                        DatabaseConnection db = new DatabaseConnection();
//                        Connection con = db.setConnection();
//                        String sql3 = "Select * from movie where Movie_Name='" + list1.get(0) + "'";
//                        ResultSet rs3 = db.getResult(sql3, con);
//                        while (rs3.next()) {
//                            file = new File("C:/Users/Admin/Documents/NetBeansProjects/OnlineMovieStreaming/web/" + rs3.getString("Movie_Picture"));
//                            file2 = new File("C:/Users/Admin/Documents/NetBeansProjects/OnlineMovieStreaming/web/" + rs3.getString("Movie_Links"));
//                            file.delete();
//                            file2.delete();
//                        }

                        Enumeration files = multi.getFileNames();
                        while (files.hasMoreElements()) {
                            String name = (String) files.nextElement();
                            MovieFile1 = multi.getFilesystemName(name);
                            listFile1.add(MovieFile1);
//                            if (!file.getName().equals(listFile1.get(0))) {
//                                file.delete();
//                            }
//                            if (!file2.getName().equals(listFile1.get(0))) {
//                                file2.delete();
//                            }
                            String type = multi.getContentType(name);
                            File f = multi.getFile(name);
                            out.println("name: " + name);
                            out.println("filename: " + MovieFile1);
                            out.println("type: " + type);
                            if (f != null) {
                                out.println("f.toString(): " + f.toString());
                                out.println("f.getName(): " + f.getName());
                                out.println("f.exists(): " + f.exists());
                                out.println("f.length(): " + f.length());
                                out.println();
                            }
                        }

//                        file.delete();
//                        file2.delete();
                    } catch (IOException lEx) {
                        this.getServletContext().log(lEx, "error reading or saving file");
                    }

                    DAO updateMo = new DAO();
                    updateMo.updateMovie(list1.get(0), list1.get(1), list1.get(5), list1.get(2), list1.get(8),
                            list1.get(11), list1.get(9), list1.get(7), list1.get(4), list1.get(6),
                            "upload/" + listFile1.get(1), request.getParameter("MovieView"), "upload/" + listFile1.get(0));

//                    DAO updateMo = new DAO();
//                    updateMo.updateMovie(request.getParameter("oldName"), request.getParameter("MovieName"),
//                            request.getParameter("MovieActor"), request.getParameter("MovieInformation"), request.getParameter("MovieGenre"),
//                            request.getParameter("MovieDirector"), request.getParameter("MovieLength"), request.getParameter("MovieYear"),
//                            request.getParameter("MoviePlace"), request.getParameter("MovieID"), request.getParameter("MoviePicture"), request.getParameter("MovieView"));
//                    
                    dispatcher(request, response, manageMovie);
                    break;

                case "deleteMovie":
                    DAO deleteMo = new DAO();
                    deleteMo.deleteMovie(request.getParameter("movie"));
                    dispatcher(request, response, manageMovie);
                    break;
                case "addMovie":
                    dispatcher(request, response, addMovie);
                    break;
                case "insertMovie": //not yet

                    String MovieFile = null;
                    LinkedList<String> list = new LinkedList<>();
                    LinkedList<String> listFile = new LinkedList<>();
                    try {
                        MultipartRequest multi
                                = new MultipartRequest(request, dirNames, 512 * 1024 * 1024); // 512MB
                        out.println("Params:");
                        Enumeration params = multi.getParameterNames();
                        while (params.hasMoreElements()) {
                            String name = (String) params.nextElement();
                            String value = multi.getParameter(name);
                            list.add(value);
                        }
                        out.println();

                        out.println("Files:");
                        Enumeration files = multi.getFileNames();
                        while (files.hasMoreElements()) {
                            String name = (String) files.nextElement();
                            MovieFile = multi.getFilesystemName(name);
                            listFile.add(MovieFile);
                            String type = multi.getContentType(name);
                            File f = multi.getFile(name);
                            out.println("name: " + name);
                            out.println("filename: " + MovieFile);
                            out.println("type: " + type);
                            if (f != null) {
                                out.println("f.toString(): " + f.toString());
                                out.println("f.getName(): " + f.getName());
                                out.println("f.exists(): " + f.exists());
                                out.println("f.length(): " + f.length());
                                out.println();
                            }
                        }
                    } catch (IOException lEx) {
                        this.getServletContext().log(lEx, "error reading or saving file");
                    }

                    DAO insertMo = new DAO();
                    insertMo.insertMovie(list.get(0), "upload/" + listFile.get(1), list.get(4),
                            list.get(1), list.get(6), list.get(8), list.get(7), list.get(5), list.get(3), "0", "upload/" + listFile.get(0));
                    dispatcher(request, response, manageMovie);
                    break;

                case "manageGenre":
                    dispatcher(request, response, manageGenre);
                    break;
                case "editGenre":
                    dispatcher(request, response, editGenre);
                    break;
                case "updateGenre":
                    DAO updateGen = new DAO();
                    updateGen.updateGenre(request.getParameter("newGenre"), request.getParameter("oldGenre"));
                    dispatcher(request, response, manageGenre);
                    break;
                case "deleteGenre":
                    DAO deleteGen = new DAO();
                    deleteGen.deleteGenre(request.getParameter("genre"));
                    dispatcher(request, response, manageGenre);
                    break;
                case "addGenre":
                    dispatcher(request, response, addGenre);
                    break;
                case "insertGenre":
                    DAO insertGen = new DAO();
                    insertGen.addGenre(request.getParameter("genre"));
                    dispatcher(request, response, manageGenre);
                    break;
                case "cancel":
                    dispatcher(request, response, index);
                    break;
                case "index":
                    dispatcher(request, response, index);
                    break;
                case "error":
                    dispatcher(request, response, index);
                    break;
                case "done":
                    dispatcher(request, response, index);
                    break;
                case "log":
                    dispatcher(request, response, log);
                    break;
                case "lost":
                    dispatcher(request, response, lost);
                    break;
                case "reg":
                    dispatcher(request, response, reg);
                    break;
                case "update": {
                    User show = new User();
                    ArrayList<User> result = show.displayPersonalInformation((String) session.getAttribute("user"));
                    request.setAttribute("User_infor", result);
                    dispatcher(request, response, update);
                    break;
                }
                case "checklogin": {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String hashPass = Security.encrypt(password);
                    DAO checklog = new DAO();
                    boolean result = checklog.checkLogin(username, hashPass);
                    if (result) {
                        out.print("Login successful");
                    } else {
                        out.print("Wrong user or password");
                    }
                    break;
                }
                case "Login": {
                    String username = request.getParameter("u_name");
                    User user = new User();
                    ArrayList<User> uname = user.getUser(username);
                    ArrayList<User> userAds = user.displayPersonalInformation(username);
                    String id = "";
                    for (User u : uname) {
                        id = u.getUser_ID();
                    }
                    boolean isAdmin = isAdmin(userAds);
                    boolean isStaff = isStaff(userAds);
                    if (isAdmin) {
                        session.setMaxInactiveInterval(900);
                        session.setAttribute("user", username);
                        session.setAttribute("isAdmin", "true");
                        session.setAttribute("isStaff", "true");
                        dispatcher(request, response, admin);
                        break;
                    } else if (isStaff) {
                        session.setMaxInactiveInterval(900);
                        session.setAttribute("user", username);
                        session.setAttribute("isAdmin", "false");
                        session.setAttribute("isStaff", "true");
                        dispatcher(request, response, admin);
                        break;
                    } else {
                        session.setMaxInactiveInterval(900);
                        session.setAttribute("user", username);
                        session.setAttribute("isAdmin", "false");
                        session.setAttribute("isStaff", "false");
                        dispatcher(request, response, index);
                        break;
                    }
                }
                case "logout":
                    boolean x = true;
                    Cookie loginCookie = null;
                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("user")) {
                                loginCookie = cookie;
                            }
                        }

                        if (loginCookie != null) {
                            loginCookie.setMaxAge(0);
                            response.addCookie(loginCookie);
                            x = false;
                        }
                    }
                    if (session != null) {

                        session.invalidate();
                        x = false;
                    }
                    if (x == false) {
                        dispatcher(request, response, index);
                    }
                    break;
                case "checkuser": {
                    String username = request.getParameter("ver");
                    DAO checkuser = new DAO();
                    boolean result = checkuser.checkUser(username);
                    if (result) {
                        out.print("Name already taken");

                    } else {
                        out.println("<font color=green>");
                        out.print("Avaiable");
                        out.println("</font>");
                    }
                    break;
                }
                case "register": {
                    String username = request.getParameter("u_name");
                    String pass = request.getParameter("pass");
                    String hash = Security.encrypt(pass);
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String fullname = request.getParameter("fullname");
                    int role = 3;
                    DAO register = new DAO();
                    boolean res = register.checkUser(username);
                    if (res) {
                        request.setAttribute("error", "<font color=red>Username is already existed</font>");
                        dispatcher(request, response, reg);
                    } else {
                        register.register(username, hash, fullname, email, phone, role);
                        dispatcher(request, response, log);
                        Email.registerAndSendEmail(email, username, pass, fullname, phone);
                    }
                    break;
                }

                case "updatePerson": {
                    String username = request.getParameter("username");
                    String fullname = request.getParameter("fullname");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String pass = request.getParameter("pass");
                    String hashPass = Security.encrypt(pass);
                    DAO checkPass = new DAO();
                    boolean result = checkPass.checkPassMD5(username, pass);
                    if (result) {
                        DAO updatePerson = new DAO();
                        updatePerson.updatePerson(username, pass, fullname, email, phone);
                        response.sendRedirect("controller?action=done");
                    } else {
                        DAO updatePerson = new DAO();
                        updatePerson.updatePerson(username, hashPass, fullname, email, phone);
                        response.sendRedirect("controller?action=done");
                    }
                    break;
                }

                case "recovery":
                    try {
                        String name = request.getParameter("u_name");
                        User doIt = new User();
                        ArrayList<User> result = doIt.getUser(name);
                        String pass = "";
                        String username = "";
                        String email = "";
                        for (User u : result) {
                            pass = Security.decrypt(u.getPassword());
                            username = u.getUsername();
                            email = u.getEmail();
                        }
                        if (username.equals("null") || username.equals("")) {
                            out.print("<html>\n"
                                    + "<head>\n"
                                    + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                                    + "<meta charset=\"utf-8\">\n"
                                    + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
                                    + "<title>Recovery Page</title>\n"
                                    + "\n"
                                    + "<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                                    + "<link href=\"css/datepicker3.css\" rel=\"stylesheet\">\n"
                                    + "<link href=\"css/styles.css\" rel=\"stylesheet\">\n"
                                    + "\n"
                                    + "<!--[if lt IE 9]>\n"
                                    + "<script src=\"js/html5shiv.js\"></script>\n"
                                    + "<script src=\"js/respond.min.js\"></script>\n"
                                    + "<![endif]-->\n"
                                    + "\n"
                                    + "</head>\n"
                                    + "\n"
                                    + "<body>\n"
                                    + "	\n"
                                    + "	<div class=\"row\">\n"
                                    + "		<div class=\"col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4\">\n"
                                    + "			<div class=\"login-panel panel panel-default\">\n"
                                    + "<div class=\"panel-body\">\n"
                                    + "                                    <em><FONT SIZE=\"3\">Welcome to Online Movie Streaming </font></em>\n"
                                    + "				</div>"
                                    + "				<div class=\"panel-heading\">Try again</div>\n"
                                    + "				<div class=\"panel-body\">\n"
                                    + "					<form action=\"controller?action=recovery\" method=\"post\">\n"
                                    + "						<fieldset>\n"
                                    + "							<div class=\"form-group\">");
                            out.print("<center>");
                            out.print("<a style=\"text-decoration: none\" href=\"lost.jsp\">-_- please enter correct your username</a>");
                            out.print("<br>or<br><a href=\"/OnlineMovieStreaming\">click here to come back homepages !!!!</a>");
                            out.print("</center>");
                            out.print("</div>\n"
                                    + "                                                    \n"
                                    + "							\n"
                                    + "							\n"
                                    + "						</fieldset>\n"
                                    + "					</form>\n"
                                    + "				</div>\n"
                                    + "			</div>\n"
                                    + "		</div><!-- /.col-->\n"
                                    + "	</div><!-- /.row -->	\n"
                                    + "		\n"
                                    + "</body>\n"
                                    + "\n"
                                    + "</html>");
                        } else {

                            out.print("<html>\n"
                                    + "<head>\n"
                                    + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                                    + "<meta charset=\"utf-8\">\n"
                                    + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
                                    + "<title>Recovery Page</title>\n"
                                    + "\n"
                                    + "<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                                    + "<link href=\"css/datepicker3.css\" rel=\"stylesheet\">\n"
                                    + "<link href=\"css/styles.css\" rel=\"stylesheet\">\n"
                                    + "\n"
                                    + "<!--[if lt IE 9]>\n"
                                    + "<script src=\"js/html5shiv.js\"></script>\n"
                                    + "<script src=\"js/respond.min.js\"></script>\n"
                                    + "<![endif]-->\n"
                                    + "\n"
                                    + "</head>\n"
                                    + "\n"
                                    + "<body>\n"
                                    + "	\n"
                                    + "	<div class=\"row\">\n"
                                    + "		<div class=\"col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4\">\n"
                                    + "			<div class=\"login-panel panel panel-default\">\n"
                                    + "<div class=\"panel-body\">\n"
                                    + "                                    <em><FONT SIZE=\"3\">Welcome to Online Movie Streaming </font></em>\n"
                                    + "				</div>"
                                    + "				<div class=\"panel-heading\">You input correct username</div>\n"
                                    + "				<div class=\"panel-body\">\n"
                                    + "					<form action=\"controller?action=recovery\" method=\"post\">\n"
                                    + "						<fieldset>\n"
                                    + "							<div class=\"form-group\">");
                            out.print("<center>");
                            out.print("<font color=\"red\">Your password have sent to your email</font>");
                            out.print("<br><br><a style=\"text-decoration: none\" target=\"_blank\" href=\"https://mail.google.com/\">Click here to go to your email</a>");
                            out.print("<br>or<br><a href=\"/OnlineMovieStreaming\">Click here to come back homepages !!!!</a>");
                            Email.generateAndSendEmail(email, username, pass);
                        }
                        out.print("</center>");
                        out.print("</div>\n"
                                + "                                                    \n"
                                + "							\n"
                                + "							\n"
                                + "						</fieldset>\n"
                                + "					</form>\n"
                                + "				</div>\n"
                                + "			</div>\n"
                                + "		</div><!-- /.col-->\n"
                                + "	</div><!-- /.row -->	\n"
                                + "		\n"
                                + "</body>\n"
                                + "\n"
                                + "</html>");

                    } finally {
                        out.close();
                    }
                    break;
            }

        } finally {
            out.close();
        }
    }

    public void dispatcher(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.forward(request, response);

    }

    public boolean isAdmin(ArrayList<User> user) {
        String Role_ID = "3";
        for (User u : user) {
            Role_ID = u.getRole_ID();
        }
        return Role_ID.equals("1");
    }

    public boolean isStaff(ArrayList<User> user) {
        String Role_ID = "3";
        for (User u : user) {
            Role_ID = u.getRole_ID();
        }
        return Role_ID.equals("2");
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(controller.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(controller.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(controller.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(controller.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
