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

/**
 *
 * @author Tuan Anh
 */
public class Genre {
    
    public Genre() {
    }
    
    private String ID;
    private String Genre_Name;
    
    public String getID() {
        return ID;
    }
    
    public void setID(String ID) {
        this.ID = ID;
    }
    
    public String getGenre_Name() {
        return Genre_Name;
    }
    
    public void setGenre_Name(String Genre_Name) {
        this.Genre_Name = Genre_Name;
    }
    
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.setConnection();
    
    public ArrayList<Genre> getGenre() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        String sql = "Select * from genre";
        ResultSet rs = db.getResult(sql, con);
        ArrayList list = new ArrayList();
        
        while (rs.next()) {
            String ID = rs.getString("ID");
            String Genre_Name = rs.getString("Genre_Name");
            Genre genre = new Genre();
            genre.setID(ID);
            genre.setGenre_Name(Genre_Name);
            list.add(genre);
        }
        return list;
    }
}
