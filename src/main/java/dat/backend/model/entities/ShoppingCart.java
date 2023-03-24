package dat.backend.model.entities;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    private List<Cupcake> cupcakes;

    public ShoppingCart() {
        this.cupcakes = new ArrayList<>();
    }

    public void addCupcake(Cupcake cupcake) {
        this.cupcakes.add(cupcake);
    }

    public List<Cupcake> getCupcakes() {
        return cupcakes;
    }

    public int getTotalPrice() {
        int totalPrice = 0;
        for (Cupcake cupcake : cupcakes) {
            totalPrice += cupcake.getTotalPrice();
        }
        return totalPrice;
    }


}
