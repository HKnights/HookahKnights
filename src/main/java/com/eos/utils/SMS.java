package main.java.com.eos.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.logging.Logger;

/**
 *
 * @author sreenath
 */
public class SMS extends Messenger {
	public static final String ACCOUNT_SID = "AC29103a3572977b4525f2cf9db2e1a671";
	public static final String AUTH_TOKEN = "dd382bd6d870982d2da7345bb5dc5ee7";

	private URLConnection sendSMSConnection;
	private String sessionCookie;
	private Proxy proxy;
	protected static String JAVAMAIL_PROPERTIES = "javamail.properties";
	static Logger log = Logger.getLogger(SMS.class.getName());

	public SMS(String messageTo, String content, String sub) {
		this.messageTo = messageTo;
		this.content = content;
		this.sub = sub;
	}

	// Function to support connection through an HTTP Proxy
	public void setProxy(String proxyHost, int proxyPort) {
		proxy = new Proxy(Proxy.Type.HTTP, java.net.InetSocketAddress.createUnresolved(proxyHost, proxyPort));
	}

	// Logging in to Way2sms and returning the authentication cookie
	// No need to Give the cookie back to sendSMS() but cookie is returned for
	// expanding the flexibility of the code
	public String loginWay2SMS(String userName, String password) {
		String cookie = null;
		URL urlLogin;
		String loginContent;
		HttpURLConnection loginConnection;
		if (userName == null || userName.isEmpty()) {
			System.err.println("A Valid User Name must be present!");
			System.exit(0);
		}
		if (password == null || password.isEmpty()) {
			System.err.println("A Valid Password must be present!");
			System.exit(0);
		}
		try {
			// UTF-8 encoding is the web standard so data must be encoded to
			// UTF-8
			userName = URLEncoder.encode(userName, "UTF-8");
			password = URLEncoder.encode(password, "UTF-8");
			urlLogin = new URL("http://site5.way2sms.com/auth.cl");
			if (proxy == null) {
				loginConnection = (HttpURLConnection) urlLogin.openConnection();
			} else {
				loginConnection = (HttpURLConnection) urlLogin.openConnection(proxy);
			}

			loginContent = "username=" + userName + "&password=" + password;
			// Faking that we are from a valid client
			loginConnection.setDoOutput(true);
			loginConnection.setRequestProperty("User-Agent",
					"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5");
			loginConnection.setRequestProperty("Content-Length", String.valueOf(loginContent.length()));
			loginConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			loginConnection.setRequestProperty("Accept", "*/*");
			loginConnection.setRequestProperty("Referer", "http://site5.way2sms.com//entry.jsp");
			loginConnection.setRequestMethod("POST");
			loginConnection.setInstanceFollowRedirects(false);
			// Writing the Content to the site
			PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(loginConnection.getOutputStream()), true);
			printWriter.print(loginContent);
			printWriter.flush();
			printWriter.close();
			// Reading the cookie
			cookie = loginConnection.getHeaderField("Set-Cookie");

		} catch (MalformedURLException ex) {
			System.err.println("Login URL Error");
			System.exit(0);
		} catch (UnsupportedEncodingException ex) {
			System.err.println("Error in encoding Username or Password");
			System.exit(0);
		} catch (IOException ex) {
			System.err.println("Can not connect to Login URL");
			System.exit(0);
		}
		if (cookie == null || cookie.isEmpty()) {
			System.err.println(
					"Some error occured...Try again in a few seconds..If still problem exists check your username and password");
		}
		sessionCookie = cookie;
		return cookie;

	}

	public void sendSMS(String phoneNumber, String message, String action) {
		// http://api.clickatell.com/http/sendmsg?user=hknights&password=CgJEPXWSLRfGOd&api_id=3561635&to=917829626302&text=HookahKnights%20!!!
		String url = "http://api.clickatell.com/http/sendmsg?user=HKNIGHTS01&password=JUWDGNDEfZFEYB&api_id=3568202&to=919742850966&text=HookahKnights%20!!!";
		URL obj;
		try {
			obj = new URL(url);

			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			// optional default is GET
			con.setRequestMethod("GET");

			// add request header
			con.setRequestProperty("User-Agent", "Mozilla/5.0");

			int responseCode = con.getResponseCode();
			System.out.println("\nSending 'GET' request to URL : " + url);
			System.out.println("Response Code : " + responseCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void logoutWay2SMS() {
		try {
			HttpURLConnection logoutConnection;
			URL logoutURL;
			logoutURL = new URL("http://site5.way2sms.com/jsp/logout.jsp");
			if (proxy == null) {
				logoutConnection = (HttpURLConnection) logoutURL.openConnection();
			} else {
				logoutConnection = (HttpURLConnection) logoutURL.openConnection(proxy);
			}

			logoutConnection.setRequestProperty("User-Agent",
					"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.0.5) Gecko/2008120122 Firefox/3.0.5");
			logoutConnection.setRequestProperty("Accept", "*/*");
			logoutConnection.setRequestProperty("Cookie", sessionCookie);
			logoutConnection.setRequestMethod("GET");
			logoutConnection.setInstanceFollowRedirects(false);
			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(logoutConnection.getInputStream()));
			while ((bufferedReader.readLine()) != null)
				;
			bufferedReader.close();
		} catch (MalformedURLException ex) {
			System.err.println("Logout URL Error");
			System.exit(0);
		} catch (IOException ex) {
			System.err.println("Logout URL Connection Error");
			System.exit(0);
		}
	}

	public SMS() {
		proxy = null;
		sendSMSConnection = null;
	}

	public void sendMessage() {
		log.warning("SMS SENDING started!");
		// http://api.clickatell.com/http/sendmsg?user=hknights&password=CgJEPXWSLRfGOd&api_id=3561635&to=917829626302&text=HookahKnights%20!!!
		String url = "http://api.clickatell.com/http/sendmsg?user=HKNIGHTS01&password=JUWDGNDEfZFEYB&api_id=3568202&to=919742850966&text=HookahKnights%20!!!";
		URL obj;
		try {
			obj = new URL(url);

			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			// optional default is GET
			con.setRequestMethod("GET");

			// add request header
			con.setRequestProperty("User-Agent", "Mozilla/5.0");

			int responseCode = con.getResponseCode();
			System.out.println("\nSending 'GET' request to URL : " + url);
			System.out.println("Response Code : " + responseCode);
			log.warning("sms sent!");
		} catch (Exception e) {
			log.warning("SMS ERROR !" + e);

		}

		// TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID,
		// AUTH_TOKEN);
		//
		// List<NameValuePair> params = new ArrayList<NameValuePair>();
		// params.add(new BasicNameValuePair("To", "+919742850966"));
		// params.add(new BasicNameValuePair("From", "+919742850966"));
		// params.add(new BasicNameValuePair("Body", "asasasa"));
		//
		// MessageFactory messageFactory =
		// client.getAccount().getMessageFactory();
		// Message message;
		// try {
		// message = messageFactory.create(params);
		// System.out.println(message.getSid());
		// } catch (TwilioRestException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
	}
}