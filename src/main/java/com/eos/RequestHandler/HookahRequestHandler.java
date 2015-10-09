package main.java.com.eos.RequestHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.KeyFactory;

import main.java.com.eos.model.Hookah;

public class HookahRequestHandler extends AbstractRequestHandler {

	private String prodName;

	private String prodSize;

	private double price;

	private int coal;

	private String base1;
	private String base2;

	private String flavourFirst;

	private String flavourSecond;

	private double security;

	public void populateProductRequestHandler(HttpServletRequest request, HttpServletResponse response, int prodId) {

		this.prodId = prodId;
		this.base1 = request.getParameter("base1");
		this.base2 = request.getParameter("base2");
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
		this.price = Hookah.getHookahPriceById(prodId);
		this.security =  Hookah.getHookahSecurityById(prodId);
		this.prodSize = Hookah.getHookahSizeById(prodId);

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

	public String getFlavourSecond() {
		return flavourSecond;
	}

	public double getSecurity() {
		return security;
	}
}
