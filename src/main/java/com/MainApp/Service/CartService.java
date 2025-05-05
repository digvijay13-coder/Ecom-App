package com.MainApp.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Entity.Cart;
import com.MainApp.Entity.Product;
import com.MainApp.Repository.CartRepository;

@Service
public class CartService {
	@Autowired
	CartRepository cRepo;
	
	@Autowired
	ProductService pService;
	
	public void addCart(Cart c)
	{
		cRepo.save(c);
	}
	
	public List<Product> readCartProduct(String uname)
	{
		List<Cart> lc = cRepo.findByUname(uname);
		List<Product> lap = pService.getAllProducts();
		List<Product> lcp = new ArrayList<>();
		
		for(Cart c: lc)
		{
			for(Product p:lap)
			{
				if(c.getPid()==p.getPid())
				{
					lcp.add(p);
				}
			}
		}
		return lcp;
	}
	
	
	public void deleteCart(int pid, String uname)
	{
		cRepo.deleteByPidAndUname(pid, uname);
	}

}
