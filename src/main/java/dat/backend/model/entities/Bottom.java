package dat.backend.model.entities;

public class Bottom {

    private int id;
    private String details;
    private int price;

    public Bottom(int id, String details, int price) {
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
