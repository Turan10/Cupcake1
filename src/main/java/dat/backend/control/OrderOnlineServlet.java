package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Topping;
import dat.backend.model.persistence.BottomFacade;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.ToppingFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderOnlineServlet", value = "/orderonline")

public class OrderOnlineServlet extends HttpServlet {
    private ConnectionPool connectionPool;

    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Bottom> bottoms = BottomFacade.getAllBottoms(connectionPool);
            List<Topping> toppings = ToppingFacade.getAllToppings(connectionPool);

            request.setAttribute("bottomList", bottoms);
            request.setAttribute("toppingList", toppings);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/OrderOnline.jsp");
            requestDispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error accessing database", e);
        }
    }
}

