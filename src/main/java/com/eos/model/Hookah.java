package main.java.com.eos.model;

import java.io.Serializable;

import main.java.com.eos.RequestHandler.AbstractRequestHandler;
import main.java.com.eos.RequestHandler.HookahRequestHandler;
import main.java.com.eos.product.Product;

public class Hookah extends Product implements Serializable {

	private int prodId = -1;
	private HookahData hookahData = new HookahData();

	@Override
	public Product call() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product populateProduct(AbstractRequestHandler requestHandler) throws Exception {

		HookahRequestHandler hookahRequestHandler = (HookahRequestHandler) requestHandler;
		hookahData.setProdId(hookahRequestHandler.prodId);
		hookahData.setProdName(hookahRequestHandler.getProdName());
		hookahData.setPrice(hookahRequestHandler.getPrice());
		hookahData.setSecurity(hookahRequestHandler.getSecurity());
		hookahData.setCoal(hookahRequestHandler.getCoal());
		hookahData.setBase1(hookahRequestHandler.getBase1());
		hookahData.setBase2(hookahRequestHandler.getBase2());
		hookahData.setFlavourFirst(hookahRequestHandler.getFlavourFirst());
		hookahData.setFlavourSecond(hookahRequestHandler.getFlavourSecond());
		hookahData.setProdSize(hookahRequestHandler.getProdSize());
		hookahData.setItemId(Product.getRandomProductId());

		this.setProdId(prodId);
		this.setHookahData(hookahData);
		return this;
	}

	public int getProdId() {
		return prodId;
	}

	public void setProdId(int prodId) {
		this.prodId = prodId;
	}

	public HookahData getHookahData() {
		return hookahData;
	}

	public void setHookahData(HookahData hookahData) {
		this.hookahData = hookahData;
	}

	public static double getHookahPriceById(int id) {
		switch (id) {
		case 1:
			return 500;
		case 2:
			return 600;
		case 3:
			return 700;
		}
		return 600;
	}

	public static double getHookahSecurityById(int id) {
		switch (id) {
		case 1:
			return 500;
		case 2:
			return 700;
		case 3:
			return 1000;
		}
		return 700;
	}

	public static String getHookahSizeById(int id) {
		switch (id) {
		case 1:
			return "Small";
		case 2:
			return "Medium";
		case 3:
			return "Large";
		}
		return "Invalid";
	}
}
