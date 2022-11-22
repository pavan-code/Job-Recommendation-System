package com.lms.models;

public class Notes {
	int id;
	int student_id;
	int notebook_id;
	String name;
	String startDate;
	String endDate;
	String remDate;
	String status;
	String tag;
	String desc;
	
	public Notes(int id, int student_id, int notebook_id, String name, String startDate, String endDate, String remDate, String status,
			String tag, String desc) {
		super();
		this.id = id;
		this.student_id = student_id;
		this.notebook_id = notebook_id;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.remDate = remDate;
		this.status = status;
		this.tag = tag;
		this.desc = desc;
	}
	public Notes(int student_id, int notebook_id, String name, String startDate, 
			String endDate, String remDate, String status, String tag, String desc) {
		super();
		this.student_id = student_id;
		this.notebook_id = notebook_id;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.remDate = remDate;
		this.status = status;
		this.tag = tag;
		this.desc = desc;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getNotebook_id() {
		return notebook_id;
	}
	public void setNotebook_id(int notebook_id) {
		this.notebook_id = notebook_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRemDate() {
		return remDate;
	}
	public void setRemDate(String remDate) {
		this.remDate = remDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	@Override
	public String toString() {
		return "Notes [id=" + id + ", student_id=" + student_id + ", notebook_id=" + notebook_id + ", name=" + name
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", remDate=" + remDate + ", status=" + status
				+ ", tag=" + tag + ", desc=" + desc + "]";
	}
	
	
}
