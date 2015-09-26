package main.java.com.eos.utils;

import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email extends Messenger {
	private static String username = "";
	private static String password = "";
	protected static String HOOKAHMAIL_PROPERTIES = "hookahmail.properties";
	static Logger log = Logger.getLogger(Email.class.getName());

	public Email() {
	}

	public Email(String mailTo, String content, String sub) {
		this.messageTo = mailTo;
		this.content = content;
		this.sub = sub;
	}

	static {
		initCredentials();
	}

	private static void initCredentials() {
		InputStream is = null;
		try {
			is = TransportQueueManager.class.getClassLoader().getResourceAsStream(HOOKAHMAIL_PROPERTIES);
			Properties prop = new Properties();
			prop.load(is);
			username = prop.getProperty("email_id");
			password = prop.getProperty("pass");
		} catch (Exception e) {
		}

	}

	@Override
	public void sendMessage() {
		log.log(Level.SEVERE, " 1st ===> setup Mail Server Properties..");
		Properties mailServerProperties = new Properties();
		Session getMailSession;
		MimeMessage generateMailMessage;
		Session session = Session.getDefaultInstance(mailServerProperties, null);

		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(username));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(messageTo));
			msg.setSubject(sub);
			msg.setText(content);
			Transport.send(msg);
			log.log(Level.SEVERE, " ===> sent");

		} catch (Exception e) {
			log.log(Level.SEVERE, " error");

		}
		// try {
		// log.log(Level.SEVERE, " 1st ===> setup Mail Server Properties..");
		// mailServerProperties = System.getProperties();
		// mailServerProperties.put("mail.smtp.port", "587");
		// mailServerProperties.put("mail.smtp.auth", "true");
		// mailServerProperties.put("mail.smtp.starttls.enable", "true");
		// System.out.println("Mail Server Properties have been setup
		// successfully..");
		//
		// // Step2
		// log.log(Level.SEVERE, "\n\n 2nd ===> get Mail Session..");
		// getMailSession = Session.getDefaultInstance(mailServerProperties,
		// null);
		// generateMailMessage = new MimeMessage(getMailSession);
		// generateMailMessage.addRecipient(Message.RecipientType.TO, new
		// InternetAddress(messageTo));
		// generateMailMessage.setSubject(sub);
		// generateMailMessage.setContent(content, "text/html");
		// System.out.println("Mail Session has been created successfully..");
		//
		// // Step3
		// log.log(Level.SEVERE, "\n\n 3rd ===> Get Session and Send mail");
		//
		// Transport transport = getMailSession.getTransport("smtp");
		//
		// // Enter your correct gmail UserID and Password
		// // if you have 2FA enabled then provide App Specific Password
		// transport.connect("smtp.gmail.com", username, password);
		// transport.sendMessage(generateMailMessage,
		// generateMailMessage.getAllRecipients());
		// transport.close();
		// log.log(Level.SEVERE, "\n\n 4th ===> Sent");

		// Properties props = new Properties();
		// props.put("mail.smtp.host", "smtp.gmail.com");
		// props.setProperty("mail.transport.protocol", "smtp");
		// props.setProperty("mail.host", "smtp.gmail.com");
		// props.put("mail.smtp.auth", "true");
		// props.put("mail.smtp.port", "465");
		// props.put("mail.debug", "true");
		// props.put("mail.smtp.socketFactory.port", "465");
		// props.put("mail.smtp.socketFactory.class",
		// "javax.net.ssl.SSLSocketFactory");
		// props.put("mail.smtp.socketFactory.fallback", "false");
		// Session session = Session.getInstance(props, new
		// javax.mail.Authenticator() {
		// protected PasswordAuthentication getPasswordAuthentication() {
		// return new PasswordAuthentication(username, password);
		// }
		// });
		//
		// Transport transport = session.getTransport();
		// InternetAddress addressFrom = new InternetAddress(username);
		//
		// MimeMessage message = new MimeMessage(session);
		// message.setSender(addressFrom);
		// message.setSubject(sub);
		// message.setContent(content, "text/plain");
		// message.addRecipient(Message.RecipientType.TO, new
		// InternetAddress("aman.ishu.virgo@gmail.com"));
		//
		// transport.connect();
		// Transport.send(message);
		// transport.close();
		// } catch (Exception e) {
		// log.log(Level.SEVERE, "cannot send email for id :" + messageTo, e);
		// }
	}
}
