package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Cupcake;
import dat.backend.model.entities.Order;
import dat.backend.model.entities.Topping;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class OrderMapper {




    public static List<Order> getAllOrders(ConnectionPool connectionPool) {
        List<Order> orderList = new ArrayList<>();
        Order order = null;

        String sql = "SELECT o.username, o.orderID, o.created, o.totalPrice, t.id, t.price, t.details AS topName, b.id, b.price, b.details AS bottomName " +
                "FROM cupcake.order o " +
                "JOIN cupcake c ON o.orderID = c.orderID " +
                "JOIN top t ON c.topID = t.id " +
                "JOIN bottom b ON c.bottomID = b.id " +
                "ORDER BY o.created DESC";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    Timestamp created = rs.getTimestamp("created");
                    int totalPrice = rs.getInt("totalPrice");
                    int topId = rs.getInt("id");
                    String topName = rs.getString("topName");
                    int topPrice = rs.getInt("price");
                    int bottomId = rs.getInt("id");
                    String bottomName = rs.getString("bottomName");
                    int bottomPrice = rs.getInt("price");
                    String username = rs.getString("username");



                    if (order == null || order.getOrderID() != orderID) {
                        order = new Order(orderID, created, totalPrice, new ArrayList<>());
                        order.setUsername(username);
                        orderList.add(order);
                    }
                    Cupcake cupcake = new Cupcake(new Topping(topId, topName, topPrice), new Bottom(bottomId, bottomName, bottomPrice));
                    order.getCupcakeList().add(cupcake);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }



    static void createOrder(Order order, String username, ConnectionPool connectionPool) throws DatabaseException {
        String insertIntoOrderQuery = "INSERT INTO cupcake.order (created, totalPrice, username) VALUES (?, ?, ?)";
        String insertIntoCupcakeQuery = "INSERT INTO cupcake.cupcake (orderId, topId, bottomId) VALUES (?, ?, ?)";

        // this one is for the order



        try(Connection connection = connectionPool.getConnection()){
            try(PreparedStatement ps = connection.prepareStatement(insertIntoOrderQuery, Statement.RETURN_GENERATED_KEYS)){
                String time = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(order.getTimestamp().toLocalDateTime());
                System.out.println(time);
                ps.setString(1, time);
                ps.setInt(2, order.getTotalPrice());
                ps.setString(3, username);
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
            throw new DatabaseException(e, "Could not create cupcake");
        }

    }
}



