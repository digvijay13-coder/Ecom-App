package com.MainApp.Controller;

import java.net.http.HttpRequest;
import java.util.List;
import java.util.Set;

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
public class UserRegisterLoginLogout {
	@Autowired
	AdminService aService;
	
	@Autowired
	ProductService pService;
	
	@RequestMapping("/uregister")
	public String showUserRegister()
	{
		return "userregister";
	}
	
	@RequestMapping("/user-register")
	public String handleUserRegister(@ModelAttribute Admin a, HttpServletRequest req)
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
		
		return "redirect:/uregister";
	}
	

	
	@RequestMapping("/ulogin")
	public String showUserLogin()
	{
		return "userlogin";
	}
	
	
	@RequestMapping("/user-login")
	public String handleUserLogin(
			@RequestParam("name") String name, @RequestParam("pass") String pass, HttpServletRequest req, Model model
			)
	{
		String res = aService.checkAdmin(name, pass);
		HttpSession s = req.getSession();
		
		if(res.equals("exists"))
		{
			List<Product> lap = pService.getAllProducts();
			model.addAttribute("lap",lap);
			
			Set<String> sc = pService.getCategory();
			model.addAttribute("categories",sc);
			
			
			s.setAttribute("utoken", name);
			return "userhome";
		}
		else
		{
			s.setAttribute("msg", res);
			return "redirect:/ulogin";
		}
		
	}
	
	@RequestMapping("/user-logout")
	public String handleUserLogout(HttpServletRequest req)
	{
		HttpSession s = req.getSession();
		s.removeAttribute("utoken");
		
		s.setAttribute("msg", "You have logout successfully");
		return "redirect:/ulogin";
	}
	
	
	
	
	

}
