package main.java.com.eos.utils;

public class AccountException extends Exception {
	private static final long serialVersionUID = 1L;
	public static final String INVALID_USER = "No User Found";
	public static final String USER_ALREADY_REGISTERED = "Already a user";
	public static final String INVALID_USER_CREDENTIALS = "User password does not matched";

	public AccountException(String message) {
		super(message);
	}
}
