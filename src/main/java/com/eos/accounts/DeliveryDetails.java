package main.java.com.eos.accounts;

import java.io.Serializable;
import java.util.Calendar;

public class DeliveryDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String DELIM_1 = "|";
	/*
	 * Product type as defined in Payment
	 */
	private int m_productType;
	public String m_productReference = null;
	private int m_refundId = -1;

	public double m_deliveryCharge = 0.0;

	public Calendar m_generationTime;

	public String m_name = "";
	public String m_street = "";
	public String m_city = "";
	public String m_state = "";
	public String m_pincode = "";
	public String m_country = "";
	public String m_phone = "";

	public String m_mobile = "";
	public String m_email = "";

	public boolean m_isSMS = true;
	public boolean m_isEmail = true;
}
