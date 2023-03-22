package dat.backend.model.entities;

public class Cupcake {

    private int id;
    private Topping top;
    private Bottom bottom;
    private int totalPrice;

    public Cupcake(int id, Topping top, Bottom bottom, int totalPrice) {
        this.id = id;
        this.top = top;
        this.bottom = bottom;
        this.totalPrice = calculateTotalPrice();
    }

    public int calculateTotalPrice() {
        return top.getPrice() + bottom.getPrice();
    }

    public int getId() {
        return id;
    }

    public Topping getTop() {
        return top;
    }

    public Bottom getBottom() {
        return bottom;
    }

    public int getTotalPrice() {
        return totalPrice;
    }


}
