package devpro.shop14.DTO;

import devpro.shop14.Entity.BaseEntity;
import devpro.shop14.Entity.SaleOrder;
import devpro.shop14.Entity.products;

public class CustomerShop extends BaseEntity{

	public products products;
	
	public SaleOrder saleOrder;

	public products getProducts() {
		return products;
	}

	public void setProducts(products products) {
		this.products = products;
	}

	public SaleOrder getSaleOrder() {
		return saleOrder;
	}

	public void setSaleOrder(SaleOrder saleOrder) {
		this.saleOrder = saleOrder;
	}

}
