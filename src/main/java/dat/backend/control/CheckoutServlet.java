package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.persistence.ConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CheckoutServlet", value = "/CheckoutServlet")
public class checkoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConnectionPool connectionPool = ApplicationStart.getConnectionPool();

        String user = request.getParameter("user");




<<<<<<< HEAD
    }
}
=======
        if (shoppingCart != null && !shoppingCart.getCupcakes().isEmpty()) {
            Order order = new Order(shoppingCart);
           if(user.subtractMoneyFromAccount(order.getTotalPrice())) {

               try {

                   OrderFacade.createOrder(order,user.getUsername(), connectionPool);
                   UserFacade.updateBalance(user, connectionPool);



                   session.setAttribute("shoppingCart", new ShoppingCart());

                   request.setAttribute("order", order);
                   request.setAttribute("msg", "Your order has been placed");






                   request.getRequestDispatcher("/WEB-INF/checkout.jsp").forward(request, response);

               } catch (DatabaseException e) {

                   request.setAttribute("msg", "Something happened... order did not go through");
                   request.getRequestDispatcher("/WEB-INF/checkout.jsp").forward(request, response);
                    return;
               }
           }
           request.getRequestDispatcher("/WEB-INF/notEnough.jsp").forward(request, response);
        }
}}

>>>>>>> check
