package dat.backend.control;

import dat.backend.model.persistence.ConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet(name = "RemoveOrderServlet", value = "/remove_order")

public class RemoveOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        //orderID parameter
        int orderID = Integer.parseInt(request.getParameter("orderID"));

        //remove orderID
        ConnectionPool connectionPool = new ConnectionPool("root", "martin123", "jdbc:mysql://localhost:3306/Cupcake");
        try {
            PreparedStatement preparedStatement = connectionPool.getConnection().prepareStatement("DELETE FROM Cupcake.Order WHERE orderID = ?");
            preparedStatement.setInt(1, orderID);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        //tilbage til orders siden
        response.sendRedirect("orders.jsp");
    }
}

