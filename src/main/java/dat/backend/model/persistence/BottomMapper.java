package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BottomMapper {

    static List<Bottom> getAllBottoms(ConnectionPool connectionPool) throws DatabaseException {
        String sql = "SELECT * FROM Bottom";
        List<Bottom> bottomList = new ArrayList<>();

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String details = resultSet.getString("details");
                        int price = resultSet.getInt("price");

                        Bottom bottom = new Bottom(id, details, price);
                        bottomList.add(bottom);
                    }
                }
            }
        } catch (SQLException e) {
            throw new DatabaseException(e, "Fejl i tilgangen til databasen");
        }
        return bottomList;


    }

    public static Bottom getBottomById(int bottomId, ConnectionPool connectionPool) throws DatabaseException {
        String sql = "SELECT * FROM Bottom WHERE id = ?";
        Bottom bottom = null;

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, bottomId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String details = resultSet.getString("details");
                        int price = resultSet.getInt("price");

                        bottom = new Bottom(id, details, price);
                    }
                }
            }
        } catch (SQLException e) {
            throw new DatabaseException(e, "Fejl i tilgangen til databasen");
        }
        return bottom;
    }
}
