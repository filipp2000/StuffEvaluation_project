/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package my_package;


import java.sql.*;
import javax.swing.*;

/**
 *
 * @author filip
 */
public class MySQLconnection {
   
    
    public static Connection connectDb() { 
        Connection conn=null;   
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");         // Εισαγωγή του connector
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff_evaluation_db", "root", "794613852"); //Eγκαθίδρυση σύνδεσης
            //JOptionPane.showMessageDialog(null, "Connection to MySQL server Established Successfully!"); //Μήνυμα επιτυχούς σύνδεσης
            
        }
        catch(Exception e){ // η κλήση της getConnection του DriverManager πετάει throwable για αυτό χρειάζεται η catch
            JOptionPane.showMessageDialog(null,e); // Η οποία θα εκτυπώνει ενα default μήνυμα λάθους.        
        }
        return conn;
    }  
}

