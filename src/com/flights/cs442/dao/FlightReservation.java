package com.flights.cs442.dao;

import java.sql.Date;

public class FlightReservation {
	private int ordernum;
	private int uid;
	private int dfid;
	private int rfid;
	private int qty;
	private String cardnum;
	private int cardmonth;
	private int cardyear;
	private Date order_date;
	
	
	public FlightReservation(){
		
	}
	

	public FlightReservation(int ordernum, int uid, int dfid, int rfid, int qty, String cardnum, int cardmonth,
			int cardyear, Date order_date) {
		this.ordernum = ordernum;
		this.uid = uid;
		this.dfid = dfid;
		this.rfid = rfid;
		this.qty = qty;
		this.cardnum = cardnum;
		this.cardmonth = cardmonth;
		this.cardyear = cardyear;
		this.order_date = order_date;
	}



	public int getOrdernum() {
		return ordernum;
	}


	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}


	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public int getDfid() {
		return dfid;
	}


	public void setDfid(int dfid) {
		this.dfid = dfid;
	}


	public int getRfid() {
		return rfid;
	}


	public void setRfid(int rfid) {
		this.rfid = rfid;
	}


	public int getQty() {
		return qty;
	}


	public void setQty(int qty) {
		this.qty = qty;
	}


	public String getCardnum() {
		return cardnum;
	}


	public void setCardnum(String cardnum) {
		this.cardnum = cardnum;
	}


	public int getCardmonth() {
		return cardmonth;
	}


	public void setCardmonth(int cardmonth) {
		this.cardmonth = cardmonth;
	}


	public int getCardyear() {
		return cardyear;
	}


	public void setCardyear(int cardyear) {
		this.cardyear = cardyear;
	}


	public Date getOrder_date() {
		return order_date;
	}


	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}


	@Override
	public String toString() {
		return "FlightReservation [ordernum=" + ordernum + ", uid=" + uid + ", dfid=" + dfid + ", rfid=" + rfid
				+ ", qty=" + qty + ", cardnum=" + cardnum + ", cardmonth=" + cardmonth + ", cardyear=" + cardyear
				+ ", order_date=" + order_date + "]";
	}
	
	
}
