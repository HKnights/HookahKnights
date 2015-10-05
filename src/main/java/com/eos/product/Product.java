package main.java.com.eos.product;

import java.util.concurrent.Callable;

import main.java.com.eos.RequestHandler.AbstractRequestHandler;
import main.java.com.eos.model.Hookah;
import main.java.com.eos.model.Sides;

public abstract class Product implements Callable<Product> {

	public static final int HOOKAH = 1;
	public static final int SIDES = 2;

	public static Product getProductInstance(int prodId) {

		switch (prodId) {

		case HOOKAH:
			return new Hookah();

		case SIDES:
			return new Sides();
		}
		return null;
	}

	public abstract Product populateProduct(AbstractRequestHandler requestHandler) throws Exception;
}