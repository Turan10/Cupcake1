package dat.backend.model.persistence;

import dat.backend.model.entities.Order;
import dat.backend.model.exceptions.DatabaseException;

import java.util.List;

public class OrderFacade {

    public static List<Order> getAllOrders(ConnectionPool connectionPool) throws DatabaseException {
        return OrderMapper.getAllOrders(connectionPool);
    }

    public static void createOrder(Order order, String username, ConnectionPool connectionPool) throws DatabaseException {
        OrderMapper.createOrder(order,username, connectionPool);
    }
}

