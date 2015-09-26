package main.java.com.eos.HookahKnights;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.com.eos.utils.SMS;
import main.java.com.eos.utils.SessionManager;
import main.java.com.eos.utils.TransportQueueManager;

@SuppressWarnings("serial")
public class HookahKnightsServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 Logger log = Logger.getLogger(TransportQueueManager.class.getName());
		 //TransportQueueManager.getQueuedMessenger();
		// SessionManager.loginUser(request, response);
		// http://api.clickatell.com/http/sendmsg?user=hknights&password=CgJEPXWSLRfGOd&api_id=3561635&to=917829626302&text=HookahKnights%20!!!
		try {
			String action = request.getParameter("action1");

			log.warning("Backend started!");
			log.log(Level.WARNING, "Backend started    !");

			if ("SELECT_HOOKAH".equals(action)) {
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(HookahNavigationConstantBean.HOOKAH_SEARCH_PAGE);
				dispatcher.forward(request, response);
			} else if ("ORDERS_PAGE_ACTION".equals(action)) {
				response.sendRedirect(HookahNavigationConstantBean.HOOKAH_SEARCH_PAGE);
			} else if ("ADD_TO_CART".equals(action)) {
				HttpSession session = request.getSession();
				session.getAttribute("user_id");
				session.getAttribute("cart");
				session.getAttribute("cart");
			} else if ("USER_LOGIN".equals(action)) {
				SessionManager.loginUser(request, response);
				response.sendRedirect(HookahNavigationConstantBean.HOME_PAGE);
			} else if ("USER_LOGOUT".equals(action)) {
				SessionManager.invalidateSession(request, response);
				response.sendRedirect(HookahNavigationConstantBean.HOME_PAGE);
			} else {
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(HookahNavigationConstantBean.HOME_PAGE);
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
