package com.flights.cs442.dao;

public class User {
	private int uid;
	private String username;
	private String password;
	private String name;
	private String address;
	private boolean enabled = false;
	private String authority;
	
	public User(){
		
	}
	
	


	public User(int uid, String username, String password, String name, String address, boolean enabled,
			String authority) {
		
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.name = name;
		this.address = address;
		this.enabled = enabled;
		this.authority = authority;
	}







	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	



	public String getAuthority() {
		return authority;
	}



	public void setAuthority(String authority) {
		this.authority = authority;
	}



	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", name=" + name + ", address=" + address + ", enabled="
				+ enabled + ", authority=" + authority + "]";
	}



	
	
	
}
