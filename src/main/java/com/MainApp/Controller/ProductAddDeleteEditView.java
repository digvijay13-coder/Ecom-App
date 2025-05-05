package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.MainApp.Entity.Product;
import com.MainApp.Service.ProductService;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@MultipartConfig
public class ProductAddDeleteEditView {

	@Autowired
	ProductService pService;
	
	@RequestMapping("/adminhome")
	public String showAdminHome(Model model, HttpServletRequest req)
	{
		String aname =(String) req.getSession().getAttribute("atoken");
		List<Product> lp = pService.getProduct(aname);
		model.addAttribute("lp",lp);
		return "adminhome";
	}
	
	
	
	
	
	@RequestMapping("/add-product")
	public String handleAddProduct(
			@ModelAttribute Product p, @RequestPart("pimage") MultipartFile file 
			)
	{
		
		pService.addPRoduct(p, file);
		return "redirect:/adminhome";
	}
	
	
	@RequestMapping("/delete-product")
	public String handleDeleteProduct(
			 @RequestParam("pid") int pid
			)  
	{
		
		pService.deleteProduct(pid);
		return "redirect:/adminhome";
	}
	
	
	@RequestMapping("/read-edit-product")
	public String handleReadEditProduct(
			 @RequestParam("pid") int pid, HttpServletRequest req
			)  
	{
		
		Product p = pService.getEditProduct(pid);
		HttpSession s = req.getSession();
		s.setAttribute("p", p);
		
		return "redirect:/adminhome";
	}
	
	@RequestMapping("/edit-product")
	public String handleEditProduct(
			@ModelAttribute Product p, @RequestPart("pimage") MultipartFile file 
			)
	{
		  
		pService.addPRoduct(p, file);
		return "redirect:/adminhome";
	}
	
	
	
	
	
	
	
	
}
