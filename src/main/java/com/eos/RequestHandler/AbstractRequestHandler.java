package main.java.com.eos.RequestHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class AbstractRequestHandler {

	public static final int HOOKAH = 1;
	public static final int SIDES = 2;
	public int prodId;

	public static AbstractRequestHandler getProductRequestHandlerInstance(HttpServletRequest request,
			HttpServletResponse response, int prodId) {

		AbstractRequestHandler requestHandler = new HookahRequestHandler();
		switch (prodId) {

		case HOOKAH:
			requestHandler = new HookahRequestHandler();
			break;

//		case SIDES:
//			requestHandler = new SidesRequestHandler();
		}
		return requestHandler;

	}

	public abstract void populateProductRequestHandler(HttpServletRequest request, HttpServletResponse response,
			int prodId);
}
