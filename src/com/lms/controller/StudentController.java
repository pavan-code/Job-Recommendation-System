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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.models.Employee;
import com.lms.models.Employer;
import com.lms.models.Job;
import com.lms.models.StudentDAO;

@MultipartConfig(maxFileSize = 16177215)
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDAO dao;

//	private NotebookController notebookController = new NotebookController();
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
			case "/jobs_admin":
				jobs_admin(request, response);
				break;
			case "/employees_admin":
				employees_admin(request, response);
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
			default:
				response.sendRedirect("errorPage.jsp");
				break;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
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
			throws SQLException, IOException {
		String username = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String experience = request.getParameter("experience");
		String image = request.getParameter("image");

		File image1 = new File("D:\\java projects\\Notifier\\WebContent\\images\\" + image);
		FileInputStream fis = new FileInputStream(image1);
		Employee emp = new Employee(username, email, password, address, mobile, Float.valueOf(experience), fis);
		System.out.println("got emp " + emp);
		boolean res = dao.insertEmployee(emp, image1.length());
		if (res)
			response.sendRedirect("RegistrationDone.jsp");
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
			if (type.equals("Employee")) {
				Cookie c = new Cookie("id", messages.get("id"));
				response.addCookie(c);
				c = new Cookie("role", messages.get("type"));
				response.addCookie(c);
				response.sendRedirect("LoginDone.jsp");
			} else if (type.equals("Employer")) {
				Cookie c = new Cookie("id", messages.get("id"));
				response.addCookie(c);
				c = new Cookie("role", messages.get("type"));
				response.addCookie(c);
				response.sendRedirect("LoginDone1.jsp");
			} else if (type.equals("Admin")) {
				Cookie c = new Cookie("id", messages.get("id"));
				response.addCookie(c);
				c = new Cookie("role", messages.get("type"));
				response.addCookie(c);
				response.sendRedirect("LoginDone2.jsp");
			}

		} else
			request.getRequestDispatcher("./").forward(request, response);
	}

	private void emppage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String companytype = request.getParameter("companytype");
		String jobtype = request.getParameter("jobtype");
		List<String> ctypes = new ArrayList<>();
		List<String> jtypes = new ArrayList<>();
		System.out.println("ctype:" + companytype);
		List<Job> jobs = null;
		if (companytype != null && !companytype.isEmpty() && jobtype != null && !jobtype.isEmpty()) {	
			String[] c = companytype.split(",");
			for(String ch: c)
				ctypes.add("'"+ch+"'");
			String[] j = jobtype.split(",");
			for(String ch: j)
				jtypes.add("'"+ch+"'");
			jobs = dao.getJobsByCompanyTypeAndJobType(ctypes, jtypes);
		} else if (companytype != null && !companytype.isEmpty()) {	
			String[] c = companytype.split(",");
			for(String ch: c)
				ctypes.add("'"+ch+"'");
			jobs = dao.getJobsByCompanyType(ctypes);
		} else if(jobtype != null && !jobtype.isEmpty()) {
			String[] c = jobtype.split(",");
			for(String ch: c)
				jtypes.add("'"+ch+"'");
			jobs = dao.getJobsByJobType(jtypes);
		} else {		
			jobs = dao.getJobs();
		}
		request.setAttribute("jobs", jobs);
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	private void adminHome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employee> emps = dao.getEmployees();
		request.setAttribute("employees", emps);
		List<Job> jobs = dao.getJobs();
		request.setAttribute("jobs", jobs);
		request.getRequestDispatcher("admin-home.jsp").forward(request, response);
	}

	private void unactiveEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employee> emps = dao.getUnactivatedEmployees();
		request.setAttribute("emps", emps);
		request.getRequestDispatcher("Unactive_employees.jsp").forward(request, response);
	}

	private void unactiveEmployer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employer> emprs = dao.getUnactivatedEmployers();
		request.setAttribute("emprs", emprs);
		request.getRequestDispatcher("Unactive_employers.jsp").forward(request, response);
	}

	private void emprpage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employee> emps = dao.getEmployees();
//		System.out.println("jobs" + jobs.toString());
		request.setAttribute("employees", emps);
		request.getRequestDispatcher("emp-home.jsp").forward(request, response);
	}

	private void addJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("addjob.jsp").forward(request, response);
	}

	private void jobs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("jobs.jsp");
	}
	
	private void rcmdjobs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id "+ request.getParameter("id"));
		List<Job> jobs = dao.getRcmdJobs(id);
		request.setAttribute("jobs", jobs);
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	private void jobs_admin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Job> jobs = dao.getJobs();
		request.setAttribute("jobs", jobs);
		request.getRequestDispatcher("jobs_admin.jsp").forward(request, response);
	}

	private void employees_admin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Employee> emps = dao.getEmployees();
		request.setAttribute("employees", emps);
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
		String desc = request.getParameter("description");
		String open = request.getParameter("openings");
		String jobtype = request.getParameter("jobtype");
		String skills = request.getParameter("skills");
		String website = request.getParameter("website");
		int empid = Integer.parseInt(request.getParameter("empid"));
		System.out.println("emoid" + empid);
		Job j = new Job(jobname, company, ctype, Float.valueOf(minexp), Float.valueOf(salary), location, desc,
				Integer.parseInt(open), jobtype, skills, website, empid);
//		System.out.println("job: " + j);
		boolean res = dao.insertJob(j);
		if (res)
			response.sendRedirect("/Notifier/home");
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
			throws SQLException, IOException {
		String username = request.getParameter("username");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String company = request.getParameter("company");

		Employer emp = new Employer(username, email, password, address, mobile, company);
		System.out.println("got emp " + emp);
		boolean res = dao.insertEmployer(emp);
		if (res)
			response.sendRedirect("RegistrationDone.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
