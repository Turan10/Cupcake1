package dat.backend.model.persistence;

import dat.backend.model.entities.Order;

import java.util.List;

public class OrderFacade {

    public static List<Order> getAllOrders(ConnectionPool connectionPool) {
        return OrderMapper.getAllOrders(connectionPool);
    }
}
