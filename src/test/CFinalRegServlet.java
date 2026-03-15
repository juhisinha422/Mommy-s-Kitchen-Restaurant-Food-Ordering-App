package test;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@SuppressWarnings("serial")
@WebServlet("/cfinal")
public class CFinalRegServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        Connection con = DBConnection.getcon();
        CRegBean crb = (CRegBean) getServletContext().getAttribute("beanRef");
        try {
            PreparedStatement ps = con.prepareStatement(
                "insert into Client19 values(?,?,?,?,?,?,?,?)");
            ps.setString(1, crb.getCuName());
            ps.setString(2, crb.getCpWord());
            ps.setString(3, crb.getCfName());
            ps.setString(4, crb.getClName());
            ps.setString(5, crb.getCaddr());
            ps.setString(6, crb.getCmid());
            ps.setString(7, crb.getCloc());
            ps.setString(8, crb.getCmob());
            int ck = ps.executeUpdate();
            if (ck > 0) {
                // Redirect to login page with success message
                res.sendRedirect("Clogin.html?registered=true");
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
