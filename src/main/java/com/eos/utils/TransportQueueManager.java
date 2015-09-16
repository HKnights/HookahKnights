package main.java.com.eos.utils;

import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.google.appengine.api.ThreadManager;
import com.google.appengine.api.log.LogQuery;
import com.google.appengine.api.log.LogService;
import com.google.appengine.api.log.LogServiceFactory;
import com.google.apphosting.api.logservice.LogServicePb.LogServiceError;

import sun.util.logging.resources.logging;

/**
 * @author Aman Gupta
 * 
 *         TransportQueueManager manages Messages to be dispatched.
 */

public class TransportQueueManager {
	public static BlockingQueue<TransportMessage> s_transportQueue = new LinkedBlockingQueue<TransportMessage>();
	static Thread s_processTransportQueueThread;
	protected static String JAVAMAIL_PROPERTIES = "javamail.properties";
	static Logger log = Logger.getLogger(TransportQueueManager.class.getName());

	private static String username = "";
	private static String password = "";

	static {
		startProcessingTransportQueue();
		initCredentials();
	}

	public static synchronized void startProcessingTransportQueue() {
		if (s_processTransportQueueThread == null) {
			s_processTransportQueueThread = ThreadManager.createBackgroundThread(new Runnable() {
				public void run() {
					while (true) {
						try {
							if (!s_transportQueue.isEmpty())
								s_transportQueue.take().run();
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				}
			});
			s_processTransportQueueThread.start();
		}
	}

	private static void initCredentials() {
		InputStream is = null;
		try {
			is = TransportQueueManager.class.getClassLoader().getResourceAsStream(JAVAMAIL_PROPERTIES);
			Properties prop = new Properties();
			prop.load(is);
			username = prop.getProperty("email_id");
			password = prop.getProperty("pass");
		} catch (Exception e) {
		}

	}

	public static void sendMail(String mailTo, String content, String sub) {
		try {
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.setProperty("mail.transport.protocol", "smtp");
			props.setProperty("mail.host", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.debug", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			Transport transport = session.getTransport();
			InternetAddress addressFrom = new InternetAddress(username);

			MimeMessage message = new MimeMessage(session);
			message.setSender(addressFrom);
			message.setSubject(sub);
			message.setContent(content, "text/plain");
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));

			transport.connect();
			Transport.send(message);
			transport.close();
		} catch (Exception e) {
			log.log(Level.SEVERE, "cannot send  email for id :" + mailTo, e);
		}
	}

	public class TransportMessage implements Runnable {
		String mailTo = "";
		String content = "";
		String sub = "";

		public TransportMessage(String mailTo, String content, String sub) {
			this.mailTo = mailTo;
			this.content = content;
			this.sub = sub;
		}

		public void run() {
			sendMail(mailTo, content, sub);
		}
	}
}
