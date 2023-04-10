package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Order;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.OrderFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/vieworders")
public class OrderServlet extends HttpServlet {

    private ConnectionPool connectionPool;

    public void init() {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            List<Order> orderList = OrderFacade.getAllOrders(connectionPool);
            HttpSession session = request.getSession();
            request.setAttribute("orders", orderList);

            request.getRequestDispatcher("/WEB-INF/orders.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        }

}
