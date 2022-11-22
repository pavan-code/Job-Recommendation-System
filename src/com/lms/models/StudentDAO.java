package com.lms.models;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class StudentDAO {

	private String jdbcURL;
	private String jdbcUsername;
	private String jdbsPassword;
	private Connection jdbcConnection = null;

	public StudentDAO() throws SQLException {
		this.jdbcURL = "jdbc:mysql://localhost:3306/jobrecommendationsystem";
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
					messages.put("email", role + " doesn't exist");
				}
			} else
				messages.put("password", "Incorrect password");
		} else
			messages.put("email", role + " doesn't exist");
		return messages;
	}

	public boolean insertEmployee(Employee student, long l) throws SQLException {
		String sql = "INSERT INTO employee (username, email, mobile, password, address, experience, image) VALUES(?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
//		PreparedStatement statement1 = jdbcConnection.prepareStatement(sql1);

		statement.setString(1, student.getUsername());
		statement.setString(2, student.getEmail());
		statement.setString(3, student.getMobile());
		statement.setString(4, student.getPassword());
		statement.setString(5, student.getAddress());
		statement.setString(6, String.valueOf(student.getExperience()));
		statement.setBinaryStream(7, (InputStream) student.getImage(), (int) l);
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
			statement.setString(3, "Employee");
			statement.setInt(4, id);
			re = statement.executeUpdate();
			if(re > 0)
				return true;
			return false;
			
		}	return false;	
	}
	

	public List<Employee> getUnactivatedEmployees() throws SQLException {
		String sql = "select id, username, email, password, mobile from employee where active is null";
		List<Employee> emps = new ArrayList<>();
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		
		ResultSet res = statement.executeQuery();
		while(res.next()) {
			Employee emp = new Employee(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5));
			emps.add(emp);			
		}
		return emps;
		
	}
	
	public List<Employer> getUnactivatedEmployers() throws SQLException {
		String sql = "select id, username, email, password, mobile from employer where active is null";
		List<Employer> emprs = new ArrayList<>();
		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		
		ResultSet res = statement.executeQuery();
		while(res.next()) {
			Employer emp = new Employer(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), res.getString(5));
			emprs.add(emp);			
		}
		return emprs;
		
	}

	public boolean insertEmployer(Employer student) throws SQLException {
		String sql = "INSERT INTO employer (username, email, mobile, password, address, company) VALUES(?, ?, ?, ?, ?, ?)";
		String sql1 = "insert into credentials (email, password, type, empid) values(?, ?, ?, ?)";

		PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		PreparedStatement statement1 = jdbcConnection.prepareStatement(sql1);

		statement.setString(1, student.getUsername());
		statement.setString(2, student.getEmail());
		statement.setString(3, student.getMobile());
		statement.setString(4, student.getPassword());
		statement.setString(5, student.getAddress());
		statement.setString(6, student.getCompany());
		boolean result = statement.executeUpdate() > 0;

		sql = "select id from employer where email= ?";
		statement = jdbcConnection.prepareStatement(sql);
		statement.setString(1, student.getEmail());
		ResultSet rs = statement.executeQuery();
		if (rs.next()) {
			statement1.setString(1, student.getEmail());
			statement1.setString(2, student.getPassword());
			statement1.setString(3, "Employer");
			statement1.setInt(4, rs.getInt(1));
			statement1.executeUpdate();
			statement.close();
			statement1.close();
		}
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
		return statement.executeUpdate() > 0;
	}

	public List<Job> getJobs() throws SQLException {
		List<Job> jobs = new ArrayList<>();
		String sql = "select * from job order by id";
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12));
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
					rs.getString(6), rs.getString(7), rs.getFloat(8), rs.getInt(9), rs.getBinaryStream("resume"),
					rs.getBinaryStream("image"));

			emps.add(e);
		}
		return emps;
	}

	public Employee getEmployee(int id) throws SQLException {
		String sql = "select * from employee where id=" + id;

		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		Employee emp = null;

		if (rs.next()) {
			emp = new Employee(rs.getInt("id"), rs.getString("username"), rs.getString("email"),
					rs.getString("password"), rs.getString("address"), rs.getString("mobile"), rs.getString("skills"),
					rs.getFloat("experience"), rs.getInt("noticeperiod"), rs.getBinaryStream("resume"),
					rs.getBinaryStream("image"));
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
		while(rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12));
			jobs.add(j);
		}
		return jobs;
	}

	public List<Job> getJobsByCompanyType(List<String> companytype) throws SQLException {
		String sql = "select * from job where companytype in (";
		for(String type: companytype)
			sql += type+",";
		sql += "'');";
		System.out.println(sql);
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Job> jobs = new ArrayList<>();
		while(rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12));
			jobs.add(j);
		}
		return jobs;
	}

	public List<Job> getJobsByJobType(List<String> jobtype) throws SQLException {
		String sql = "select * from job where jobtype in (";
		for(String type: jobtype)
			sql += type+",";
		sql += "'');";
		System.out.println(sql);
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Job> jobs = new ArrayList<>();
		while(rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12));
			jobs.add(j);
		}
		return jobs;
	}

	public List<Job> getJobsByCompanyTypeAndJobType(List<String> ctypes, List<String> jtypes) throws SQLException {
		String sql = "select * from job where jobtype in (";
		for(String type: jtypes)
			sql += type+",";
		sql += "'') and companytype in (";
		for(String type: ctypes)
			sql += type+",";
		sql += "'');";
		System.out.println(sql);
		PreparedStatement stmt = jdbcConnection.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Job> jobs = new ArrayList<>();
		while(rs.next()) {
			Job j = new Job(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5),
					rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
					rs.getString(12));
			jobs.add(j);
		}
		return jobs;
	}

	public List<Job> getRcmdJobs(int id) throws SQLException {
		List<Job> jobs = getJobs();
		List<Job> rcmdjobs = new ArrayList<>();
		Employee emp = getEmployee(id);
		String skills = emp.getSkills();
		float exp = emp.getExperience();
		List<String> skillslist = new ArrayList<>();
		for(String skill : skills.split(", "))
			skillslist.add(skill);
		System.out.println("skills: " + skillslist.toString());
		
		for(Job job: jobs) {
			for(String skill: skillslist) {
				if(job.getSkills().toLowerCase().contains(skill.toLowerCase()) && exp >= job.getMinexperience()) {
					if(!rcmdjobs.contains(job)) {
						System.out.println("found: " + job.getJobname());
						rcmdjobs.add(job);
					}
				}
			}
		}
//		System.out.println("rcmdjobs: " + rcmdjobs.toString());
		return rcmdjobs;
	}
}
