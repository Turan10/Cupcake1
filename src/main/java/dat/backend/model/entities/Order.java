package dat.backend.model.entities;

import java.sql.Timestamp;
import java.time.Instant;

public class Order {
        private Timestamp timestamp;
        private int orderID;
        private int customerID;
        private int cupcakeId;
        private int totalPrice;

    public Order(int orderID, int customerID, int cupcakeId, int totalPrice) {
        this.timestamp = Timestamp.from(Instant.now());
        this.orderID = orderID;
        this.customerID = customerID;
        this.cupcakeId = cupcakeId;
        this.totalPrice = totalPrice;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getCupcakeId() {
        return cupcakeId;
    }

    public void setCupcakeId(int cupcakeId) {
        this.cupcakeId = cupcakeId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
}
