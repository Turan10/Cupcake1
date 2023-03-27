package dat.backend.model.persistence;

import dat.backend.model.entities.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderMapper {
    public static List<Order> getAllOrders(ConnectionPool connectionPool) {
        List<Order> orderList = new ArrayList<>();

        String sql = "select * from Order";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Timestamp created = rs.getTimestamp("Created");
                    int orderID = rs.getInt("OrderID");
                    int customerID = rs.getInt("customerID");
                    int cupcakeID = rs.getInt("CupcakeID");
                    int totalPrice = rs.getInt("Total price");

                    orderList.add(new Order(orderID,customerID,cupcakeID,totalPrice));
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }

    public static void removeOrder(Timestamp timestamp, int orderID, int customerID, int cupcakeId, int totalPrice, ConnectionPool connectionPool) {
        String sql = "DELETE FROM `order` WHERE timestamp = ? AND orderID = ? AND customerID = ? AND cupcakeId = ? AND totalPrice = ?";


        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setTimestamp(1, timestamp);
                ps.setInt(2, orderID);
                ps.setInt(3, customerID);
                ps.setInt(4, cupcakeId);
                ps.setInt(5, totalPrice);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


//iterate igennem tingene fra order

//navne skal stemmes overens alle steder

//koden skal lægges rigtigt op

//CHATGPT saviour!!🙏🙏🙏
