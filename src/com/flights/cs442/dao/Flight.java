package com.flights.cs442.dao;

import java.sql.Date;
import java.sql.Time;

public class Flight {
	private int fid;
	private int fnumber;
	private Date fdate;
	private Time ftime;
	private double price;
	private int seatClass;
	private int capacity;
	private int available;
	private int orig;
	private int dest;
	
	
	
	public Flight(int fid, int fnumber, Date fdate, Time ftime, double price, int seatClass, int capacity,
			int available, int orig, int dest) {
		
		this.fid = fid;
		this.fnumber = fnumber;
		this.fdate = fdate;
		this.ftime = ftime;
		this.price = price;
		this.seatClass = seatClass;
		this.capacity = capacity;
		this.available = available;
		this.orig = orig;
		this.dest = dest;
	}
	
	
	public Flight() {
		//everything gets default values and will be overridden.
	}


	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getFnumber() {
		return fnumber;
	}
	public void setFnumber(int fnumber) {
		this.fnumber = fnumber;
	}
	public Date getFdate() {
		return fdate;
	}
	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}
	public Time getFtime() {
		return ftime;
	}
	public void setFtime(Time ftime) {
		this.ftime = ftime;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getSeatClass() {
		return seatClass;
	}
	public void setSeatClass(int seatClass) {
		this.seatClass = seatClass;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getAvailable() {
		return available;
	}
	public void setAvailable(int available) {
		this.available = available;
	}
	public int getOrig() {
		return orig;
	}
	public void setOrig(int orig) {
		this.orig = orig;
	}
	public int getDest() {
		return dest;
	}
	public void setDest(int dest) {
		this.dest = dest;
	}


	@Override
	public String toString() {
		return "Flight [fid=" + fid + ", fnumber=" + fnumber + ", fdate=" + fdate + ", ftime=" + ftime + ", price="
				+ price + ", seatClass=" + seatClass + ", capacity=" + capacity + ", available=" + available + ", orig="
				+ orig + ", dest=" + dest + "]";
	}
	
	
	
	
	
	
	
}
