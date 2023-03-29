package dat.backend.model.entities;

public class Cupcake {

    private int id;
    private Topping top;
    private Bottom bottom;
    private int totalPrice;

    public Cupcake(int id, Topping top, Bottom bottom) {
        this.id = id;
        this.top = top;
        this.bottom = bottom;
        this.totalPrice = calculateTotalPrice();
    }

    public Cupcake(Topping top, Bottom bottom) {
        this.top = top;
        this.bottom = bottom;
        this.totalPrice = calculateTotalPrice();
    }




    public int calculateTotalPrice() {
        return this.top.getPrice() + this.bottom.getPrice();
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
        return this.totalPrice;
    }


    public void setId(int id) {
        this.id = id;
    }

    public void setTop(Topping top) {
        this.top = top;
    }

    public void setBottom(Bottom bottom) {
        this.bottom = bottom;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
}
