package dat.backend.model.entities;

public class Topping {

    private int id;
    private String details;
    private int price;

    public Topping(int id, String details, int price) {
        this.id = id;
        this.details = details;
        this.price = price;
    }

    public String getDetails() {
        return details;
    }

    public int getPrice() {
        return price;
    }

    public int getId() {
        return id;
    }

}
