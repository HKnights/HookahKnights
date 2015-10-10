package main.java.com.eos.beans;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.repackaged.com.google.gson.Gson;
import main.java.com.eos.RequestHandler.AbstractRequestHandler;
import main.java.com.eos.accounts.DeliveryDetails;
import main.java.com.eos.accounts.Order;
import main.java.com.eos.accounts.User;
import main.java.com.eos.cart.ShoppingCart;
import main.java.com.eos.product.Product;
import main.java.com.eos.utils.SessionManager;

public class HookahKnightsBean {

	public static synchronized JSONObject addProductToCart(HttpServletRequest request, HttpServletResponse response) {

		int prodId = Integer.parseInt(request.getParameter("prod_id"));
		AbstractRequestHandler requestHandler = AbstractRequestHandler.getProductRequestHandlerInstance(request,
				response, prodId);
		if (requestHandler != null) {
			requestHandler.populateProductRequestHandler(request, response, prodId);
			Product productInstancte = Product.getProductInstance(prodId);
			try {
				addToCart(request, productInstancte.populateProduct(requestHandler));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	private static void addToCart(HttpServletRequest request, Product product) {

		ShoppingCart cart = SessionManager.getShoppingCart(request);
		if (cart == null) {
			cart = new ShoppingCart();
		}
		cart.addToProductList(product);
		SessionManager.setShoppingCart(cart, request);
		SessionManager.addToCartCount(request);
//		Gson gson = new Gson();
//		String orderData = gson.toJson(cart);
//		Order order = new Order();
//		storeData(request, orderData, order);
//		order.storeOrderInDB();
	}

	public static void storeData(HttpServletRequest request, String data, Order order) {
		order.m_referenceId = User.generateId();
		order.m_userId = SessionManager.getUser(request).m_userId;
		order.m_status = Order.STATUS_NEW;
		order.m_orderDetails = data;
		order.m_deliveryDetails = new DeliveryDetails();
	}
}
