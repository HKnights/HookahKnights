package main.java.com.eos.utils;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterHKnightsRequest extends GenericServlet {
	public static String FB_ACCOUNT_ID = "";

	public void init() {
		String serverInfo = getServletContext().getRealPath(getServletInfo());
		/*
		 * ServletContext.getServerInfo() will return
		 * "Google App Engine Development/x.x.x" if will run locally, and
		 * "Google App Engine/x.x.x" if run on production envoirnment
		 */
		if (!serverInfo.contains("Users")) {
			FB_ACCOUNT_ID = "1481278548864631";
		} else {
			FB_ACCOUNT_ID = "1484009795227981";
		}
	}

	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
}
