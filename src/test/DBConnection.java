package test;
import java.sql.*;
public class DBConnection {
    public static Connection con;
    private DBConnection() {}
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/mommyskitchen?useSSL=false&allowPublicKeyRetrieval=true",
                "system", "manager");
            System.out.println("✅ DB Connected!");
        } catch(Exception e) { e.printStackTrace(); }
    }
    public static Connection getcon() { return con; }
}
