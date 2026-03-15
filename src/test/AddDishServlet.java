package test;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
@SuppressWarnings("serial")
@WebServlet("/finaldish")
public class AddDishServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        String dName        = req.getParameter("dName");
        String dPrice       = req.getParameter("dPrice");
        String tpa          = req.getParameter("tpa");
        String delivery     = req.getParameter("delivery");
        String phno         = req.getParameter("phno");
        String availability = req.getParameter("availability");
        Dish db = new Dish();
        db.setdName(dName);
        db.setdPrice(dPrice);
        db.setTpa(tpa);
        db.setDelivery(delivery);
        db.setPhno(phno);
        db.setAvailability(availability);
        AddDishDAO abd = new AddDishDAO();
        int z = abd.addDish(db);
        if (z > 0) {
            // Success — back to dashboard with message
            req.setAttribute("msg", "Dish '" + dName + "' added successfully!");
            req.setAttribute("success", "true");
            req.getRequestDispatcher("Dish.html").forward(req, res);
        } else {
            req.setAttribute("msg", "Failed to add dish. Please try again.");
            req.getRequestDispatcher("Dish.html").forward(req, res);
        }
    }
}
