package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.util.ArrayList;

public class UserFacade
{
    public static User login(String username, String password, ConnectionPool connectionPool) throws DatabaseException
    {
        return UserMapper.login(username, password, connectionPool);
    }

    public static User createUser(String username, String password, String role, ConnectionPool connectionPool) throws DatabaseException
    {
        return UserMapper.createUser(username, password, role, connectionPool);
    }

    public static void updateBalance(User user, ConnectionPool connectionPool) throws DatabaseException {
        UserMapper.updateBalance(user, connectionPool);
    }

    public static ArrayList<User> getAllUser(ConnectionPool connectionPool) throws DatabaseException {
        return UserMapper.getAllUsers(connectionPool);
    }

}
