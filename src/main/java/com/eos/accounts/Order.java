package main.java.com.eos.accounts;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Text;
import com.google.gson.Gson;

import main.java.com.eos.cart.ShoppingCart;
import main.java.com.eos.model.HookahData;
import main.java.com.eos.product.Product;
import main.java.com.eos.utils.SessionManager;

public class Order {

	private static String s_referencePrepend = "FMN";
	public static final String TABLE_NAME = "orders";
	public static final String STATUS_NEW = "N";
	public static final String STATUS_DELIVERED = "D";
	public static final String STATUS_ABORTED = "A";

	public static int m_orderId = -1;
	public static int m_leadId = -1;
	public static String m_userId;
	public static String m_status = STATUS_NEW;
	public static String m_status_history = "";
	public static char m_mode;
	public static String m_orderDetails = "";
	/*
	 * the reference number to track an order.
	 */
	public static String m_referenceId = null;
	/**
	 * Cart reference Id to which this order belongs
	 */
	private static String m_cartReferenceId = null;
	private static double m_amountChargedToBuyer = 0.0;
	public static String m_loggedUserId = "-1";
	public Calendar m_generationTime;
	public static DeliveryDetails m_deliveryDetails;
	public static String m_comments = "";
	// public List<BaseOrderItem> m_orderItems = new ArrayList<BaseOrderItem>();
	// public List<Order> m_childOrders = null;
	public int m_noChildOrders = 0;
	public String m_topOrderReferenceId = null;

	public static String getS_referencePrepend() {
		return s_referencePrepend;
	}

	public static void setS_referencePrepend(String s_referencePrepend) {
		Order.s_referencePrepend = s_referencePrepend;
	}

	public static int getM_orderId() {
		return m_orderId;
	}

	public static void setM_orderId(int m_orderId) {
		Order.m_orderId = m_orderId;
	}

	public static int getM_leadId() {
		return m_leadId;
	}

	public static void setM_leadId(int m_leadId) {
		Order.m_leadId = m_leadId;
	}

	public static String getM_userId() {
		return m_userId;
	}

	public static void setM_userId(String m_userId) {
		Order.m_userId = m_userId;
	}

	public static String getM_status() {
		return m_status;
	}

	public static void setM_status(String m_status) {
		Order.m_status = m_status;
	}

	public static String getM_status_history() {
		return m_status_history;
	}

	public static void setM_status_history(String m_status_history) {
		Order.m_status_history = m_status_history;
	}

	public static char getM_mode() {
		return m_mode;
	}

	public static void setM_mode(char m_mode) {
		Order.m_mode = m_mode;
	}

	public static String getM_orderDetails() {
		return m_orderDetails;
	}

	public static void setM_orderDetails(String m_orderDetails) {
		Order.m_orderDetails = m_orderDetails;
	}

	public static String getM_referenceId() {
		return m_referenceId;
	}

	public static void setM_referenceId(String m_referenceId) {
		Order.m_referenceId = m_referenceId;
	}

	public static String getM_cartReferenceId() {
		return m_cartReferenceId;
	}

	public static void setM_cartReferenceId(String m_cartReferenceId) {
		Order.m_cartReferenceId = m_cartReferenceId;
	}

	public static double getM_amountChargedToBuyer() {
		return m_amountChargedToBuyer;
	}

	public static void setM_amountChargedToBuyer(double m_amountChargedToBuyer) {
		Order.m_amountChargedToBuyer = m_amountChargedToBuyer;
	}

	public static String getM_loggedUserId() {
		return m_loggedUserId;
	}

	public static void setM_loggedUserId(String m_loggedUserId) {
		Order.m_loggedUserId = m_loggedUserId;
	}

	public Calendar getM_generationTime() {
		return m_generationTime;
	}

	public void setM_generationTime(Calendar m_generationTime) {
		this.m_generationTime = m_generationTime;
	}

	public static DeliveryDetails getM_deliveryDetails() {
		return m_deliveryDetails;
	}

	public static void setM_deliveryDetails(DeliveryDetails m_deliveryDetails) {
		Order.m_deliveryDetails = m_deliveryDetails;
	}

	public static String getM_comments() {
		return m_comments;
	}

	public static void setM_comments(String m_comments) {
		Order.m_comments = m_comments;
	}

	public int getM_noChildOrders() {
		return m_noChildOrders;
	}

	public void setM_noChildOrders(int m_noChildOrders) {
		this.m_noChildOrders = m_noChildOrders;
	}

	public String getM_topOrderReferenceId() {
		return m_topOrderReferenceId;
	}

	public void setM_topOrderReferenceId(String m_topOrderReferenceId) {
		this.m_topOrderReferenceId = m_topOrderReferenceId;
	}

	public static String getTableName() {
		return TABLE_NAME;
	}

	public static String getStatusNew() {
		return STATUS_NEW;
	}

	public static String getStatusDelivered() {
		return STATUS_DELIVERED;
	}

	public static String getStatusAborted() {
		return STATUS_ABORTED;
	}

	public static void storeOrderInDB(HttpServletRequest request) {
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy hh:mm");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+5:30"));
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Entity e = new Entity("Orders");
		e.setProperty("reference_id", m_referenceId);
		e.setProperty("order_id", m_orderId);
		e.setProperty("user_id", m_loggedUserId);
		e.setProperty("status", m_status);
		e.setProperty("amountToCharge", m_amountChargedToBuyer);
		e.setProperty("generation_time", sdf.format(new Date()));
		e.setProperty("order_details", new Text(SessionManager.getShoppingCartJSON(request)));
		e.setProperty("delivery_details", getSerializedDeliveryDetails());
		ds.put(e);
	}

	public static void updateInventory(String SHvalue, String MHvalue, String LHvalue) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		if (getInventoryId() != null) {
			Entity entity;
			try {
				entity = ds.get(KeyFactory.createKey("Inventory", Long.parseLong(getInventoryId())));
				if (SHvalue != null && !SHvalue.equals("")) {
					entity.setProperty("SHvalue", SHvalue);
				}
				if (MHvalue != null && !MHvalue.equals("")) {
					entity.setProperty("MHvalue", MHvalue);
				}
				if (LHvalue != null && !LHvalue.equals("")) {
					entity.setProperty("LHvalue", LHvalue);
				}
				ds.put(entity);
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			Entity e = new Entity("Inventory");
			e.setProperty("SHvalue", SHvalue);
			e.setProperty("MHvalue", MHvalue);
			e.setProperty("LHvalue", LHvalue);
			ds.put(e);
		}
	}

	public static String getInventoryId() {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("Inventory");
		PreparedQuery pq = ds.prepare(q);
		for (Entity entity : pq.asIterable()) {
			try {
				return entity.getKey().getId() + "";
			} catch (Exception e1) {

			}
		}
		return null;
	}

	public static String getInventory() {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("Inventory");
		PreparedQuery pq = ds.prepare(q);
		for (Entity result : pq.asIterable()) {
			String smallHookahValue = (String) result.getProperty("SHvalue");
			String mediumHookahValue = (String) result.getProperty("MHvalue");
			String largeHookahValue = (String) result.getProperty("LHvalue");
			return smallHookahValue + "_" + mediumHookahValue + "_" + largeHookahValue;
		}
		return "";
	}

	public static String blockHookahInventory(int numOfSmallHokkahToBlock, int numOfMedHokkahToBlock,
			int numOfLargeHokkahToBlock) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("Inventory");
		PreparedQuery pq = ds.prepare(q);
		for (Entity result : pq.asIterable()) {
			int smallHookahValue = Integer.parseInt((String) result.getProperty("SHvalue"));
			int mediumHookahValue = Integer.parseInt((String) result.getProperty("MHvalue"));
			int largeHookahValue = Integer.parseInt((String) result.getProperty("LHvalue"));
			updateInventory((smallHookahValue - numOfSmallHokkahToBlock) + "",
					(mediumHookahValue - numOfMedHokkahToBlock) + "",
					(largeHookahValue - numOfLargeHokkahToBlock) + "");
			return smallHookahValue + "_" + mediumHookahValue + "_" + largeHookahValue;
		}
		return "";
	}

	public static String getSerializedDeliveryDetails() {

		Gson gson = new Gson();
		return gson.toJson(m_deliveryDetails);
	}

	public static String generateRandomString() {
		Random random = new Random();
		String password = "HK";
		while (password.length() < 8) {
			int nextRand = Math.abs(random.nextInt());
			int r = random.nextInt() % 3;
			char nextChar;
			switch (r) {
			case 0:
				nextChar = (char) ((nextRand % 26) + 'Z');
				break;
			case 1:
				nextChar = (char) ((nextRand % 26) + 'A');
				break;
			case 2:
				nextChar = (char) ((nextRand % 10) + '0');
				break;
			default:
				nextChar = (char) ((nextRand % 10) + '0');
			}
			password += nextChar;
		}
		return password;
	}

	public static void prepareOrder(HttpServletRequest request) {
		User user = SessionManager.getUser(request);
		Order order = new Order();
		DeliveryDetails deliveryDetails = new DeliveryDetails();
		deliveryDetails.m_email = request.getParameter("user-email");
		deliveryDetails.m_phone = request.getParameter("user-phone");
		deliveryDetails.m_name = request.getParameter("user-name");
		deliveryDetails.m_street = request.getParameter("user-address");
		m_deliveryDetails = deliveryDetails;
		m_referenceId = generateRandomString();
		if (user != null) {
			m_loggedUserId = user.m_userId;
		}
		m_amountChargedToBuyer = getCartAmount(request);
		m_orderId = Product.getRandomProductId();
		blockOrderedHokkahInInventory(request);
	}

	public static double getCartAmount(HttpServletRequest request) {
		double amount = 0.0;
		ShoppingCart cart = SessionManager.getShoppingCart(request);
		if (cart != null) {
			List<Product> productList = cart.getItems();
			for (Product product : productList) {
				HookahData hookahData = product.getHookahData();
				amount += hookahData.getPrice();
			}
		}
		return amount;
	}

	public static void blockOrderedHokkahInInventory(HttpServletRequest request) {
		double amount = 0.0;
		int smallHookahCount = 0;
		int medHookahCount = 0;
		int largeHookahCount = 0;
		ShoppingCart cart = SessionManager.getShoppingCart(request);
		if (cart != null) {
			List<Product> productList = cart.getItems();
			for (Product product : productList) {
				HookahData hookahData = product.getHookahData();
				switch (hookahData.getProdId()) {
				case 1:
					smallHookahCount++;
					break;
				case 2:
					medHookahCount++;
					break;
				case 3:
					largeHookahCount++;
					break;
				}
			}
			Order.blockHookahInventory(smallHookahCount, medHookahCount, largeHookahCount);
		}
	}

}
