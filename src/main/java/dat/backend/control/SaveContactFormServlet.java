package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.persistence.ConnectionPool;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "SaveContactFormServlet", value = "/SaveContactFormServlet")
public class SaveContactFormServlet extends HttpServlet {
    private ConnectionPool connectionPool;

    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String sql = "INSERT INTO Cupcake.contactus (fullname, email, inquiry, subject) VALUES (?, ?, ?, ?)";

        String firstName = request.getParameter("fullname");
        String lastName = request.getParameter("email");
        String country = request.getParameter("inquiry");
        String subject = request.getParameter("subject");

        try (Connection connection = connectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, country);
            statement.setString(4, subject);

            int rowsAffected = statement.executeUpdate();
        } catch (SQLException e) {
            // Block of code to handle errors
        }
    }
}
