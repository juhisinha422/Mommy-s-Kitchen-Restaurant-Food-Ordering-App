package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@SuppressWarnings("serial")
@WebServlet("/final")
public class FinalRegServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        Connection con = DBConnection.getcon();
        RegBean rb = (RegBean) getServletContext().getAttribute("beanRef");
        try {
            PreparedStatement ps = con.prepareStatement(
                "insert into Momchef values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, rb.getuName());
            ps.setString(2, rb.getpWord());
            ps.setString(3, rb.getfName());
            ps.setString(4, rb.getlName());
            ps.setString(5, rb.getAddr());
            ps.setString(6, rb.getMid());
            ps.setString(7, rb.getLoc());
            ps.setLong(8,   rb.getAccno());
            ps.setString(9, rb.getIfsc());
            ps.setString(10,rb.getMob());
            int ck = ps.executeUpdate();
            if (ck > 0) {
                res.sendRedirect("Mlogin.html");
            } else {
                req.setAttribute("msg", "Registration failed. Please try again.");
                req.getRequestDispatcher("login_error.jsp").forward(req, res);
            }
        } catch(Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "Error: " + e.getMessage());
            req.getRequestDispatcher("login_error.jsp").forward(req, res);
        }
    }
}
