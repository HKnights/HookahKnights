package main.java.com.eos.cart;

import java.io.Serializable;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;

import main.java.com.eos.HookahKnights.Serializer;
import main.java.com.eos.model.Hookah;
import main.java.com.eos.model.HookahData;
import main.java.com.eos.product.Product;

public class ShoppingCart implements Serializable {

	private static final long serialVersionUID = 5588078890935892620L;
	public String userId = "";
	public String userName = "";
	public int noOfItems = 0;
	public List<Product> items = new ArrayList<Product>();

	public ShoppingCart() {

	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getNoOfItems() {
		return noOfItems;
	}

	public void setNoOfItems(int noOfItems) {
		this.noOfItems = noOfItems;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<Product> getItems() {
		return items;
	}

	public void setItems(List<Product> items) {
		this.items = items;
	}

	public void addToProductList(Product product) {
		items.add(product);
	}

	public List<Product> getProductList() {
		return items;
	}

	public static byte[] createDummyShoppingCart() {

		ShoppingCart uc = new ShoppingCart();
		StringBuffer buffer = new StringBuffer();
		buffer.append(uc.getNoOfItems()).append("$$");
		buffer.append(uc.getUserId()).append("$$");
		return Serializer.serialize(uc);

	}
	
}
