package com.eos.utils;

public class AccountException extends Exception {
	private static final long serialVersionUID = 1L;
	public static final int INVALID_USER = 1;
	public static final int USER_ALREADY_REGISTERED = 2;
	public static final int INVALID_USER_CREDENTIALS = 3;

	public int code;

	public AccountException(int code, String message) {
		super(message);
		this.code = code;
	}
}
