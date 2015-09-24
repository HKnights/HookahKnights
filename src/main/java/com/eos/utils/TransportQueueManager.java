package main.java.com.eos.utils;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.ThreadManager;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.QueryResultIterable;
import com.google.appengine.api.datastore.QueryResultList;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

import main.java.com.eos.accounts.User;
import sun.security.pkcs11.Secmod.DbMode;

/**
 * @author Aman Gupta
 * 
 *         TransportQueueManager manages Messages to be dispatched.
 */

public class TransportQueueManager extends HttpServlet {
	public static BlockingQueue<TransportMessage> s_transportQueue;
	static Thread s_processTransportQueueThread;
	static Logger log = Logger.getLogger(TransportQueueManager.class.getName());

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		log.warning("Backend started!");
		startProcessingTransportQueue();
		log.log(Level.WARNING, "Backend terminating!");
	}

	public static void addTransportQueueThread(TransportMessage transportMessage) {
		s_transportQueue.add(transportMessage);
	}

	public void startProcessingTransportQueue() {
		s_transportQueue = new LinkedBlockingQueue<TransportMessage>();
		if (s_processTransportQueueThread == null) {
			s_processTransportQueueThread = ThreadManager.createBackgroundThread(new Runnable() {
				public void run() {
					while (true) {
						try {
							getQueuedMessenger();
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

	public class TransportMessage implements Runnable {
		Messenger messenger;

		public TransportMessage(Messenger messenger) {
			this.messenger = messenger;
		}

		public void run() {
			log.log(Level.INFO, "processing message");
			messenger.sendMessage();
			updateProssedMessage(messenger.key);
		}
	}

	public static void insertMessenger(Messenger messengerObject) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Entity e = null;
		e = new Entity("transportqueue", messengerObject.hashCode());
		e.setProperty("mess_obj", messengerObject.serialize());
		e.setProperty("obj_class", messengerObject.getClass().getName());
		e.setProperty("status", "I");
		// e.setProperty("user_id", name);
		// e.setProperty("content", userEmail);
		// e.setProperty("subject", userImage);
		ds.put(e);
	}

	public static void getQueuedMessenger() {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Filter filter = new FilterPredicate("status", FilterOperator.EQUAL, "I");
		Query q = new Query("transportqueue").setFilter(filter);
		PreparedQuery pq = ds.prepare(q);
		for (Entity entity : pq.asIterable()) {
			// Entity entity=results.next();
			String[] messData = ((String) entity.getProperty("mess_obj")).split("_");
			Messenger messenger = new Email(messData[0], messData[1], messData[2]);
			messenger.key=entity.getKey().getId()+"";
			try {
				s_transportQueue.put(new TransportQueueManager().new TransportMessage(messenger));
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void updateProssedMessage(String key) {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Entity entity;
		try {
			entity = datastore.get(KeyFactory.createKey("transportqueue", Integer.parseInt(key)));
			entity.setProperty("status", "D");
			datastore.put(entity);
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
