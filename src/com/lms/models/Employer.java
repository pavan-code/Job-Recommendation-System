package com.lms.models;

public class Employer {
	
	private int id;
	private String username;
	private String email;
	private String password;
	private String address;
	private String mobile;
	private String company;
	public Employer(int id, String username, String email, String password, String address, String mobile,
			String company) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.mobile = mobile;
		this.company = company;
	}

	public Employer(String username, String email, String password, String address, String mobile, String company) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.mobile = mobile;
		this.company = company;
	}

	public Employer(int id, String username, String email, String password, String mobile) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "Employer [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password
				+ ", address=" + address + ", mobile=" + mobile + ", company=" + company + "]";
	}
	
}
