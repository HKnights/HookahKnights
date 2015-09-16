package com.eos.demo;

import com.eos.model.HookahKnights;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class HookahData {

	public static void main(String a[]) {

		int prodId = 1;
		String prodName = "Small Sized Hookah";
		double price = 500;
		int coal = 3;
		String flavourFirst = "Mint";
		String flavourSecond = "Paan";
		String base = "Water";
		double security = 500;

		HookahKnights hk = new HookahKnights();
		hk.setProdId(prodId);
		hk.setProdName(prodName);
		hk.setPrice(price);
		hk.setCoal(coal);
		hk.setBase(base);
		hk.setFlavourFirst(flavourFirst);
		hk.setFlavourSecond(flavourSecond);
		hk.setSecurity(security);

		addDataToDataStore(hk);
	}

	public static void addDataToDataStore(HookahKnights hk) {

		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		// Query q = new Query("UserCart");
		// PreparedQuery pq = ds.prepare(q);
		// pq.asSingleEntity().getProperty("NJJ");
		Entity e = new Entity("HookahTypes", hk.getProdId());
		e.setProperty("prod_id", hk.getProdId());
		e.setProperty("prod_name", hk.getProdName());
		e.setProperty("price", hk.getPrice());
		e.setProperty("coal", hk.getCoal());
		e.setProperty("base", hk.getBase());
		e.setProperty("flavourFirst", hk.getFlavourFirst());
		e.setProperty("flavourSecond", hk.getFlavourSecond());
		e.setProperty("security", hk.getSecurity());
		ds.put(e);
	}
}
