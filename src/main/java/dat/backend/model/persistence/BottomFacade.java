package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.exceptions.DatabaseException;

import java.util.List;

public class BottomFacade {


    public static List<Bottom> getAllBottoms(ConnectionPool connectionPool) throws DatabaseException {
        return BottomMapper.getAllBottoms(connectionPool);
    }
}
