package devpro.shop14.DTO;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Shop {
	
	private BigDecimal totalPrice = BigDecimal.ZERO;
	private List<ShopItems> cartItems = new ArrayList<ShopItems>();

	public List<ShopItems> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<ShopItems> cartItems) {
		this.cartItems = cartItems;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

}
