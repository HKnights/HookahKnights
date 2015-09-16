package com.eos.accounts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccountBean {

	public static User register(HttpServletRequest request, HttpServletResponse response, boolean doLogin)
			throws Exception {
		// Get parameters
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");

		if (password.equals("")) {
			password = User.generatePassword();
		}

		User user = new User(name, phone, email, mobile, password);
		if (user.m_email == null && user.m_mobile == null) {
			throw new RuntimeException("Error in registeration info - Null email and mobile.");
		}
		if (user.m_name == null || user.m_password == null) {
			throw new RuntimeException("Error in registeration info - Null name or password.");
		}
		user = User.registerUser(user);

		if (doLogin) {
			// Login User
			if (user.m_email != null) {
				loginByEmail(request, response, user.m_email, password);
			} else {
				throw new RuntimeException("Error while registering - Invalid email and mobile number!");
			}
		}

		return user;
	}

	public static void loginByEmail(HttpServletRequest req, HttpServletResponse response, String email, String password)
			throws Exception {
		User isValidUser = User.authenticateUserByEmail(email, password);
		login(req, response, isValidUser, email, password);
	}

	private static void login(HttpServletRequest request, HttpServletResponse response, User isValidUser, String email,
			String password) throws Exception {
		if (isValidUser == null) {
			throw new Exception();
		}

	}
}
