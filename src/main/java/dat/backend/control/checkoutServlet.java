package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Order;
import dat.backend.model.entities.ShoppingCart;
import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.OrderFacade;
import dat.backend.model.persistence.UserFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "checkoutServlet", value = "/checkout")
public class checkoutServlet extends HttpServlet {
    ConnectionPool connectionPool;

    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
        User user = (User) session.getAttribute("user");


        if (shoppingCart != null && !shoppingCart.getCupcakes().isEmpty()) {
            Order order = new Order(shoppingCart);
            if (user.subtractMoneyFromAccount(order.getTotalPrice())) {

                try {

                    OrderFacade.createOrder(order, user.getUsername(), connectionPool);
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
    }
}

