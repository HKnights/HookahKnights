package main.java.com.eos.cart;

import java.io.Serializable;

import main.java.com.eos.HookahKnights.Serializer;

public class ShoppingCart implements Serializable {

	private static final long serialVersionUID = 5588078890935892620L;
	public String userId = "dummy";
	public String itemId = "-1";
	public int noOfItems = 0;

	public ShoppingCart() {

	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public int getNoOfItems() {
		return noOfItems;
	}

	public void setNoOfItems(int noOfItems) {
		this.noOfItems = noOfItems;
	}

	public static byte[] getSerializedCartData(ShoppingCart uc) {

		StringBuffer buffer = new StringBuffer();
		buffer.append(uc.getNoOfItems()).append("$$");
		buffer.append(uc.getUserId()).append("$$");
		buffer.append(uc.getItemId()).append("$$");
		return Serializer.serialize(uc);

	}

	public static byte[] createDummyShoppingCart() {

		ShoppingCart uc = new ShoppingCart();
		StringBuffer buffer = new StringBuffer();
		buffer.append(uc.getNoOfItems()).append("$$");
		buffer.append(uc.getUserId()).append("$$");
		buffer.append(uc.getItemId()).append("$$");
		return Serializer.serialize(uc);

	}

}
