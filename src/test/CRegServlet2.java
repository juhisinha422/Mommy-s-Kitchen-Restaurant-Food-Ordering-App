package test;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@SuppressWarnings("serial")
@WebServlet("/creg2")
public class CRegServlet2 extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        // Get bean fresh from context on every request
        CRegBean crb = (CRegBean) getServletContext().getAttribute("beanRef");
        String caddr = req.getParameter("caddr");
        String cmid  = req.getParameter("cmid");
        String cloc  = req.getParameter("cloc");
        String cmob  = req.getParameter("cmob");
        crb.setCaddr(caddr);
        crb.setCmid(cmid);
        crb.setCloc(cloc);
        crb.setCmob(cmob);
        RequestDispatcher rd = req.getRequestDispatcher("CViewMsg.jsp");
        rd.forward(req, res);
    }
}
