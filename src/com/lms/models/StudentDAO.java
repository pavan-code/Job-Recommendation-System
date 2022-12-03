package com.lms.models;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentDAO {

	private String jdbcURL;
	private String jdbcUsername;
	private String jdbsPassword;
	private Connection jdbcConnection = null;

	public StudentDAO() throws SQLException {
		this.jdbcURL = "jdbc:mysql://localhost:3306/jobrecommendationsystem?autoReconnect=true";
		this.jdbcUsername = "root";
		this.jdbsPassword = "root";
		// System.out.println("set parameters");
		this.connect();
	}

	protected void connect() throws SQLException {
		System.out.println("Connecting to the db...");
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbsPassword);
				System.out.println("connected to the database: jrs");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
		}
	}

	public boolean getEmployeeByEmail(String email) throws SQLException {
		String sql = "select email from employee where email=?";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, email);
		ResultSet rs = statement.executeQuery();
		if (rs.next())
			return true;
		return false;
	}

	public boolean getEmployerByEmail(String email) throws SQLException {
		String sql = "select email from employer where email=?";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, email);
		ResultSet rs = statement.executeQuery();
		if (rs.next())
			return true;
		return false;
	}

	public Map<String, String> login(String email, String password, String role, Map<String, String> messages)
			throws SQLException {

		String sql = "select empid, email, password, type from credentials where email = ?";

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, email);
		ResultSet rsResultSet = statement.executeQuery();

		if (rsResultSet.next()) {
			if (rsResultSet.getString(3).equals(password)) {
				if (rsResultSet.getString(4).equals(role)) {
					messages.put("id", Integer.toString(rsResultSet.getInt(1)));
					messages.put("type", role);
				} else {
					messages.put("message", role + " doesn't exist");
				}
			} else
				messages.put("message", "Incorrect password");
		} else
			messages.put("message", role + " doesn't exist");
		return messages;
	}

	public boolean insertEmployee(Employee employee) throws SQLException {
		String sql = "INSERT INTO employee (username, email, mobile, password, address, experience, image) VALUES(?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
//		PreparedStatement statement1 = jdbcConnection.prepareStatement(sql1);

		statement.setString(1, employee.getUsername());
		statement.setString(2, employee.getEmail());
		statement.setString(3, employee.getMobile());
		statement.setString(4, employee.getPassword());
		statement.setString(5, employee.getAddress());
		statement.setString(6, String.valueOf(employee.getExperience()));
		statement.setString(7, employee.getImage());
		boolean result = statement.executeUpdate() > 0;

		return result;
	}

	public boolean activate(int id, String email, String pwd, String role) throws SQLException {
		String sql1 = "insert into credentials (email, password, type, empid) values(?, ?, ?, ?)";
		String sql = "update " + role + " set active=? where email= ? and id=?";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, 1);
		statement.setString(2, email);
		statement.setInt(3, id);
		int re = 0;
		Boolean res = statement.executeUpdate() > 0;
		if (res) {
			System.out.println("status updated");
			statement = jdbcConnection.prepareStatement(sql1);
			statement.setString(1, email);
			statement.setString(2, pwd);
			statement.setString(3, role);
			statement.setInt(4, id);
			re = statement.executeUpdate();
			if (re > 0)
				return true;
			return false;

		}
		return false;
	}

	public List<Employee> getUnactivatedEmployees() throws SQLException {
		String sql = "select id, username, email, password, mobile from employee where active is null";
		List<Employee> emps = new ArrayList<>();
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);

		ResultSet res = statement.executeQuery();
		while (res.next()) {
			Employee emp = new Employee(res.getInt(1), res.getString(2), res.getString(3), res.getString(4),
					res.getString(5));
			emps.add(emp);
		}
		return emps;

	}

	public List<Employer> getUnactivatedEmployers() throws SQLException {
		String sql = "select id, username, email, password, mobile from employer where active is null";
		List<Employer> emprs = new ArrayList<>();
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);

		ResultSet res = statement.executeQuery();
		while (res.next()) {
			Employer emp = new Employer(res.getInt(1), res.getString(2), res.getString(3), res.getString(4),
					res.getString(5));
			emprs.add(emp);
		}
		return emprs;

	}

	public boolean insertEmployer(Employer employer) throws SQLException {
		String sql = "INSERT INTO employer (username, email, mobile, password, address, company) VALUES(?, ?, ?, ?, ?, ?)";
		//String sql1 = "insert into credentials (email, password, type, empid) values(?, ?, ?, ?)";

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		//PreparedStatement statement1 = jdbcConnection.prepareStatement(sql1);

		statement.setString(1, employer.getUsername());
		statement.setString(2, employer.getEmail());
		statement.setString(3, employer.getMobile());
		statement.setString(4, employer.getPassword());
		statement.setString(5, employer.getAddress());
		statement.setString(6, employer.getCompany());
		boolean result = statement.executeUpdate() > 0;

//		sql = "select id from employer where email= ?";
//		statement = jdbcConnection.prepareStatement(sql);
//		statement.setString(1, employer.getEmail());
//		ResultSet rs = statement.executeQuery();
//		if (rs.next()) {
//			statement1.setString(1, employer.getEmail());
//			statement1.setString(2, employer.getPassword());
//			statement1.setString(3, "Employer");
//			statement1.setInt(4, rs.getInt(1));
//			statement1.executeUpdate();
//			statement.close();
//			statement1.close();
//		}
		return result;
	}

	public boolean insertJob(Job job) throws SQLException {

		String sql = "insert into job (jobname, company, companytype, minexperience, "
				+ "salary, location, description, openings, jobtype, skills, website, empid) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, job.getJobname());
		statement.setString(2, job.getCompany());
		statement.setString(3, job.getCompanytype());
		statement.setFloat(4, job.getMinexperience());
		statement.setFloat(5, job.getSalary());
		statement.setString(6, job.getLocation());
		statement.setString(7, job.getDescription());
		statement.setInt(8, job.getOpenings());
		statement.setString(9, job.getJobtype());
		statement.setString(10, job.getSkills());
		statement.setString(11, job.getWebsite());
		statement.setInt(12, job.getEid());
		boolean res = statement.executeUpdate() > 0;
		return res;
	}

	public List<Job> getJobs() throws SQLException {
		List<Job> jobs = new ArrayList<>();
		String sql = "select * from job order by id";
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12), rs.getInt(13));
			jobs.add(j);
		}
		return jobs;
	}

	public List<Employee> getEmployees() throws SQLException {
		List<Employee> emps = new ArrayList<>();
		String sql = "select * from employee order by id";
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			Employee e = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getFloat(8), rs.getInt(9), rs.getString("image"));

			emps.add(e);
		}
		return emps;
	}

	public List<Employer> getEmployers() throws SQLException {
		List<Employer> emprs = new ArrayList<>();
		String sql = "select * from employer order by id";
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			Employer e = new Employer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7));

			emprs.add(e);
		}
		return emprs;
	}

	public Employee getEmployee(int id) throws SQLException {
		String sql = "select * from employee where id=" + id;

		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		Employee emp = null;

		if (rs.next()) {
			emp = new Employee(rs.getInt("id"), rs.getString("username"), rs.getString("email"),
					rs.getString("password"), rs.getString("address"), rs.getString("mobile"), rs.getString("skills"),
					rs.getFloat("experience"), rs.getInt("noticeperiod"), rs.getString("image"));
		}
		return emp;
	}

	public Employer getEmployer(int id) throws SQLException {
		String sql = "select * from employer where id=" + id;

		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		Employer empr = null;

		if (rs.next()) {
			empr = new Employer(rs.getInt("id"), rs.getString("username"), rs.getString("email"),
					rs.getString("password"), rs.getString("address"), rs.getString("mobile"), rs.getString("company"));
		}
		return empr;
	}

	public boolean updateEmployee(Employee emp) throws SQLException {
		int id = emp.getId();
		String sql = "select * from employee where id=" + id;
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		if (rs.next()) {
			sql = "update employee set password = '" + emp.getPassword() + "', address ='" + emp.getAddress()
					+ "', mobile = '" + emp.getMobile() + "', skills = ?, experience = " + emp.getExperience()
					+ ", noticeperiod = " + emp.getNoticeperiod() + " where id=" + id;

			stmt = jdbcConnection.prepareStatement(sql);
			stmt.setString(1, emp.getSkills());

			return stmt.executeUpdate() > 0;
		} else
			return false;
	}

	public boolean updateEmployer(Employer emp) throws SQLException {
		int id = emp.getId();
		String sql = "select * from employer where id=" + id;
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		if (rs.next()) {
			sql = "update employer set password = '" + emp.getPassword() + "', address ='" + emp.getAddress()
					+ "', mobile = '" + emp.getMobile() + "' where id=" + id;

			stmt = jdbcConnection.prepareStatement(sql);

			return stmt.executeUpdate() > 0;
		} else
			return false;
	}

	public List<Job> getJobsByEmprId(int id) throws SQLException {
		String sql = "select * from job where empid = " + id;
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Job> jobs = new ArrayList<>();
		while (rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12), rs.getInt(13));
			jobs.add(j);
		}
		return jobs;
	}

	public List<Job> getJobsByCompanyType(List<String> companytype) throws SQLException {
		String sql = "select * from job where companytype in (";
		for (String type : companytype)
			sql += type + ",";
		sql += "'');";
		System.out.println(sql);
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Job> jobs = new ArrayList<>();
		while (rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12), rs.getInt(13));
			jobs.add(j);
		}
		return jobs;
	}

	public List<Job> getRcmdJobsByCompanyType(List<String> ctypes, int id) throws SQLException {
		List<Job> rcmdjobs = new ArrayList<>();
		List<Job> filterjobs = getJobsByCompanyType(ctypes);
		Employee emp = getEmployee(id);
		String skills = emp.getSkills();
		float exp = emp.getExperience();
		List<String> skillslist = new ArrayList<>();

		for (String skill : skills.split(", "))
			skillslist.add(skill);
		System.out.println("skills: " + skillslist.toString());

		for (Job job : filterjobs) {
			for (String skill : skillslist) {
				if (job.getSkills().toLowerCase().contains(skill.toLowerCase()) && exp >= job.getMinexperience()) {
					if (!rcmdjobs.contains(job)) {
						System.out.println("found: " + job.getJobname());
						rcmdjobs.add(job);
					}
				}
			}
		}
		return rcmdjobs;
	}

	public List<Job> getRcmdJobsByJobType(List<String> jtypes, int id) throws SQLException {
		List<Job> rcmdjobs = new ArrayList<>();
		List<Job> filterjobs = getJobsByJobType(jtypes);
		Employee emp = getEmployee(id);
		String skills = emp.getSkills();
		float exp = emp.getExperience();
		List<String> skillslist = new ArrayList<>();

		for (String skill : skills.split(", "))
			skillslist.add(skill);
		System.out.println("skills: " + skillslist.toString());

		for (Job job : filterjobs) {
			for (String skill : skillslist) {
				if (job.getSkills().toLowerCase().contains(skill.toLowerCase()) && exp >= job.getMinexperience()) {
					if (!rcmdjobs.contains(job)) {
						System.out.println("found: " + job.getJobname());
						rcmdjobs.add(job);
					}
				}
			}
		}
		return rcmdjobs;
	}

	public List<Job> getJobsByJobType(List<String> jobtype) throws SQLException {
		String sql = "select * from job where jobtype in (";
		for (String type : jobtype)
			sql += type + ",";
		sql += "'');";
		System.out.println(sql);
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Job> jobs = new ArrayList<>();
		while (rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12), rs.getInt(13));
			jobs.add(j);
		}
		return jobs;
	}

	public List<Job> getJobsByCompanyTypeAndJobType(List<String> ctypes, List<String> jtypes, int empid)
			throws SQLException {

		String sql = "select * from job where jobtype in (";
		for (String type : jtypes)
			sql += type + ",";
		sql += "'') and companytype in (";
		for (String type : ctypes)
			sql += type + ",";
		sql += "'')";
		if (empid != 0)
			sql += " and empid = ?;";
		else
			sql += ";";

		System.out.println(sql);
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		if (empid != 0)
			stmt.setInt(1, empid);
		ResultSet rs = stmt.executeQuery();
		List<Job> jobs = new ArrayList<>();
		while (rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12), rs.getInt(13));
			jobs.add(j);
		}
		return jobs;
	}

	public List<Job> getRcmdJobsByCompanyTypeAndJobType(List<String> ctypes, List<String> jtypes, int empid)
			throws SQLException {
		List<Job> rcmdjobs = new ArrayList<>();
		List<Job> filterjobs = getJobsByCompanyTypeAndJobType(ctypes, jtypes, 0);
		System.out.println("filtered: " + filterjobs);
		Employee emp = getEmployee(empid);
		String skills = emp.getSkills();
		float exp = emp.getExperience();
		List<String> skillslist = new ArrayList<>();

		for (String skill : skills.split(", "))
			skillslist.add(skill);
		System.out.println("skills: " + skillslist.toString());

		for (Job job : filterjobs) {
			for (String skill : skillslist) {
				if (job.getSkills().toLowerCase().contains(skill.toLowerCase()) && exp >= job.getMinexperience()) {
					if (!rcmdjobs.contains(job)) {
						System.out.println("found: " + job.getJobname());
						rcmdjobs.add(job);
					}
				}
			}
		}
		return rcmdjobs;
	}

	public List<Job> getRcmdJobs(int id) throws SQLException {
		List<Job> jobs = getJobs();
		List<Job> rcmdjobs = new ArrayList<>();
		Employee emp = getEmployee(id);
		String skills = emp.getSkills();
		float exp = emp.getExperience();
		List<String> skillslist = new ArrayList<>();

		for (String skill : skills.split(", "))
			skillslist.add(skill);
		System.out.println("skills: " + skillslist.toString());

		for (Job job : jobs) {
			for (String skill : skillslist) {
				if (job.getSkills().toLowerCase().contains(skill.toLowerCase()) && exp >= job.getMinexperience()) {
					if (!rcmdjobs.contains(job)) {
						System.out.println("found: " + job.getJobname());
						rcmdjobs.add(job);
					}
				}
			}
		}
//		System.out.println("rcmdjobs: " + rcmdjobs.toString());
		return rcmdjobs;
	}

	public List<Employee> getRcmdEmployees(int empid) throws SQLException {
		List<Employee> emps = getEmployees();
		List<Employee> rcemps = new ArrayList<>();
		List<Job> jobs = getJobsByEmprId(empid);
		List<String> requiredSkills = new ArrayList<>();
		List<String> reqskills = new ArrayList<>();
		for (Job j : jobs) {
			List<String> skills = Arrays.asList(j.getSkills().split(", "));
			requiredSkills.addAll(skills);
		}
//		requiredSkills.stream().forEach(skill -> skill.toLowerCase());
		for (int i = 0; i < requiredSkills.size(); i++) {
			String low = requiredSkills.get(i).toLowerCase();
			if (!reqskills.contains(low))
				reqskills.add(low);
		}

		for (Employee emp : emps) {
			for (String skill : emp.getSkills().split(", ")) {
				if (reqskills.contains(skill.toLowerCase())) {
					rcemps.add(emp);
				}
			}
		}
		System.out.println("emps: " + rcemps);
		System.out.println("skills: " + reqskills);
		return rcemps;

	}

	public Job getJobById(int id) throws SQLException {
		String sql = "select * from job where id = ?";
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();
		Job j = null;
		if (rs.next()) {
			j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getFloat(6),
					rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12), rs.getInt(13));

		}
		return j;
	}

	public Boolean updateJob(Job job, int jobid) throws SQLException {

		String sql = "select * from job where id=" + jobid;
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		ResultSet res = statement.executeQuery();
		if (res.next()) {
			sql = "update job set jobname = ?, company = ?, companytype = ?,"
					+ " minexperience = ?, salary = ?, location = ?," + " description = ?, openings = ?, jobtype = ?,"
					+ " skills = ?, website = ? where id = ?";
			statement = jdbcConnection.prepareStatement(sql);
			statement.setString(1, job.getJobname());
			statement.setString(2, job.getCompany());
			statement.setString(3, job.getCompanytype());
			statement.setFloat(4, job.getMinexperience());
			statement.setFloat(5, job.getSalary());
			statement.setString(6, job.getLocation());
			statement.setString(7, job.getDescription());
			statement.setInt(8, job.getOpenings());
			statement.setString(9, job.getJobtype());
			statement.setString(10, job.getSkills());
			statement.setString(11, job.getWebsite());
			statement.setInt(12, jobid);
			Boolean rs = statement.executeUpdate() > 0;
			return rs;
		}
		return false;
	}

	public boolean deleteJob(int jobid) throws SQLException {
		String sql = "delete from job where id= ?";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, jobid);
		boolean res = statement.executeUpdate() > 0;
		return res;
	}

	public Map<String, String> updateAdminPassword(String p1, String p2, String p3, int aid) throws SQLException {
		String sql = "select * from employer where id = ?";
		Map<String, String> messages = new HashMap<>();
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, aid);
		ResultSet rs = statement.executeQuery();
		if (rs.next()) {
			if (rs.getString("password").equals(p1)) {
				sql = "update employer set password = ? where id = ?";
				statement = jdbcConnection.prepareStatement(sql);
				statement.setString(1, p2);
				statement.setInt(2, aid);
				if (statement.executeUpdate() > 0) {
					sql = "update credentials set password = ? where empid = ?";
					statement = jdbcConnection.prepareStatement(sql);
					statement.setString(1, p2);
					statement.setInt(2, aid);
					statement.executeUpdate();
					messages.put("message", "success");
				} else
					messages.put("message", "Failed to update the password");
			} else
				messages.put("message", "Incorrect current password!");
		} else {
			messages.put("message", "Admin not found");
		}
		return messages;
	}

	public Map<String, String> addApplication(Applications app) throws SQLException {
		Map<String, String> messages = new HashMap<>();
		String sql = "select * from applications where jobid=? and empid=? and emprid=? and status in ('Applied', 'Selected')";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, app.getJobid());
		statement.setInt(2, app.getEmpid());
		statement.setInt(3, app.getEmprid());
		ResultSet rs = statement.executeQuery();
		if (rs.next()) {
			messages.put("message", "Already applied for this job");
		} else {
			sql = "insert into applications (jobid, empid, status, emprid) values(?, ?, ?, ?)";
			statement = jdbcConnection.prepareStatement(sql);
			statement.setInt(1, app.getJobid());
			statement.setInt(2, app.getEmpid());
			statement.setString(3, app.getStatus());
			statement.setInt(4, app.getEmprid());
			boolean res = statement.executeUpdate() > 0;
			if(res)
				messages.put("message", "Applied for this job");
		}
		return messages;
	}
	
	public List<Job> getAppliedJobs(int id) throws SQLException {
		List<Job> jobs = new ArrayList<>();
		String sql = " select j.*, a.status from job j inner join applications a on j.id = a.jobid where a.empid = ?";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, id);
		ResultSet rs = statement.executeQuery();
		while(rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getFloat(6),
					rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12), rs.getInt(13), rs.getString(14));
			jobs.add(j);
		}
		return jobs;
	}
	
//	select e.*, a.status from employee e inner join applications a on e.id = a.empid where a.emprid = 8 group by a.empid;
	public List<Employee> getAppliedEmployees(int id) throws SQLException {
		List<Employee> employees = new ArrayList<>();
		String sql = "select e.*, a.status from employee e inner join applications a on e.id = a.empid where a.emprid = ? group by a.empid";
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		statement.setInt(1, id);
		ResultSet rs = statement.executeQuery();
		while(rs.next()) {
			Employee emp = new Employee(rs.getInt("id"), rs.getString("username"), rs.getString("email"),
					rs.getString("password"), rs.getString("address"), rs.getString("mobile"), rs.getString("skills"),
					rs.getFloat("experience"), rs.getInt("noticeperiod"), rs.getString("image"), rs.getString("status"));
			employees.add(emp);
		}
		return employees;
	}
}
