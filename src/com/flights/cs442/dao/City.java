package com.flights.cs442.dao;

public class City {
	private int cityid;
	private String title;
	private String state;
	
	public City(){
		
	}
	
	public City(int cityid, String title, String state){
		this.cityid = cityid;
		this.title = title;
		this.state = state;
	}
	
	
	
	
	public int getCityid() {
		return cityid;
	}
	public void setCityid(int cityid) {
		this.cityid = cityid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Override
	public String toString() {
		return "City [cityid=" + cityid + ", title=" + title + ", state=" + state + "]";
	}
	
	
	
}
