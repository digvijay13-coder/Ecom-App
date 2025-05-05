package com.MainApp.Controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MainApp.Entity.Product;
import com.MainApp.Service.ProductService;

@Controller
public class UserHome {

	@Autowired
	ProductService pService;
	
	@RequestMapping("/filter")
	public String handleFilter(
			@Param("category") String category, Model model
			)
	{
		List<Product> lap = pService.getAllProductByCategory(category);
		model.addAttribute("lap",lap);
		
		Set<String> sc = pService.getCategory();
		model.addAttribute("categories" ,sc);
		
		return "userhome";
		
	}
	
	@RequestMapping("/remove-filter")
	public String handleRemoveFilter(Model model)
	{
		List<Product> lap = pService.getAllProducts();
		model.addAttribute("lap",lap);
		
		Set<String> sc = pService.getCategory();
		model.addAttribute("categories" ,sc);
		
		return "userhome";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
