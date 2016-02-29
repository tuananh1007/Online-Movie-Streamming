/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import db.DatabaseConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utilities.Security;

/**
 *
 * @author Tuan Anh
 */
public class User {

    public User() {
    }

    private String User_ID;
    private String Fullname;
    private String Username;
    private String Password;
    private String Email;
    private String Phone_Num;
    private String Role_ID;

    public String getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(String User_ID) {
        this.User_ID = User_ID;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String Fullname) {
        this.Fullname = Fullname;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone_Num() {
        return Phone_Num;
    }

    public void setPhone_Num(String Phone_Num) {
        this.Phone_Num = Phone_Num;
    }

    public String getRole_ID() {
        return Role_ID;
    }

    public void setRole_ID(String Role_ID) {
        this.Role_ID = Role_ID;
    }

    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();

    //display information of user - update.jsp
    public ArrayList<User> displayPersonalInformation(String username) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException, Exception {
        String sql = "Select * From account where Username= '" + username + "'";
        ResultSet rs = db.getResult(sql, con);
        ArrayList list = new ArrayList();
        while (rs.next()) {
            String User_ID = rs.getString("User_ID");
            String Username = rs.getString("Username");
            String Password = rs.getString("Pass_word");
            String Fullname = rs.getString("Fullname");
            String Email = rs.getString("Email");
            String Phone = rs.getString("Phone_Num");
            String Role_ID = rs.getString("Role_ID");
            String passEncrypt = Security.decrypt(Password);
            User user = new User();
            user.setUser_ID(User_ID);
            user.setUsername(Username);
            user.setPassword(passEncrypt);
            user.setFullname(Fullname);
            user.setEmail(Email);
            user.setPhone_Num(Phone);
            user.setRole_ID(Role_ID);
            list.add(user);
        }
        return list;
    }

    // hàm này để lôi userid ra rồi lưu userid vào session khi login - bình thường chỉ lưu được mỗi username
    public ArrayList<User> getUser(String username) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        String sql = "Select * From account where Username='" + username + "'";
        ResultSet rs = db.getResult(sql, con);
        ArrayList list = new ArrayList();

        while (rs.next()) {
            String User_ID = rs.getString("User_ID");
            String PassWord = rs.getString("Pass_word");
            String Username = rs.getString("Username");
            String email = rs.getString("Email");
            User user = new User();
            user.setUser_ID(User_ID);
            user.setPassword(PassWord);
            user.setUsername(Username);
            user.setEmail(email);
            list.add(user);
        }
        return list;
    }
}
