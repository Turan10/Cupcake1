package dat.backend.model.persistence;

import dat.backend.model.entities.Cupcake;
import dat.backend.model.entities.Order;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class OrderMapper {
    public static List<Order> getAllOrders(ConnectionPool connectionPool) {
        List<Order> orderList = new ArrayList<>();

        String sql = "select * from order";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Timestamp created = rs.getTimestamp("Created");
                    int orderID = rs.getInt("OrderID");
                    int customerID = rs.getInt("customerID");
                    int cupcakeID = rs.getInt("CupcakeID");
                    int totalPrice = rs.getInt("Total price");

                  //  orderList.add(new Order(orderID,cupcakeID,totalPrice));
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }

    public static void removeOrder(Timestamp timestamp, int orderID, int cupcakeId, int totalPrice, ConnectionPool connectionPool) {
        String sql = "DELETE FROM `order` WHERE timestamp = ? AND orderID = ? AND cupcakeId = ? AND totalPrice = ?";


        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setTimestamp(1, timestamp);
                ps.setInt(2, orderID);
                ps.setInt(3, cupcakeId);
                ps.setInt(4, totalPrice);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void createOrder(Order order, ConnectionPool connectionPool) throws DatabaseException {
        String insertIntoOrderQuery = "INSERT INTO cupcake.order (created, totalPrice) VALUES (?, ?)";
        String insertIntoCupcakeQuery = "INSERT INTO cupcake.cupcake (orderId, topId, buttomId) VALUES (?, ?, ?)";

        // this one is for the order

        try(Connection connection = connectionPool.getConnection()){
            try(PreparedStatement ps = connection.prepareStatement(insertIntoOrderQuery, Statement.RETURN_GENERATED_KEYS)){
                String time = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(order.getTimestamp().toLocalDateTime());
                System.out.println(time);
                ps.setString(1, time);
                ps.setInt(2, order.getTotalPrice());
                ps.executeUpdate();
                ResultSet rs = ps.getGeneratedKeys();
                if(rs.next()){
                    int orderID = rs.getInt(1);
                    order.setOrderID(orderID);
                }
            }
        }catch (SQLException e){
            throw new DatabaseException(e, "Could not create order");
        }

        // this one is for the cupcakes

try(Connection connection = connectionPool.getConnection()){
            try(PreparedStatement ps = connection.prepareStatement(insertIntoCupcakeQuery)){
                for(Cupcake cupcake : order.getCupcakeList()){
                    ps.setInt(1, order.getOrderID());
                    ps.setInt(2, cupcake.getTop().getId());
                    ps.setInt(3, cupcake.getBottom().getId());
                    ps.executeUpdate();
                }
            }
        }catch (SQLException e){
            throw new DatabaseException(e, "Could not create cupcake order");
        }

    }
}



