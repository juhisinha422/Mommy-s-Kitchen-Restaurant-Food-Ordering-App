package test;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@SuppressWarnings("serial")
@WebServlet("/reg2")
public class RegServlet12 extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        // Get bean fresh from context on every request
        RegBean rb = (RegBean) getServletContext().getAttribute("beanRef");
        String addr = req.getParameter("addr");
        String mid  = req.getParameter("mid");
        String loc  = req.getParameter("loc");
        long accno  = Long.parseLong(req.getParameter("accno"));
        String ifsc = req.getParameter("ifsc");
        String mob  = req.getParameter("mob");
        rb.setAddr(addr);
        rb.setMid(mid);
        rb.setLoc(loc);
        rb.setAccno(accno);
        rb.setIfsc(ifsc);
        rb.setMob(mob);
        RequestDispatcher rd = req.getRequestDispatcher("ViewMsg.jsp");
        rd.forward(req, res);
    }
}
