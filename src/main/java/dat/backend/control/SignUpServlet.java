package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.UserFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "Signup", value = "/signup")
public class SignUpServlet extends HttpServlet {

    private ConnectionPool connectionPool;
    public void init() throws ServletException
    {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            ConnectionPool connectionPool = ApplicationStart.getConnectionPool();

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmpassword");

            ArrayList<User> userList = UserFacade.getAllUser(connectionPool);

            for (User u : userList) {
                if (username.toLowerCase().equals(u.getUsername().toLowerCase())) {
                    request.setAttribute("userExists", "User already exists");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);

                    return;

                }
            }
                if (!password.equals(confirmPassword)){
                    request.setAttribute("passwordMismatch", "Password is not identical, please try again");
                    System.out.println("Password is not identical, please try again");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                    return;
                }
                    //Creates our user object with the variables from our request.getParameter and set it to our
                    //createUser method in UserFacade so that it gets created to our DB right away
                    User user = UserFacade.createUser(username, password, "Customer", connectionPool);



                    //"user" = current user when logged in
                    request.getSession().setAttribute("user", user);
                    request.getRequestDispatcher("home.jsp").forward(request, response);


        } catch (DatabaseException e) {
            e.printStackTrace();
        }
    }
}
