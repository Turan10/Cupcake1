package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Topping;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ToppingMapper {
    static List<Topping> getAllToppings(ConnectionPool connectionPool) throws DatabaseException, SQLException {
        String sql = "SELECT * FROM Top";
        List<Topping> toppingList = new ArrayList<>();

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String details = rs.getString("details");
                    int price = rs.getInt("price");

                    Topping topping = new Topping(id, details, price);
                    toppingList.add(topping);
                }
            } catch (SQLException ex) {
                throw new DatabaseException(ex, "Fejl i tilgangen til databasen");
            }
            return toppingList;
        }


    }
}
