package dat.backend.model.entities;

import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;

public class Order {
    private Timestamp timestamp;
    private int orderID;
    private List<Cupcake> cupcakeList;
    private int totalPrice;


    public Order(ShoppingCart shoppingCart) {
        this.timestamp = Timestamp.from(Instant.now());
        this.orderID = orderID;
        this.cupcakeList = shoppingCart.getCupcakes();
        this.totalPrice = shoppingCart.getTotalPrice();

    }

    //Ret på databasen, så den passer med vores kode, og ret på mapperne så den indsætter data 2 forskellige steder. Den ene er order, den anden er cupcakes tabellerne
    // Disse 2 tabeller skal tale med hinanden, så vi kan få fat i alle cupcakes der er i en order. Dette kan gøres ved at have en foreign key i cupcakes tabellen, som refererer til orderID i order tabellen.

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public int getOrderID() {
        return orderID;
    }


    public int getTotalPrice() {
        return totalPrice;
    }


    public List<Cupcake> getCupcakeList() {
        return cupcakeList;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }
}