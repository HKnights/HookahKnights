package main.java.com.eos.model;

import java.io.Serializable;

public class HookahData implements Serializable {

	private int prodId;
	private int itemId;

	private String prodName;

	private String prodSize;

	private double price;

	private int coal;

	private String base1;
	private String base2;

	private String flavourFirst;

	private String flavourSecond;

	private double security;

	public int getProdId() {
		return prodId;
	}

	public void setProdId(int prodId) {
		this.prodId = prodId;
	}

	public String getProdName() {
		return prodName;
	}

	public String getProdSize() {
		return prodSize;
	}

	public void setProdSize(String prodSize) {
		this.prodSize = prodSize;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getCoal() {
		return coal;
	}

	public void setCoal(int coal) {
		this.coal = coal;
	}

	public String getBase1() {
		return base1;
	}

	public void setBase1(String base1) {
		this.base1 = base1;
	}

	public String getBase2() {
		return base2;
	}

	public void setBase2(String base2) {
		this.base2 = base2;
	}

	public String getFlavourFirst() {
		return flavourFirst;
	}

	public void setFlavourFirst(String flavourFirst) {
		this.flavourFirst = flavourFirst;
	}

	public String getFlavourSecond() {
		return flavourSecond;
	}

	public void setFlavourSecond(String flavourSecond) {
		this.flavourSecond = flavourSecond;
	}

	public double getSecurity() {
		return security;
	}

	public void setSecurity(double security) {
		this.security = security;
	}
	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}


}
