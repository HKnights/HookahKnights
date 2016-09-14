package main.java.com.eos.pojo;

import java.util.List;

import main.java.com.eos.product.Product;

public class ProductList {
	private List<List<Product>> productList;

	public List<List<Product>> getProductList() {
		return productList;
	}

	public void setProductList(List<List<Product>> productList) {
		this.productList = productList;
	}
}
