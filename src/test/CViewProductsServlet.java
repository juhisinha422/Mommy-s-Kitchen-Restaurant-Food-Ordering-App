package test;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/viewdish")
public class CViewProductsServlet extends HttpServlet {
    public Connection con;
    @Override
    public void init() throws ServletException { con = DBConnection.getcon(); }
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            PreparedStatement ps = con.prepareStatement("select * from Dish19");
            ResultSet rs = ps.executeQuery();
            List<String[]> dishes = new ArrayList<>();
            while (rs.next()) {
                dishes.add(new String[]{
                    rs.getString(1), rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6)
                });
            }
            req.setAttribute("dishes", dishes);
            req.getRequestDispatcher("ViewDish.jsp").forward(req, res);
        } catch(Exception e) { e.printStackTrace(); }
    }
}
