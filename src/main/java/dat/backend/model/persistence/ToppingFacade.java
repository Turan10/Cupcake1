package dat.backend.model.persistence;

import dat.backend.model.entities.Topping;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.SQLException;
import java.util.List;

public class ToppingFacade {
    public static List<Topping> getAllToppings(ConnectionPool connectionPool) throws SQLException, DatabaseException {
        return ToppingMapper.getAllToppings(connectionPool);
    }
}
