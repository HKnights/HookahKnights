package main.java.com.eos.model;

import java.io.Serializable;

import main.java.com.eos.RequestHandler.AbstractRequestHandler;
import main.java.com.eos.RequestHandler.HookahRequestHandler;
import main.java.com.eos.product.Product;

public class Hookah extends Product implements Serializable{

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
		hookahData.setBase(hookahRequestHandler.getBase());
		hookahData.setFlavourFirst(hookahRequestHandler.getFlavourFirst());
		hookahData.setFlavourSecond(hookahRequestHandler.getFlavourSecond());
		hookahData.setProdSize(hookahRequestHandler.getProdSize());

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

}
