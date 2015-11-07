package main.java.com.eos.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

public final class XssFilter implements Filter {

	static class FilteredRequest extends HttpServletRequestWrapper {

		/* These are the characters allowed by the Javascript validation */
		static String allowedChars = "+-0123456789#*";

		public FilteredRequest(ServletRequest request) {
			super((HttpServletRequest) request);
		}

		public String sanitize(String input) {
			if ("USER_LOGIN".equals(input)) {
				if (getRequest().getParameter("from").equals("/hookah.jsp")) {
					return "";
				} else if (("/hookah_page2.jsp").equals(getRequest().getParameter("from"))) {
					return "ORDERS_PAGE_ACTION";
				} else if (("/shopping_cart.jsp").equals(getRequest().getParameter("from"))) {
					return "SHOPPING_CART_ACTION";
				} else if (("/checkout.jsp").equals(getRequest().getParameter("from"))) {
					return "CHECKOUT_ACTION";
				} else if (("/user_account.jsp").equals(getRequest().getParameter("from"))) {
					return "USER_ACCOUNT";
				}
			}
			return input;
		}

		public String getParameter(String paramName) {
			String value = super.getParameter(paramName);
			if ("action1".equals(paramName)) {
				value = sanitize(value);
			}
			return value;
		}

		public String[] getParameterValues(String paramName) {
			String values[] = super.getParameterValues(paramName);
			if ("action1".equals(paramName)) {
				for (int index = 0; index < values.length; index++) {
					values[index] = sanitize(values[index]);
				}
			}
			return values;
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (("USER_LOGIN").equals(request.getParameter("action1"))) {
			SessionManager.loginUser((HttpServletRequest) request, (HttpServletResponse) response);
		}
		chain.doFilter(new FilteredRequest(request), response);
	}

	public void destroy() {
	}

	public void init(FilterConfig filterConfig) {
	}
}