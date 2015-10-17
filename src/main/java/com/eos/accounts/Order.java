package main.java.com.eos.accounts;

import java.util.Calendar;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.gson.Gson;

public class Order {

	private static String s_referencePrepend = "FMN";
	public static final String TABLE_NAME = "orders";
	public static final String STATUS_NEW = "N";

	public int m_orderId = -1;
	public int m_leadId = -1;
	public String m_userId;
	public String m_status = STATUS_NEW;
	public String m_status_history = "";
	public char m_mode;
	public String m_orderDetails = "";
	/*
	 * the reference number to track an order.
	 */
	public String m_referenceId = null;
	/**
	 * Cart reference Id to which this order belongs
	 */
	private String m_cartReferenceId = null;
	private double m_amountChargedToBuyer = 0.0;
	public int m_loggedUserId = -1;
	public Calendar m_generationTime;
	public DeliveryDetails m_deliveryDetails;
	public String m_comments = "";
	// public List<BaseOrderItem> m_orderItems = new ArrayList<BaseOrderItem>();
	// public List<Order> m_childOrders = null;
	public int m_noChildOrders = 0;
	public String m_topOrderReferenceId = null;

	public void storeOrderInDB() {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Entity e = new Entity("Orders");
		e.setProperty("reference_id", m_referenceId);
		e.setProperty("user_id", m_userId);
		e.setProperty("status", m_status);
		e.setProperty("order_details", m_orderDetails);
		e.setProperty("delivery_details", getSerializedDeliveryDetails());
		ds.put(e);
	}

	public String getSerializedDeliveryDetails() {

		Gson gson = new Gson();
		return gson.toJson(m_deliveryDetails);
	}

}
