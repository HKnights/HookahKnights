package main.java.com.eos.HookahKnights;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import main.java.com.eos.accounts.Order;
import main.java.com.eos.accounts.User;
import main.java.com.eos.beans.HookahKnightsBean;
import main.java.com.eos.cart.ShoppingCart;
import main.java.com.eos.pojo.ProductList;
import main.java.com.eos.product.Product;
import main.java.com.eos.utils.SessionManager;

@SuppressWarnings("serial")
public class HookahKnightsServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String action = request.getParameter("action1");
			if ("SELECT_HOOKAH".equals(action)) {
				request.setAttribute("prev_order", Order.getUserOrders(request));
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(HookahNavigationConstantBean.HOOKAH_SEARCH_PAGE);
				dispatcher.forward(request, response);
			} else if ("ORDERS_PAGE_ACTION".equals(action)) {
				request.setAttribute("prev_order", Order.getUserOrders(request));
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(HookahNavigationConstantBean.HOOKAH_SEARCH_PAGE);
				dispatcher.forward(request, response);
			} else if ("ADD_TO_CART".equals(action)) {
				HookahKnightsBean.addProductToCart(request, response);
			} else if ("USER_LOGIN".equals(action)) {
				// SessionManager.loginUser(request, response);
				// RequestDispatcher rd =
				// getServletContext().getRequestDispatcher("/hookahknights");
				// rd.forward(request, response);
				// response.sendRedirect(request.getParameter("from"));
			} else if ("USER_LOGOUT".equals(action)) {
				SessionManager.storeUserCart(request, response);
				SessionManager.invalidateSession(request, response);
				request.setAttribute("showGoogle", true);
				response.sendRedirect(HookahNavigationConstantBean.HOME_PAGE);
			} else if ("SHOPPING_CART_ACTION".equals(action)) {
				SessionManager.getcartDetails(request, response);
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(HookahNavigationConstantBean.SHOPPING_CART_SEARCH_PAGE);
				dispatcher.forward(request, response);
			} else if ("ITEM_REMOVE".equals(action)) {
				String redirectTo = HookahNavigationConstantBean.SHOPPING_CART_SEARCH_PAGE;
				SessionManager.removeItem(request);
				SessionManager.getcartDetails(request, response);
				if (request.getParameter("request_from").equals("checkout")) {
					redirectTo = HookahNavigationConstantBean.CHECKOUT_PAGE;
				}
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectTo);
				dispatcher.forward(request, response);
			} else if ("SUBMIT_ORDER".equals(action)) {
				Order order = new Order();
				order.prepareOrder(request);
				order.storeOrderInDB(request);
				SessionManager.setShoppingCart(new ShoppingCart(), request);
				SessionManager.setCartCount(request, 0);
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(HookahNavigationConstantBean.ORDERS_PAGE);
				dispatcher.forward(request, response);
			} else if ("INVENTRY_CONTROL".equals(action)) {
				Order.updateInventory(request.getParameter("SHvalue"), request.getParameter("MHvalue"),
						request.getParameter("LHvalue"));
			} else if ("CHECKOUT_ACTION".equals(action)) {
				SessionManager.getcartDetails(request, response);
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(HookahNavigationConstantBean.CHECKOUT_PAGE);
				dispatcher.forward(request, response);
			} else if ("IS_VALID_ORDER".equals(action)) {
				SessionManager.isValidOrder(request, response);
			} else if ("CAN_ADD_MORE".equals(action)) {
				SessionManager.canAddMore(request, response);
			} else if ("SHOPPING_CART_ACTION_API".equals(action)) {
				response.getWriter().print(SessionManager.getcartDetails(request, response));
			} else if ("USER_ACCOUNT".equals(action)) {
				User.populateUserOrders(SessionManager.getUser(request).m_userId, request);
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(HookahNavigationConstantBean.USER_ACCOUNTS_PAGE);
				dispatcher.forward(request, response);
			} else if ("EXPRESSCHECKOUT".equals(action)) {
				GsonBuilder gsonBuilder = new GsonBuilder();
				gsonBuilder.registerTypeAdapter(ProductList.class, new User.ProductListCustomDeserializer());
				Gson gson = gsonBuilder.create();

				ShoppingCart cart = new ShoppingCart();
				ProductList list=gson.fromJson(request.getParameter("prod"), ProductList.class);
				cart.items.addAll(list.getProductList().get(Integer.parseInt(request.getParameter("item"))));
				SessionManager.setShoppingCart(cart, request);

			} else {
				request.setAttribute("showGoogle", "true");
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(HookahNavigationConstantBean.HOME_PAGE);
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
