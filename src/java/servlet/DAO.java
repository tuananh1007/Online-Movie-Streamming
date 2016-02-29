/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import db.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author thanh_000
 */
public class DAO {

    public DAO() {
    }

    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();

    public boolean checkLogin(String username, String password) throws SQLException {
        ResultSet rs = null;
        try {
            String sql = "Select * From account Where Username='" + username + "' and Pass_word='" + password + "'";
            rs = db.getResult(sql, con);
            boolean result = rs.next();

            if (result) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            rs.close();
            con.close();
        }
        return false;
    }

    public boolean checkUser(String username) {

        try {
            String sql = "Select * From account Where Username='" + username + "'";
            ResultSet rs = db.getResult(sql, con);
            boolean result = rs.next();
            rs.close();

            if (result) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean register(String username, String pass, String fullname, String email, String phone, int role) {

        try {

            String sql = "Insert Into account (Fullname,Username,Pass_word,Email,Phone_Num,Role_ID)" + "values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, username);
            ps.setString(3, pass);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setInt(6, role);
            int result = ps.executeUpdate();
            ps.close();
            con.close();
            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updatePerson(String username, String pass, String fullname, String email, String phone) {
        try {

            String sql = "update account set Fullname ='" + fullname + "',Email = '" + email + "',Phone_Num = '" + phone + "',Pass_word = '" + pass + "' where Username ='" + username + "'";
            db.getResultDo(sql, con);
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addGenre(String genreName) {

        try {

            String sql = "Insert Into genre (Genre_Name) values('" + genreName + "')";
            PreparedStatement ps = con.prepareStatement(sql);
            int result = ps.executeUpdate();
            ps.close();
            con.close();
            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insertMovie(String name, String picture, String actor, String infor, String genre,
            String director, String length, String year, String place, String view, String links) {

        try {

            String sql = "Insert Into movie (Movie_Name,Movie_Picture,Movie_Actor,Movie_Information,Movie_Genre,Movie_Director,Movie_Length,Movie_Year,Movie_Place, Movie_Views, Movie_Links) values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, picture);
            ps.setString(3, actor);
            ps.setString(4, infor);
            ps.setString(5, genre);
            ps.setString(6, director);
            ps.setString(7, length);
            ps.setString(8, year);
            ps.setString(9, place);
            ps.setString(10, view);
            ps.setString(11, links);
            int result = ps.executeUpdate();
            ps.close();
            con.close();
            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateGenre(String newGenre, String oldGenre) {
        try {

            String sql = "update genre set Genre_Name ='" + newGenre + "' where Genre_Name ='" + oldGenre + "'";
            db.getResultDo(sql, con);
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(String id, String fullname, String user, String pass, String email, String phone, String role) {
        try {

            String sql = "update account set Fullname ='" + fullname + "', Username ='" + user + "', Pass_word ='" + pass
                    + "', Email ='" + email + "', Phone_Num ='" + phone + "', Role_ID ='" + role + "' where User_ID ='" + id + "'";
            db.getResultDo(sql, con);
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateMovie(String oldName, String name, String actor, String infor, String genre,
            String director, String length, String year, String place, String id, String picture, String view, String links) {
        try {

            String sql = "update movie set Movie_ID ='" + id + "',Movie_Name ='" + name + "',Movie_Picture ='" + picture + "',Movie_Actor='" + actor + "',"
                    + "Movie_Information='" + infor + "',Movie_Genre='" + genre + "',Movie_Director='" + director + "',"
                    + "Movie_Length='" + length + "',Movie_Year='" + year + "',Movie_Place='" + place + "',Movie_Views='" + view + "',Movie_Links='" + links + "'"
                    + " where Movie_Name ='" + oldName + "'";
            db.getResultDo(sql, con);
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteGenre(String genreName) {
        try {

            String sql = "Delete from genre where Genre_Name ='" + genreName + "'";
            db.getResultDo(sql, con);
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteMovie(String movieName) {
        try {

            String sql = "Delete from movie where Movie_Name ='" + movieName + "'";
            db.getResultDo(sql, con);
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteUser(String id) {
        try {

            String sql = "Delete from account where User_ID ='" + id + "'";
            db.getResultDo(sql, con);
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkPassMD5(String username, String pass) {

        try {

            String sql = "Select * From User Where Username='" + username + "' and Password='" + pass + "'";
            ResultSet rs = db.getResult(sql, con);
            boolean result = rs.next();
            rs.close();
            con.close();
            if (result) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
