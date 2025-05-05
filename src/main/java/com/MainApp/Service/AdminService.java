package com.MainApp.Service;

import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.MainApp.Entity.Admin;
import com.MainApp.Repository.AdminRepository;

import jakarta.mail.internet.MimeMessage;

@Service
public class AdminService {

	@Autowired
	AdminRepository aRepo;
	
	boolean flag = false;
	public boolean addAdmin(Admin a) {
		
		Optional<Admin> oa = aRepo.findById(a.getName());
		
		if(oa.isEmpty()) {
			
			a.setIsEnable(false);
			String code = UUID.randomUUID().toString();
			a.setVerficationCode(code);
			
			Admin newAdmin = aRepo.save(a);
			if(newAdmin != null) {
				sendMail(newAdmin);
			}
			flag = true;
		}
		
		return flag;
	}
	
	
	
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendMail(Admin a) {
		
		String from = "amanthakurjuly26@gmail.com";
		String to = a.getEmail();
		String subject = "Account Verification";
		String content = "Dear [[name]], <br>"
				+ "Please click the link below to verify your Account"
				+ "<h1><a href=\"[[url]]\" target=\"_self\">VERIFY</a></h1>"
				+ "Thank you..";
		
		content = content.replace("[[name]]", a.getName());
		String url = "http://localhost:8081/verify?code="+ a.getVerficationCode();  
		content = content.replace("[[url]]", url);
		
		
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(content, true);
			
			mailSender.send(message);
		} 
		catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	
	
	
	
	
	
	// Email Verification
	public boolean verifyAccount(String code) 
	{
		
		Admin admin = aRepo.findByVerficationCode(code);
		
		if(admin != null) {
			
			admin.setIsEnable(true);
			admin.setVerficationCode(null);
			
			aRepo.save(admin);
			return true;
		}
		else 
		{
			return false;
		}
	}
	
	
	
	
	
	
	
	
	
	
	String result = "";
	public String checkAdmin(String name, String pass) {
		
		Optional<Admin> oa = aRepo.findByNameAndPass(name, pass);
		
		if(oa.isEmpty()) {
			
			result = "Invalid Username or Password";
		}
		else {
			
			result = "exists";
			if(!oa.get().getIsEnable()) {
				result = "Your Account is InActive. Please Active Your Account...";
			}
		}
		
		return result;
	}
	
	
	
	
}