package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Cupcake;
import dat.backend.model.entities.ShoppingCart;
import dat.backend.model.entities.Topping;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.BottomFacade;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.ToppingFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
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

        String step = request.getParameter("step");

        HttpSession session = request.getSession();
        if(session.getAttribute("shoppingCart") == null) {
            session.setAttribute("shoppingCart", new ShoppingCart());
        }

        try {
            if(step == null || step.equals("bottoms")) {
                List<Bottom> bottoms = BottomFacade.getAllBottoms(connectionPool);
                request.setAttribute("bottomList", bottoms);
                request.getRequestDispatcher("/WEB-INF/OrderOnline.jsp").forward(request, response);
            }
            else if(step.equals("toppings")) {
                int bottomId = Integer.parseInt(request.getParameter("bottomId"));
                Bottom bottomOfChoice = BottomFacade.getBottomById(bottomId, connectionPool);
                request.setAttribute("bottomOfChoice", bottomOfChoice);
                List<Topping> toppings = ToppingFacade.getAllToppings(connectionPool);
                request.setAttribute("toppingList", toppings);
                request.getRequestDispatcher("/WEB-INF/OrderOnline.jsp").forward(request, response);
            }
            else if(step.equals("complete")) {
                int bottomId = Integer.parseInt(request.getParameter("bottomId"));
                int toppingId = Integer.parseInt(request.getParameter("toppingId"));
                Bottom bottomOfChoice = BottomFacade.getBottomById(bottomId, connectionPool);
                Topping toppingOfChoice = ToppingFacade.getToppingById(toppingId, connectionPool);

                Cupcake cupcake = new Cupcake(toppingOfChoice, bottomOfChoice);
                ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
                shoppingCart.addCupcake(cupcake);

                request.getRequestDispatcher("/WEB-INF/shoppingcart.jsp").forward(request, response);

            }




            } catch (SQLException e) {
            e.printStackTrace();
        } catch (DatabaseException e) {
            e.printStackTrace();
        }


        }
    }


