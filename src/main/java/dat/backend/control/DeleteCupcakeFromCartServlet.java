package dat.backend.control;

import dat.backend.model.entities.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteCupcakeFromCartServlet", value = "/deletefromcart")
public class DeleteCupcakeFromCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int cupcakeId = Integer.parseInt(request.getParameter("cupcakeId"));
        ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");

        if(shoppingCart != null) {
            shoppingCart.deleteCupcake(cupcakeId);
        }

        request.getRequestDispatcher("/WEB-INF/shoppingcart.jsp").forward(request, response);

    }
}
