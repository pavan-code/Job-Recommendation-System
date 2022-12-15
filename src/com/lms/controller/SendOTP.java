package com.lms.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Random;

public class SendOTP {

	public static String getRandomNumberString() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		return String.format("%06d", number);
	}

	public static String SendMail(String email, String otp, String type) {

//		final String username = "vinayassignments@gmail.com";
//		final String password = "l0g1tec3";
		final String username = "pavankumaranguluri1@gmail.com";
		final String password = "kyzlwmbywddggdho";
		System.out.println("type: " + type);
		String user = "";
		String body = "Dear ";
		if (type.equals("Employee"))
			user = "Job Seeker";
		else if (type.equals("Employer"))
			user = "Job Provider";
		else if (type.equals("Admin"))
			user = "Admin";
		body += "\n\nUse the following OTP to complete your login process.\n";
		body += "OTP: <b>" + otp + "</b>";
		body += "\n\nRegards,";
		body += "\nKonnect";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("k.jayasurya694@gmail.com"));
			message.setSubject("Konnect | Login OTP for Job Recommendation System");
			message.setText(body);
			message.setContent("<p>Dear " + user + ",</p>"
					+ "<p>Use the following OTP to complete your login process.</p>"
					+ "<p style=\"padding: 6px 8px; width: 100px; text-align: center; background: blue; color: white;\">"
					+ otp + "</p>" + "<p>Regards,</p>" + "<h2 style='color: blue'>Konnect</h2>", "text/html");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {

			throw new RuntimeException(e);

		}
		return "done";
	}
}