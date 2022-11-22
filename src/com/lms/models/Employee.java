package com.lms.models;

import java.io.InputStream;

public class Employee {
	
	private int id;
	private String username;
	private String email;
	private String password;
	private String address;
	private String mobile;
	private String skills;
	private float experience;	
	private int noticeperiod;
	private InputStream resume;
	private InputStream image;
	private String imgstr;
	
	
	
	

	public Employee(int id, String username, String email, String password, String mobile) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
	}


	public String getImgstr() {
		return imgstr;
	}


	public void setImgstr(String imgstr) {
		this.imgstr = imgstr;
	}


	public Employee(int id, String username, String email, String password, String address, String mobile,
			String skills, float experience, int noticeperiod, InputStream resume, InputStream fileInputStream) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.mobile = mobile;
		this.skills = skills;
		this.experience = experience;
		this.noticeperiod = noticeperiod;
		this.resume = resume;
		this.image = fileInputStream;
	}
	

	public Employee(int id, String username, String email, String password, String address, String mobile, String skills,
			float experience, int noticeperiod) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.mobile = mobile;
		this.skills = skills;
		this.experience = experience;
		this.noticeperiod = noticeperiod;
		
	}

	public Employee(String username, String email, String password, String address, String mobile, String skills,
			float experience, int noticeperiod, InputStream resume) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.mobile = mobile;
		this.skills = skills;
		this.experience = experience;
		this.noticeperiod = noticeperiod;
		this.resume = resume;
	}
	
	public Employee(String username, String email, String password, String address, String mobile, float experience, InputStream image) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.address = address;
		this.mobile = mobile;
		this.experience = experience;
		this.image = image;
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
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public float getExperience() {
		return experience;
	}
	public void setExperience(float experience) {
		this.experience = experience;
	}
	public int getNoticeperiod() {
		return noticeperiod;
	}
	public void setNoticeperiod(int noticeperiod) {
		this.noticeperiod = noticeperiod;
	}
	public InputStream getResume() {
		return resume;
	}
	public void setResume(InputStream resume) {
		this.resume = resume;
	}
	public InputStream getImage() {
		return image;
	}

	public void setImage(InputStream image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password
				+ ", address=" + address + ", mobile=" + mobile + ", skills=" + skills + ", experience=" + experience
				+ ", noticeperiod=" + noticeperiod + ", resume=" + resume + ", image=" + image + "]";
	}	
}
