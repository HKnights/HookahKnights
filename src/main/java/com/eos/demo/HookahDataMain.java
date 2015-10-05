package main.java.com.eos.demo;

import main.java.com.eos.model.HookahData;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class HookahDataMain {

	public static void main(String a[]) {

		int prodId = 3;
		String prodName = "Large Hookah";
		String size = "L";
		double price = 700;
		int coal = 5;
		double security = 1000;

		HookahData hk = new HookahData();
		hk.setProdId(prodId);
		hk.setProdName(prodName);
		hk.setProdSize(size);
		hk.setCoal(coal);
		hk.setPrice(price);
		hk.setSecurity(security);

		addDataToDataStore(hk);
	}

	public static void addDataToDataStore(HookahData hk) {

		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		// Query q = new Query("UserCart");
		// PreparedQuery pq = ds.prepare(q);
		// pq.asSingleEntity().getProperty("NJJ");
		Entity e = new Entity("HookahProd", hk.getProdId());
		e.setProperty("prod_id", hk.getProdId());
		e.setProperty("prod_name", hk.getProdName());
		e.setProperty("prod_size", hk.getProdSize());
		e.setProperty("coal", hk.getCoal());
		e.setProperty("price", hk.getPrice());
		e.setProperty("security", hk.getSecurity());
		ds.put(e);
	}
}
