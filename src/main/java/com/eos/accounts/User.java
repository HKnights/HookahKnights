package main.java.com.eos.accounts;

import java.io.Serializable;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Text;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;

import main.java.com.eos.cart.ShoppingCart;
import main.java.com.eos.model.Hookah;
import main.java.com.eos.model.HookahData;
import main.java.com.eos.product.Product;
import main.java.com.eos.utils.SessionManager;

public class User implements Serializable {

	public String m_userId = "";
	public String m_name = "";
	public String m_email = "";
	public String m_password = "";
	public String m_mobile = "";
	public boolean m_isLoggedIn;
	public Date m_lastBookingDate;
	public double amount = 0.0;
	public boolean m_isSignUp;
	public boolean m_isBlocked;
	public String m_profilePicUrl = "";

	public User() {
	}

	User(String name, String email, String password, String mobile, String picUrl) {

		this.m_name = name;
		this.m_email = email;
		this.m_password = password;
		this.m_mobile = mobile;
		this.m_profilePicUrl = picUrl;
	}

	public static String generatePassword() {
		Random random = new Random();
		String password = "";
		while (password.length() < 8) {
			int nextRand = Math.abs(random.nextInt());
			int r = random.nextInt() % 3;
			char nextChar;
			switch (r) {
			case 0:
				nextChar = (char) ((nextRand % 26) + 'a');
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

	public static String generateId() {
		Random random = new Random();
		String id = "";
		while (id.length() < 6) {
			int nextRand = Math.abs(random.nextInt());
			int r = random.nextInt() % 3;
			int nextInt;
			switch (r) {
			case 0:
				nextInt = nextRand % 26;
				break;
			case 1:
				nextInt = (nextRand % 26) + 'A';
				break;
			case 2:
				nextInt = (nextRand % 10) + '0';
				break;
			default:
				nextInt = (nextRand % 10) + '0';
			}
			id += nextInt;
		}
		return ("HKN" + id);
	}

	public static User registerUser(User user) throws Exception {
		try {

		} catch (Exception e) {
			throw e;
		}
		return null;
	}

	public static void getUserData(String key) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Filter filter = new FilterPredicate("key", FilterOperator.EQUAL, key);
		Query q = new Query("User").setFilter(filter);
		PreparedQuery pq = ds.prepare(q);
		for (Entity result : pq.asIterable()) {
			String firstName = (String) result.getProperty("user_name");
			String lastName = (String) result.getProperty("user_password");
			System.out.println(firstName + " " + lastName + ", " + " inches tall");
		}
	}

	public static User getUserDataFromEmailandId(String userId, HttpServletRequest request) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		User user = null;
		try {
			Entity result = ds.get(KeyFactory.createKey("User", userId));
			user = new User();
			user.m_name = (String) result.getProperty("user_name");
			user.m_password = (String) result.getProperty("user_password");
			user.m_email = (String) result.getProperty("user_email");
			user.m_userId = (String) result.getKey().getName();
			user.m_profilePicUrl = (String) result.getProperty("user_image");
			GsonBuilder gb = new GsonBuilder();
			gb.registerTypeAdapter(Product.class, new CustomDeserializer());
			Gson customGson = gb.create();
			JSONObject jsonObj;
			ShoppingCart cart = null;
			try {
				cart = new ShoppingCart();
				jsonObj = new JSONObject((Text) result.getProperty("user_cart"));
				JSONArray jsonArray = (new JSONObject((String) jsonObj.opt("value"))).optJSONArray("items");
				for (int i = 0; i < jsonArray.length(); i++) {
					Product product = new Hookah();
					String key = ((JSONObject) jsonArray.get(i)).toString();
					product = customGson.fromJson(key, Product.class);
					cart.addToProductList(product);
				}
				SessionManager.setCartCount(request, cart.items.size());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			SessionManager.setShoppingCart(cart, request);
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public static void populateUserOrders(String userId, HttpServletRequest request) {
		try {
			JSONObject jsonObj;
			String time="";
			JSONObject orderJson = new JSONObject();
			int count = 0;
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
			Filter filter = new FilterPredicate("user_id", FilterOperator.EQUAL, userId);
			Query q = new Query("Orders").setFilter(filter);
			PreparedQuery pq = ds.prepare(q);
			for (Entity result : pq.asIterable()) {
				GsonBuilder gb = new GsonBuilder();
				gb.registerTypeAdapter(Product.class, new CustomDeserializer());
				Gson customGson = gb.create();
				ShoppingCart cart = null;
				try {
					cart = new ShoppingCart();
					jsonObj = new JSONObject((Text) result.getProperty("order_details"));
					 time=result.getProperty("generation_time").toString();
					JSONArray jsonArray = (new JSONObject((String) jsonObj.opt("value"))).optJSONArray("items");
					for (int i = 0; i < jsonArray.length(); i++) {
						Product product = new Hookah();
						String key = ((JSONObject) jsonArray.get(i)).toString();
						product = customGson.fromJson(key, Product.class);
						cart.addToProductList(product);
					}
					orderJson.put(++count + "", cart);
					orderJson.put("generation_time"+count, time);
				} catch (Exception e) {
				}
			}
			request.setAttribute("order_details", new Gson().toJson(orderJson));
		} catch (Exception e) {
		}
	}

	public static User authenticateUserByEmail(String email, String password) throws Exception {
		try {

		} catch (Exception e) {

		}
		return null;
	}

	public static class CustomDeserializer implements JsonDeserializer<Product> {

		public Product deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
				throws JsonParseException {
			if (json == null)
				return null;
			else {
				ShoppingCart cart = new ShoppingCart();
				List<Product> items = new ArrayList<Product>();
				Product product = new Hookah();
				JsonObject jsonObject = json.getAsJsonObject();
				HookahData hookahData = new HookahData();
				hookahData.setBase1(((JsonObject) jsonObject.get("hookahData")).get("base1").getAsString());
				hookahData.setProdId(((JsonObject) jsonObject.get("hookahData")).get("prodId").getAsInt());
				hookahData.setCoal(((JsonObject) jsonObject.get("hookahData")).get("coal").getAsInt());
				hookahData.setProdName(((JsonObject) jsonObject.get("hookahData")).get("prodName").getAsString());
				hookahData.setProdSize(((JsonObject) jsonObject.get("hookahData")).get("prodSize").getAsString());
				hookahData.setPrice(((JsonObject) jsonObject.get("hookahData")).get("price").getAsDouble());
				hookahData.setFlavourFirst(((JsonObject) jsonObject.get("hookahData")).get("flavourFirst").getAsString());
				hookahData.setSecurity(((JsonObject) jsonObject.get("hookahData")).get("security").getAsDouble());
				product.setHookahData(hookahData);
				items.add(product);
				cart.setItems(items);
				return product;
			}
		}

	}

}
