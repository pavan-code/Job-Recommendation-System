package com.lms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.models.Applications;
import com.lms.models.Employee;
import com.lms.models.Employer;
import com.lms.models.Job;
import com.lms.models.StudentDAO;

public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDAO dao;
	private static String actualOTP = null;
	private static String resetOTP = null;
	private static String resetMail = null;

	public void init() {
		try {
			dao = new StudentDAO();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public StudentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getServletPath();
		System.out.println("url: " + url);
		try {
			switch (url) {
			case "/register":
				addEmployee(request, response);
				break;
			case "/login":
				login(request, response);
				break;
			case "/home":
				emppage(request, response);
				break;
			case "/admin-home":
				adminHome(request, response);
				break;
			case "/unactive_emp":
				unactiveEmployee(request, response);
				break;
			case "/unactive_empr":
				unactiveEmployer(request, response);
				break;
			case "/empr-home":
				emprpage(request, response);
				break;
			case "/addjob":
				addJob(request, response);
				break;
			case "/jobs":
				jobs(request, response);
				break;
			case "/rcmd_jobs":
				rcmdjobs(request, response);
				break;
			case "/rcmd_emps":
				rcmdemps(request, response);
				break;
			case "/jobs_admin":
				jobs_admin(request, response);
				break;
			case "/employees_admin":
				employees_admin(request, response);
				break;
			case "/employers_admin":
				employers_admin(request, response);
				break;
			case "/addnewjob":
				addNewJob(request, response);
				break;
			case "/change":
				change(request, response);
				break;
			case "/emp-profile":
				empprofile(request, response);
				break;
			case "/empr-profile":
				emprprofile(request, response);
				break;
			case "/update":
				updateProfile(request, response);
				break;
			case "/updateempr":
				updateempr(request, response);
				break;
			case "/registerEmployer":
				registerEmployer(request, response);
				break;
			case "/update_active":
				updateActive(request, response);
				break;
			case "/empr_jobs":
				getJobsByEmployer(request, response);
				break;
			case "/all_emps":
				allEmployees(request, response);
				break;
			case "/update_job":
				updateJob(request, response);
				break;
			case "/updateJobdetails":
				updateJobDetails(request, response);
				break;
			case "/deleteJobdetails":
				deleteJobDetails(request, response);
				break;
			case "/change_pwd":
				changePwdpage(request, response);
				break;
			case "/adminpwdchange":
				adminpwdchange(request, response);
				break;
			case "/applyjob":
				applyjob(request, response);
				break;
			case "/applied-jobs":
				appliedjobs(request, response);
				break;
			case "/applied-employees":
				appliedemps(request, response);
				break;
			case "/checkOTP":
				checkOTP(request, response);
				break;
			case "/sendotpforreset":
				sendotpreset(request, response);
				break;
			default:
				response.sendRedirect("errorPage.jsp");
				break;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	private void sendotpreset(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String OTP = SendOTP.getRandomNumberString();
		String email = (String) request.getParameter("email");
		String eotp = (String) request.getParameter("otp");
		String newpass = (String) request.getParameter("p");
		if (email != null) {
			resetMail = email;
			resetOTP = OTP;
			System.out.println("email: " + email);
			HttpSession session = request.getSession();
			session.setAttribute("OTP", OTP);
//		session.setAttribute("type", type);
			SendOTP.SendMail(email, OTP, "User");
			System.out.println("OTP: " + OTP);
			request.setAttribute("OTP", OTP);
			request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);

		} else if (eotp != null) {
			if (Integer.parseInt(eotp) == Integer.parseInt(resetOTP)) {
				System.out.println("otp matched");
				request.setAttribute("status", "matched");
			} else {
				request.setAttribute("status", "unmatched");
			}
			request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);

		}
		if (newpass != null) {
			System.out.println("got password: " + newpass);
			dao.changePassword(resetMail, newpass);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	private void checkOTP(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String otp = request.getParameter("otp");
		System.out.println("entered otp: " + otp);
		HttpSession session = request.getSession(false);
		System.out.println("actual otp: " + actualOTP);
		String type = (String) session.getAttribute("type");
		System.out.println("type: " + type);
		if (Integer.parseInt(actualOTP) == Integer.parseInt(otp)) {
			if (type.equalsIgnoreCase("Employee"))
				response.sendRedirect("LoginDone.jsp");
			else if (type.equalsIgnoreCase("Employer"))
				response.sendRedirect("LoginDone1.jsp");
			else if (type.equalsIgnoreCase("Admin"))
				response.sendRedirect("LoginDone2.jsp");
		} else {
			request.setAttribute("message", "Incorrect OTP!!");
			request.getRequestDispatcher("otp.jsp").include(request, response);
		}
	}

	private void appliedemps(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("emps", dao.getAppliedEmployees(id));
		request.getRequestDispatcher("applied_emps.jsp").forward(request, response);
	}

	private void appliedjobs(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("jobs", dao.getAppliedJobs(id));
		request.getRequestDispatcher("applied_jobs.jsp").forward(request, response);
	}

	private void applyjob(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int jobid = Integer.parseInt(request.getParameter("jobid"));
		int empid = Integer.parseInt(request.getParameter("empid"));
		int emprid = Integer.parseInt(request.getParameter("emprid"));

		Applications app = new Applications(jobid, empid, "Applied", emprid);
		System.out.println("app: " + app);
		Map<String, String> messages = dao.addApplication(app);
		List<Job> jobs = dao.getAppliedJobs(empid);
//			response.sendRedirect("/Notifier/home");
		request.setAttribute("messages", messages);
		request.setAttribute("empid", empid);
//			request.setAttribute("applied", "applied");
		request.getRequestDispatcher("jobstatus.jsp").forward(request, response);
//		response.sendRedirect("/Notifier/home");

	}

	private void adminpwdchange(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		String p1 = request.getParameter("password1");
		String p2 = request.getParameter("password2");
		String p3 = request.getParameter("password3");
		int aid = Integer.parseInt(request.getParameter("aid"));
		Map<String, String> messages = dao.updateAdminPassword(p1, p2, p3, aid);

		request.setAttribute("messages", messages);
		request.getRequestDispatcher("admin_change_pwd.jsp").forward(request, response);

	}

	private void changePwdpage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employee> uemps = dao.getUnactivatedEmployees();
		request.setAttribute("uemps", uemps);
		List<Employer> uemprs = dao.getUnactivatedEmployers();
		request.setAttribute("uemprs", uemprs);
		request.getRequestDispatcher("admin_change_pwd.jsp").forward(request, response);
	}

	private void rcmdemps(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int empid = Integer.parseInt(request.getParameter("empid"));
		List<Employee> emps = dao.getRcmdEmployees(empid);
		request.setAttribute("employees", emps);
		request.getRequestDispatcher("all_employees.jsp").forward(request, response);
	}

	private void deleteJobDetails(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int jobid = Integer.parseInt(request.getParameter("jobid"));
		String role = request.getParameter("role");
		int empid = Integer.parseInt(request.getParameter("empid"));
		boolean res = dao.deleteJob(jobid);
		if (res) {
			if (role.equals("Employer"))
				response.sendRedirect("/Notifier/empr_jobs?id=" + empid);
			else if (role.equals("Admin"))
				response.sendRedirect("/Notifier/jobs_admin");
		}
	}

	private void updateJobDetails(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String jobname = request.getParameter("jobname");
		String company = request.getParameter("company");
		String ctype = request.getParameter("companytype");
		String minexp = request.getParameter("minexperience");
		String salary = request.getParameter("salary");
		String location = request.getParameter("location");
		String desc = request.getParameter("description");
		String open = request.getParameter("openings");
		String jobtype = request.getParameter("jobtype");
		String skills = request.getParameter("skills");
		String website = request.getParameter("website");
		int empid = Integer.parseInt(request.getParameter("empid"));
		int jobid = Integer.parseInt(request.getParameter("jobid"));
		String role = request.getParameter("role");
		System.out.println("role: " + role);
		System.out.println("emoid" + empid);
		Job j = new Job(jobname, company, ctype, Float.valueOf(minexp), Float.valueOf(salary), location, desc,
				Integer.parseInt(open), jobtype, skills, website, empid);
//		System.out.println("job: " + j);
		boolean res = dao.updateJob(j, jobid);
		System.out.println("res: " + res);
		if (res) {
			if (role.equals("Employer"))
				response.sendRedirect("/Notifier/empr_jobs?id=" + empid);
			else if (role.equals("Admin"))
				response.sendRedirect("/Notifier/jobs_admin");
		}

	}

	private void updateJob(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int jobid = Integer.parseInt(request.getParameter("jobid"));
		Job job = dao.getJobById(jobid);
		request.setAttribute("job", job);
		request.getRequestDispatcher("update_job.jsp").forward(request, response);
	}

	private void allEmployees(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employee> emps = dao.getEmployees();
		request.setAttribute("employees", emps);
		request.getRequestDispatcher("all_employees.jsp").forward(request, response);
	}

	private void getJobsByEmployer(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int empid = Integer.parseInt(request.getParameter("id"));
		String companytype = request.getParameter("companytype");
		String jobtype = request.getParameter("jobtype");
		List<String> ctypes = new ArrayList<>();
		List<String> jtypes = new ArrayList<>();
		String skill = request.getParameter("skill");
		String location = request.getParameter("location");
		System.out.println("ctype:" + companytype);
		List<Job> jobs = null;
		if (companytype != null && !companytype.isEmpty() && jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			String[] j = jobtype.split(",");
			for (String ch : j)
				jtypes.add("'" + ch + "'");
			jobs = dao.getJobsByCompanyTypeAndJobType(ctypes, jtypes, empid, skill, location);
		} else if (companytype != null && !companytype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			jobs = dao.getJobsByCompanyType(ctypes, skill, location);
		} else if (jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = jobtype.split(",");
			for (String ch : c)
				jtypes.add("'" + ch + "'");
			jobs = dao.getJobsByJobType(jtypes, skill, location);
		} else {
			jobs = dao.getJobsByEmprId(empid);
		}
		request.setAttribute("jobs", jobs);
		request.getRequestDispatcher("empr_jobs.jsp").forward(request, response);
	}

	private void updateActive(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String email = (String) request.getParameter("email");
		String pwd = (String) request.getParameter("enc");
		String role = (String) request.getParameter("role");
		System.out.println("inside update: " + id + request.getParameter("email"));
		boolean res = dao.activate(id, email, pwd, role);
		if (res && role.equals("Employee"))
			response.sendRedirect("unactive_emp");
		else if (res && role.equals("Employer"))
			response.sendRedirect("unactive_empr");
	}

	private void addEmployee(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String username = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String experience = request.getParameter("experience");
		String image = request.getParameter("image");
		String skills = request.getParameter("skills");
		String resume = request.getParameter("resume");

		System.out.println("image: " + image);
		Map<String, String> messages = new HashMap<String, String>();
		File resu = new File("D:\\java projects\\Notifier\\WebContent\\images\\" + image);
		FileInputStream fis = new FileInputStream(resu);
		if (!dao.getEmployeeByEmail(email)) {
			Employee emp = new Employee(username, email, password, address, mobile, Float.valueOf(experience), image,
					fis, skills);
			System.out.println("got emp " + emp);
			boolean res = dao.insertEmployee(emp);
			if (res)
				response.sendRedirect("RegistrationDone.jsp");
		} else {
			messages.put("message", "Job Seeker already exist with the Email ID");
			request.setAttribute("messages", messages);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String type = request.getParameter("type");

		System.out.println(email + " " + password + " " + type);
		Map<String, String> messages = new HashMap<String, String>();
		messages = dao.login(email, password, type, messages);
		request.setAttribute("messages", messages);
		System.out.println(messages + " " + messages.size());

		if (messages.size() == 2 && messages.containsKey("id")) {
			Cookie c = new Cookie("id", messages.get("id"));
			response.addCookie(c);
			c = new Cookie("role", messages.get("type"));
			response.addCookie(c);
			String OTP = SendOTP.getRandomNumberString();
			actualOTP = OTP;
			System.out.println("actual otp: " + actualOTP);
			HttpSession session = request.getSession();
			session.setAttribute("OTP", OTP);
			session.setAttribute("type", type);
			SendOTP.SendMail(email, OTP, type);
			System.out.println("OTP: " + OTP);
			request.getRequestDispatcher("otp.jsp").include(request, response);

//			if (type.equals("Employee")) {
//				response.sendRedirect("LoginDone.jsp");
//			} else if (type.equals("Employer")) {
//				Cookie c = new Cookie("id", messages.get("id"));
//				response.addCookie(c);
//				c = new Cookie("role", messages.get("type"));
//				response.addCookie(c);
//				response.sendRedirect("LoginDone1.jsp");
//			} else if (type.equals("Admin")) {
//				Cookie c = new Cookie("id", messages.get("id"));
//				response.addCookie(c);
//				c = new Cookie("role", messages.get("type"));
//				response.addCookie(c);
//				response.sendRedirect("LoginDone2.jsp");
//			}

		} else {
			request.setAttribute("messages", messages);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
//		response.sendRedirect("index.jsp");
	}

	private void emppage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String companytype = request.getParameter("companytype");
		String jobtype = request.getParameter("jobtype");
		List<String> ctypes = new ArrayList<>();
		List<String> jtypes = new ArrayList<>();
		String skill = request.getParameter("skill");
		String location = request.getParameter("location");
		System.out.println("ctype:" + companytype);
		List<Job> jobs = null;
		if (companytype != null && !companytype.isEmpty() && jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			String[] j = jobtype.split(",");
			for (String ch : j)
				jtypes.add("'" + ch + "'");
			jobs = dao.getJobsByCompanyTypeAndJobType(ctypes, jtypes, 0, skill, location);
		} else if (companytype != null && !companytype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			jobs = dao.getJobsByCompanyType(ctypes, skill, location);
		} else if (jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = jobtype.split(",");
			for (String ch : c)
				jtypes.add("'" + ch + "'");
			jobs = dao.getJobsByJobType(jtypes, skill, location);
		} else {
			jobs = dao.getJobs();
		}
		request.setAttribute("jobs", jobs);
		request.setAttribute("applied", "applied");
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	private void adminHome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employee> emps = dao.getEmployees();
		request.setAttribute("employees", emps);
//		List<Job> jobs = dao.getJobs();
		
		String companytype = request.getParameter("companytype");
		String jobtype = request.getParameter("jobtype");
		String skill = request.getParameter("skill");
		String location = request.getParameter("location");
		System.out.println("search: " + skill);
		List<String> ctypes = new ArrayList<>();
		List<String> jtypes = new ArrayList<>();
		System.out.println("ctype:" + companytype);
		List<Job> jobs = null;
		if (companytype != null && !companytype.isEmpty() && jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			String[] j = jobtype.split(",");
			for (String ch : j)
				jtypes.add("'" + ch + "'");
			jobs = dao.getJobsByCompanyTypeAndJobType(ctypes, jtypes, 0, skill, location);
		} else if (companytype != null && !companytype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			jobs = dao.getJobsByCompanyType(ctypes, skill, location);
		} else if (jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = jobtype.split(",");
			for (String ch : c)
				jtypes.add("'" + ch + "'");
			jobs = dao.getJobsByJobType(jtypes, skill, location);
		} else {
			jobs = dao.getJobs();
		}
		
		request.setAttribute("jobs", jobs);
		List<Employee> uemps = dao.getUnactivatedEmployees();
		request.setAttribute("uemps", uemps);
		List<Employer> uemprs = dao.getUnactivatedEmployers();
		request.setAttribute("uemprs", uemprs);
		request.getRequestDispatcher("admin-home.jsp").forward(request, response);
	}

	private void unactiveEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employee> emps = dao.getUnactivatedEmployees();
		request.setAttribute("emps", emps);
		List<Employee> uemps = dao.getUnactivatedEmployees();
		request.setAttribute("uemps", uemps);
		List<Employer> uemprs = dao.getUnactivatedEmployers();
		request.setAttribute("uemprs", uemprs);
		request.getRequestDispatcher("Unactive_employees.jsp").forward(request, response);
	}

	private void unactiveEmployer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employer> emprs = dao.getUnactivatedEmployers();
		request.setAttribute("emprs", emprs);
		List<Employee> uemps = dao.getUnactivatedEmployees();
		request.setAttribute("uemps", uemps);
		List<Employer> uemprs = dao.getUnactivatedEmployers();
		request.setAttribute("uemprs", uemprs);
		request.getRequestDispatcher("Unactive_employers.jsp").forward(request, response);
	}

	private void emprpage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employee> emps = dao.getEmployees();
		int empid = 0;
		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("id")) {
				empid = Integer.parseInt(c.getValue());
			}
		}

		String companytype = request.getParameter("companytype");
		String jobtype = request.getParameter("jobtype");
		List<String> ctypes = new ArrayList<>();
		List<String> jtypes = new ArrayList<>();
		String skill = request.getParameter("skill");
		String location = request.getParameter("location");
		System.out.println("ctype:" + companytype);
		List<Job> jobs = null;
		if (companytype != null && !companytype.isEmpty() && jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			String[] j = jobtype.split(",");
			for (String ch : j)
				jtypes.add("'" + ch + "'");
			jobs = dao.getJobsByCompanyTypeAndJobType(ctypes, jtypes, 0, skill, location);
		} else if (companytype != null && !companytype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			jobs = dao.getJobsByCompanyType(ctypes, skill, location);
		} else if (jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = jobtype.split(",");
			for (String ch : c)
				jtypes.add("'" + ch + "'");
			jobs = dao.getJobsByJobType(jtypes, skill, location);
		} else {
			jobs = dao.getJobsByEmprId(empid);
		}

		request.setAttribute("employees", emps);
		request.setAttribute("jobs", jobs);
		request.getRequestDispatcher("emp-home.jsp").forward(request, response);
	}

	private void addJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("addjob.jsp").forward(request, response);
	}

	private void jobs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("jobs.jsp");
	}

	private void rcmdjobs(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String companytype = request.getParameter("companytype");
		String jobtype = request.getParameter("jobtype");
		String location = request.getParameter("location");
		String skill = request.getParameter("skill");
		int id = Integer.parseInt(request.getParameter("id"));
		List<String> ctypes = new ArrayList<>();
		List<String> jtypes = new ArrayList<>();
		System.out.println("ctype:" + companytype);
		System.out.println("jtype:" + jobtype);
		List<Job> jobs = null;
		
		if (companytype != null && !companytype.isEmpty() && jobtype != null && !jobtype.isEmpty()
				&& skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			String[] j = jobtype.split(",");
			for (String ch : j)
				jtypes.add("'" + ch + "'");
			jobs = dao.getRcmdJobsByCompanyTypeAndJobType(ctypes, jtypes, id, skill, location);
		} else if (companytype != null && !companytype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			jobs = dao.getRcmdJobsByCompanyType(ctypes, id, skill, location);
		} else if (jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = jobtype.split(",");
			for (String ch : c)
				jtypes.add("'" + ch + "'");
			jobs = dao.getRcmdJobsByJobType(jtypes, id, skill, location);
		} else {
			jobs = dao.getRcmdJobs(id);
		}
		System.out.println("id " + request.getParameter("id"));
		System.out.println("rcmdjobs: " + jobs);
		request.setAttribute("jobs", jobs);
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}
//============================================
	private void jobs_admin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String companytype = request.getParameter("companytype");
		String jobtype = request.getParameter("jobtype");
		String skill = request.getParameter("skill");
		String location = request.getParameter("location");
		System.out.println("search: " + skill);
		List<String> ctypes = new ArrayList<>();
		List<String> jtypes = new ArrayList<>();
		System.out.println("ctype:" + companytype);
		List<Job> jobs = null;
		if (companytype != null && !companytype.isEmpty() && jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			String[] j = jobtype.split(",");
			for (String ch : j)
				jtypes.add("'" + ch + "'");
			jobs = dao.getJobsByCompanyTypeAndJobType(ctypes, jtypes, 0, skill, location);
		} else if (companytype != null && !companytype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = companytype.split(",");
			for (String ch : c)
				ctypes.add("'" + ch + "'");
			jobs = dao.getJobsByCompanyType(ctypes, skill, location);
		} else if (jobtype != null && !jobtype.isEmpty() && skill != null
				&& !skill.isEmpty() && location != null && !location.isEmpty()) {
			String[] c = jobtype.split(",");
			for (String ch : c)
				jtypes.add("'" + ch + "'");
			jobs = dao.getJobsByJobType(jtypes, skill, location);
		} else {
			jobs = dao.getJobs();
		}

		request.setAttribute("jobs", jobs);
		List<Employee> uemps = dao.getUnactivatedEmployees();
		request.setAttribute("uemps", uemps);
		List<Employer> uemprs = dao.getUnactivatedEmployers();
		request.setAttribute("uemprs", uemprs);
		request.getRequestDispatcher("jobs_admin.jsp").forward(request, response);
	}

	private void employers_admin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employer> emprs = dao.getEmployers();
		request.setAttribute("employers", emprs);
		List<Employee> uemps = dao.getUnactivatedEmployees();
		request.setAttribute("uemps", uemps);
		List<Employer> uemprs = dao.getUnactivatedEmployers();
		request.setAttribute("uemprs", uemprs);
		request.getRequestDispatcher("employers_admin.jsp").forward(request, response);
	}

	private void employees_admin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employee> emps = dao.getEmployees();
		request.setAttribute("employees", emps);
		List<Employee> uemps = dao.getUnactivatedEmployees();
		request.setAttribute("uemps", uemps);
		List<Employer> uemprs = dao.getUnactivatedEmployers();
		request.setAttribute("uemprs", uemprs);
		request.getRequestDispatcher("employees_admin.jsp").forward(request, response);
	}

	private void addNewJob(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String jobname = request.getParameter("jobname");
		String company = request.getParameter("company");
		String ctype = request.getParameter("companytype");
		String minexp = request.getParameter("minexperience");
		String salary = request.getParameter("salary");
		String location = request.getParameter("location");
		String open = request.getParameter("openings");
		String jobtype = request.getParameter("jobtype");
		String skills = request.getParameter("skills");
		String website = request.getParameter("website");
		String desc = request.getParameter("description");
		int empid = Integer.parseInt(request.getParameter("empid"));
		System.out.println("emoid" + empid);
		Job j = new Job(jobname, company, ctype, Float.valueOf(minexp), Float.valueOf(salary), location, desc,
				Integer.parseInt(open), jobtype, skills, website, empid);
		System.out.println("job: " + j);
		boolean res = dao.insertJob(j);
		if (res)
			response.sendRedirect("/Notifier/empr-home");
	}

	public void change(HttpServletRequest request, HttpServletResponse response) {
		String[] myJsonData = request.getParameterValues("json[]");
		System.out.println(myJsonData);
	}

	public void empprofile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		String id = request.getParameter("id");
		String role = request.getParameter("role");

		Employee emp = dao.getEmployee(Integer.parseInt(id));
		System.out.println("profile: " + emp);
		request.setAttribute("employee", emp);

		request.setAttribute("role", role);
		request.getRequestDispatcher("profile.jsp").forward(request, response);

	}

	public void emprprofile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		String id = request.getParameter("id");
		String role = request.getParameter("role");

		Employer emp = dao.getEmployer(Integer.parseInt(id));
		System.out.println("profile: " + emp);
		request.setAttribute("employee", emp);

		request.setAttribute("role", role);
		request.getRequestDispatcher("emprprofile.jsp").forward(request, response);

	}

	public void updateProfile(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String skills = request.getParameter("skills");
		float exp = Float.valueOf(request.getParameter("experience"));
		int np = Integer.parseInt(request.getParameter("noticeperiod"));

		Employee emp = new Employee(id, username, email, password, address, mobile, skills, exp, np);
		System.out.println("emo: " + emp);
		boolean re = dao.updateEmployee(emp);
		if (re)
			response.sendRedirect("/Notifier/home");
	}

	public void updateempr(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		System.out.println("id: " + request.getParameter("id"));
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String company = request.getParameter("company");

		Employer emp = new Employer(id, username, email, password, address, mobile, company);
		System.out.println("emo: " + emp);
		boolean re = dao.updateEmployer(emp);
		if (re)
			response.sendRedirect("/Notifier/empr-home");
	}

	public void registerEmployer(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String username = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String company = request.getParameter("company");
		Map<String, String> messages = new HashMap<String, String>();
		if (!dao.getEmployerByEmail(email)) {
			Employer emp = new Employer(username, email, password, address, mobile, company);
			System.out.println("got emp " + emp);
			boolean res = dao.insertEmployer(emp);
			if (res)
				response.sendRedirect("RegistrationDone.jsp");
		} else {
			messages.put("message", "Job Provider already exist with the Email ID");
			request.setAttribute("messages", messages);
			request.getRequestDispatcher("RegisterEmployer.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
