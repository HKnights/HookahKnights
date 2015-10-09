package main.java.com.eos.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.repackaged.com.google.gson.Gson;

import main.java.com.eos.accounts.User;
import main.java.com.eos.cart.ShoppingCart;
import main.java.com.eos.model.HookahData;
import main.java.com.eos.product.Product;

public class SessionManager {

	private static final String CURRENT_USER = "CURRENT_USER";
	private static final String CURRENT_SHOPPING_CART = "CURRENT_SHOPPING_CART";

	public static HttpSession getSession(HttpServletRequest request) {
		return request.getSession(false);
	}

	public static final User getUser(HttpServletRequest request) {
		return (User) getSession(request).getAttribute(CURRENT_USER);
	}

	public static final void setUser(User user, HttpServletRequest request) {
		getSession(request).setAttribute(CURRENT_USER, user);
	}

	public static final ShoppingCart getShoppingCart(HttpServletRequest request) {
		return (ShoppingCart) getSession(request).getAttribute(CURRENT_SHOPPING_CART);
	}

	public static final void setShoppingCart(ShoppingCart cart, HttpServletRequest request) {
		getSession(request).setAttribute(CURRENT_SHOPPING_CART, cart);
	}

	public static final void loginUser(HttpServletRequest request, HttpServletResponse response) {
		User user = null;
		HttpSession session = getSession(request);
		String userId = request.getParameter("user_id");
		String name = request.getParameter("user_name");
		String userImage = request.getParameter("user_image") != null ? request.getParameter("user_image") : "";
		String userPass = request.getParameter("user_pass");
		String userEmail = request.getParameter("user_email") != null ? request.getParameter("user_email") : "";
		Boolean isSignUp = Boolean.parseBoolean(request.getParameter("user_signup"));
		Boolean isUserLogin = Boolean.parseBoolean(request.getParameter("user_login"));
		try {
			if (userId == null || userId.isEmpty()) {
				user = User.getUserDataFromEmailandId(userEmail,request);
			} else {
				user = User.getUserDataFromEmailandId(userId,request);
			}
			if (session == null || session.getAttribute("user_id") == null) {
				session = request.getSession();
			}
			if (isSignUp) {
				userId = userEmail;
				if (user != null) {
					throw new AccountException(AccountException.USER_ALREADY_REGISTERED);
				}
				user = new User();
				// TransportQueueManager.s_transportQueue.add(new
				// TransportQueueManager().new TransportMessage(userEmail,
				// "Mail from HookahKnights, You have Successfully Signed Up
				// with us.",
				// "HookahKnights Welcomes you !!!"));
				Messenger messenger = new Email(userEmail,
						"Mail from HookahKnights, You have Successfully Signed Up with us.",
						"HookahKnights Welcomes you !!!");
				TransportQueueManager.insertMessenger(messenger);
				// TransportQueueManager
				// .addTransportQueueThread(new TransportQueueManager().new
				// TransportMessage(messenger));
				createUser(userId, name, userEmail, userImage, userPass);
			} else {
				if (user != null) {
					userId = user.m_userId;
					name = user.m_name;
					userImage = user.m_profilePicUrl;
					userEmail = user.m_email;
					if (isUserLogin && !user.m_password.equals(userPass)) {
						throw new AccountException(AccountException.INVALID_USER_CREDENTIALS);
					}
				} else if (userId != null && !userId.isEmpty()) {
					user = new User();
					createUser(userId, name, userEmail, userImage, userPass);
				} else {
					throw new AccountException(AccountException.INVALID_USER);
				}
			}
			user.m_userId = userId;
			user.m_name = name;
			user.m_profilePicUrl = userImage;
			user.m_email = userEmail;
			session.setAttribute("user_id", userId);
			session.setAttribute("user_name", name);
			session.setAttribute("user_image", userImage);
			session.setAttribute("user_email", userEmail);
			session.setMaxInactiveInterval(5 * 60);
			SessionManager.setUser(user, request);
			Cookie userName = new Cookie("userId", userId);
			userName.setMaxAge(100 * 30);
			response.addCookie(userName);
		} catch (Exception e) {
			session.setAttribute("error", e.getMessage());
			session.removeAttribute("user_name");
			session.removeAttribute("user_id");
			session.removeAttribute("user_image");
		}
	}

	public static void createUser(String userId, String name, String userEmail, String userImage, String userPass) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Entity e = null;
		if (userId == null || userId.isEmpty()) {
			e = new Entity("User", userEmail);
			e.setProperty("user_id", userEmail);
		} else {
			e = new Entity("User", userId);
			e.setProperty("user_id", userId);
		}
		e.setProperty("user_name", name);
		e.setProperty("user_email", userEmail);
		e.setProperty("user_image", userImage);
		e.setProperty("user_password", userPass);
		e.setProperty("user_cart", "");
		ds.put(e);
	}

	public static final void invalidateSession(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = SessionManager.getSession(request);
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				cookies[i].setValue(null);
				cookies[i].setMaxAge(0);
				cookies[i].setPath("/");
				response.addCookie(cookie);
			}
		}
		if (session != null)
			session.invalidate();
	}
	public static void storeUserCart(HttpServletRequest request, HttpServletResponse response) {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Entity entity;
		try {
			entity = datastore.get(KeyFactory.createKey("User", SessionManager.getUser(request).m_userId));
			entity.setProperty("user_cart", new Gson().toJson(SessionManager.getShoppingCart(request)));
			datastore.put(entity);
		} catch (EntityNotFoundException e) {
			e.printStackTrace();
		}

	}
	public static String getcartDetails(HttpServletRequest request, HttpServletResponse response) {
		Map<Integer, String> cartItemMap = new HashMap<Integer, String>();
		HttpSession session = SessionManager.getSession(request);
		ShoppingCart cart = SessionManager.getShoppingCart(request);
		int count=0;
		if (cart != null) {
			List<Product> productList = cart.getItems();
			for (Product product : productList) {
				HookahData hookahData = product.getHookahData();
				if (cartItemMap.containsKey(hookahData.getProdId())) {
					int quantity = Integer.parseInt(cartItemMap.get(hookahData.getProdId()).split("_")[0]) + 1;
					cartItemMap.put(hookahData.getProdId(),
							quantity + "_" + hookahData.getProdSize() + "_" + hookahData.getPrice() * quantity);
				} else {
					cartItemMap.put(hookahData.getProdId(),
							"1_" + hookahData.getProdSize() + "_" + hookahData.getPrice());
				}
				count++;
			}
		}
		session.setAttribute("cart_count", count+"");
		request.setAttribute("cart_json",new Gson().toJson(cartItemMap));
		return new Gson().toJson(cartItemMap);
	}
}
