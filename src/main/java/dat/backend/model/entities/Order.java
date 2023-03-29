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
    private String username; // Til at gemme hvem der har lavet ordren


    public Order(ShoppingCart shoppingCart) {
        this.timestamp = Timestamp.from(Instant.now());
        this.orderID = orderID;
        this.cupcakeList = shoppingCart.getCupcakes();
        this.totalPrice = shoppingCart.getTotalPrice();

    }

    public Order(int orderID, Timestamp timestamp, int totalPrice, List<Cupcake> cupcakeList) {
        this.timestamp = timestamp;
        this.orderID = orderID;
        this.totalPrice = totalPrice;
        this.cupcakeList = cupcakeList;}


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


    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public void setCupcakeList(List<Cupcake> cupcakeList) {
        this.cupcakeList = cupcakeList;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getUsername() {
        return username;
    }




    public void setUsername(String username) {
        this.username = username;
    }
}

