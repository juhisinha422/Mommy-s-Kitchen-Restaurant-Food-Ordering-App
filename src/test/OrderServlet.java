package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@SuppressWarnings("serial")
@WebServlet("/placeorder")
public class OrderServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String cuname = req.getParameter("cuname");
        String dname  = req.getParameter("dname");
        String dprice = req.getParameter("dprice");
        try {
            Connection con = DBConnection.getcon();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO Orders(CUNAME,DNAME,DPRICE) VALUES(?,?,?)");
            ps.setString(1, cuname);
            ps.setString(2, dname);
            ps.setString(3, dprice);
            ps.executeUpdate();
            req.setAttribute("dname", dname);
            req.setAttribute("dprice", dprice);
            req.getRequestDispatcher("OrderSuccess.jsp").forward(req, res);
        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("viewdish");
        }
    }
}
