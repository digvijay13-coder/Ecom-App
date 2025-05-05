package com.MainApp.Controller;

import java.net.http.HttpRequest;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MainApp.Entity.Admin;
import com.MainApp.Entity.Product;
import com.MainApp.Service.AdminService;
import com.MainApp.Service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminRegisterLoginLogout {
	@Autowired
	AdminService aService;
	
	@Autowired
	ProductService pService;
	
	@RequestMapping("/aregister")
	public String showAdminRegister()
	{
		return "adminregister";
	}
	
	@RequestMapping("/admin-register")
	public String handleAdminRegister(@ModelAttribute Admin a, HttpServletRequest req)
	{
		boolean status = aService.addAdmin(a);
		HttpSession s = req.getSession();
		if(status)
		{
			s.setAttribute("msg", "Registered Successfuly");
		}
		else
		{
			s.setAttribute("msg", "Something went wrong");
		}
		
		return "redirect:/aregister";
	}
	
	@RequestMapping("/verify")
	public String handleVerify(@Param("code") String code, HttpServletRequest req)
	{
		boolean status = aService.verifyAccount(code);
		HttpSession s = req.getSession();
		if(status)
		{
			s.setAttribute("msg", "Account is verfied try to login..");
		}
		else
		{
			s.setAttribute("msg", "Account already verfied, or try to login after some time");
		}
		return "verification";
	}
	
	
	@RequestMapping("/alogin")
	public String showAdminLogin()
	{
		return "adminlogin";
	}
	
	
	@RequestMapping("/admin-login")
	public String handleAdminLogin(
			@RequestParam("name") String name, @RequestParam("pass") String pass, HttpServletRequest req, Model model
			)
	{
		String res = aService.checkAdmin(name, pass);
		HttpSession s = req.getSession();
		
		if(res.equals("exists"))
		{
			List<Product> lp = pService.getProduct(name);
			model.addAttribute("lp",lp);
			
			s.setAttribute("atoken", name);
			return "adminhome";
		}
		else
		{
			s.setAttribute("msg", res);
			return "redirect:/alogin";
		}
		
	}
	
	@RequestMapping("/admin-logout")
	public String handleAdminLogout(HttpServletRequest req)
	{
		HttpSession s = req.getSession();
		s.removeAttribute("atoken");
		
		s.setAttribute("msg", "You have logout successfully");
		return "redirect:alogin";
	}
	
	
	
	
	

}
