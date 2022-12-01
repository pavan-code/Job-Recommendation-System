package com.lms.models;

public class Applications {
	
	private int id;
	private int jobid;
	private int empid;
	private int emprid;
	String status;
	public Applications(int id, int jobid, int empid, String status, int emprid) {
		super();
		this.id = id;
		this.jobid = jobid;
		this.empid = empid;
		this.status = status;
		this.emprid = emprid;
	}
	
	public Applications(int jobid, int empid, String status, int emprid) {
		super();
		this.jobid = jobid;
		this.empid = empid;
		this.status = status;
		this.emprid = emprid;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getJobid() {
		return jobid;
	}
	public void setJobid(int jobid) {
		this.jobid = jobid;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getEmprid() {
		return emprid;
	}

	public void setEmprid(int emprid) {
		this.emprid = emprid;
	}

	@Override
	public String toString() {
		return "Applications [id=" + id + ", jobid=" + jobid + ", empid=" + empid + ", emprid=" + emprid + ", status="
				+ status + "]";
	}
}
