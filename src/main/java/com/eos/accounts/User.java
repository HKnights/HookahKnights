package main.java.com.eos.accounts;

import java.io.Serializable;
import java.util.Date;
import java.util.Random;

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

	public static User getUserDataFromEmailandId(String userId) {
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
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public static User authenticateUserByEmail(String email, String password) throws Exception {
		try {

		} catch (Exception e) {

		}
		return null;
	}

}
