package com.lms.models;

public class Job {

	private int id;
	private int eid;
	private String jobname;
	private String company;
	private String companytype;
	private float minexperience;
	private float salary;
	private String location;
	private String description;
	private int openings;
	private String jobtype;
	private String skills;
	private String website;
	
	
	
	public Job(String jobname, String company, String companytype, float minexperience, float salary,
			String location, String description, int openings, String jobtype, String skills, String website, int eid) {
		super();
		this.eid = eid;
		this.jobname = jobname;
		this.company = company;
		this.companytype = companytype;
		this.minexperience = minexperience;
		this.salary = salary;
		this.location = location;
		this.description = description;
		this.openings = openings;
		this.jobtype = jobtype;
		this.skills = skills;
		this.website = website;
	}
	public Job(int id, String jobname, String company, String companytype, float minexperience, float salary,
			String location, String description, int openings, String jobtype, String skills, String website) {
		super();
		this.id = id;
		this.jobname = jobname;
		this.company = company;
		this.companytype = companytype;
		this.minexperience = minexperience;
		this.salary = salary;
		this.location = location;
		this.description = description;
		this.openings = openings;
		this.jobtype = jobtype;
		this.skills = skills;
		this.website = website;
	}
	public Job(int id, String jobname, String company, String companytype, float minexperience, float salary,
			String location, String description, int openings, String jobtype, String skills, String website, int eid) {
		super();
		this.id = id;
		this.jobname = jobname;
		this.company = company;
		this.companytype = companytype;
		this.minexperience = minexperience;
		this.salary = salary;
		this.location = location;
		this.description = description;
		this.openings = openings;
		this.jobtype = jobtype;
		this.skills = skills;
		this.website = website;
		this.eid = eid;
	}
	public Job(String jobname, String company, String companytype, float minexperience, float salary, String location,
			String description, int openings, String jobtype, String skills, String website) {
		super();
		this.jobname = jobname;
		this.company = company;
		this.companytype = companytype;
		this.minexperience = minexperience;
		this.salary = salary;
		this.location = location;
		this.description = description;
		this.openings = openings;
		this.jobtype = jobtype;
		this.skills = skills;
		this.website = website;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCompanytype() {
		return companytype;
	}
	public void setCompanytype(String companytype) {
		this.companytype = companytype;
	}
	public float getMinexperience() {
		return minexperience;
	}
	public void setMinexperience(float minexperience) {
		this.minexperience = minexperience;
	}
	public float getSalary() {
		return salary;
	}
	public void setSalary(float salary) {
		this.salary = salary;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getOpenings() {
		return openings;
	}
	public void setOpenings(int openings) {
		this.openings = openings;
	}
	public String getJobtype() {
		return jobtype;
	}
	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	@Override
	public String toString() {
		return "Job [id=" + id + ", eid=" + eid + ", jobname=" + jobname + ", company=" + company + ", companytype="
				+ companytype + ", minexperience=" + minexperience + ", salary=" + salary + ", location=" + location
				+ ", description=" + description + ", openings=" + openings + ", jobtype=" + jobtype + ", skills="
				+ skills + ", website=" + website + "]";
	}
	
	
}
