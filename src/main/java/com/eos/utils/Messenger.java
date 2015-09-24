package main.java.com.eos.utils;

import java.io.Serializable;

/**
 * @author Aman Gupta
 * 
 *         Messenger is an abstract class for messages it defines type of
 *         message.
 */
public abstract class Messenger implements Serializable {
	private static final long serialVersionUID = 1L;
	public String messageTo = "";
	public String content = "";
	public String sub = "";
	public String key = "";
	

	public abstract void sendMessage();

	public String serialize() {
		return this.messageTo + "_" + this.content + "_" + this.sub;
	}
	public Messenger deSerialize() {
		return null;
	}
}
