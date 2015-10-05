package main.java.com.eos.RequestHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.KeyFactory;

public class HookahRequestHandler extends AbstractRequestHandler {

	private String prodName;

	private String prodSize;

	private double price;

	private int coal;

	private String base;

	private String flavourFirst;

	private String flavourSecond;

	private double security;

	public void populateProductRequestHandler(HttpServletRequest request, HttpServletResponse response, int prodId) {

		this.prodId = prodId;
		this.base = request.getParameter("base");
		this.flavourFirst = request.getParameter("flavour_first");
		this.flavourSecond = request.getParameter("flavour_second");

		// DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		// try {
		// Entity result = ds.get(KeyFactory.createKey("Product", prodId));
		// this.prodName = (String) result.getProperty("prod_name");
		// this.coal = Integer.parseInt((String) result.getProperty("coal"));
		// this.price = Double.parseDouble((String)
		// result.getProperty("price"));
		// this.security = Double.parseDouble((String)
		// result.getProperty("security"));
		// this.prodSize = (String) result.getProperty("size");
		//
		// return this;
		// } catch (Exception e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		this.prodName = "Hookah";
		this.coal = 3;
		this.price = 500;
		this.security = 500;
		this.prodSize = "Small";

	}

	public int getProdId() {
		return prodId;
	}

	public String getProdName() {
		return prodName;
	}

	public String getProdSize() {
		return prodSize;
	}

	public double getPrice() {
		return price;
	}

	public int getCoal() {
		return coal;
	}

	public String getBase() {
		return base;
	}

	public String getFlavourFirst() {
		return flavourFirst;
	}

	public String getFlavourSecond() {
		return flavourSecond;
	}

	public double getSecurity() {
		return security;
	}
}
