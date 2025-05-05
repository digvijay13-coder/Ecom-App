package com.MainApp.Controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MainApp.Entity.Cart;
import com.MainApp.Entity.Product;
import com.MainApp.Service.CartService;
import com.MainApp.Service.ProductService;

@Controller
public class CartCrud {
	@Autowired
	CartService cService;
	
	@Autowired
	ProductService pService;
	@RequestMapping(value ="/add-cart")
	public String handleAddCart(@ModelAttribute Cart c, Model model)
	{
		cService.addCart(c);
		
		List<Product> lap = pService.getAllProducts();
		model.addAttribute("lap", lap);
		
		Set<String> sc = pService.getCategory();
		model.addAttribute("categories", sc);
		return "userhome";
	}
	
	@RequestMapping(value="/read-cart")
	public String handleReadCart(@Param("uname") String uname, Model model)
	{
		List<Product> lcp = cService.readCartProduct(uname);
		model.addAttribute("lcp",lcp);
		return "cart";
	}
	
	@RequestMapping(value ="/home")
	public String handleHome(Model model)
	{	
		List<Product> lap = pService.getAllProducts();
		model.addAttribute("lap", lap);
		
		Set<String> sc = pService.getCategory();
		model.addAttribute("categories", sc);
		return "userhome";
	}
	
	
	@RequestMapping(value="/delete-cart")
	public String handleDeletecart(@RequestParam("pid") int pid, @RequestParam("uname") String uname, Model model)
	{
		cService.deleteCart(pid, uname);
		List<Product> lcp = cService.readCartProduct(uname);
		model.addAttribute("lcp",lcp);
		return "cart";
	}
	

}
