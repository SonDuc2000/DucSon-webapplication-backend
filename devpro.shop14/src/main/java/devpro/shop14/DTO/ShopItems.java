package devpro.shop14.DTO;

import java.math.BigDecimal;

public class ShopItems {
	
	private int productId;
	private String productName;
	private String avatar;
	private String shortDesc;
	private int quanlity;
	private BigDecimal priceUnit;
	private BigDecimal totalPriceUnit;

	public BigDecimal getTotalPriceUnit() {
		return totalPriceUnit;
	}

	public void setTotalPriceUnit(BigDecimal totalPriceUnit) {
		this.totalPriceUnit = totalPriceUnit;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

	public String getShortDesc() {
		return shortDesc;
	}

	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
}
