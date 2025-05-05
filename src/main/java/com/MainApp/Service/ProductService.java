package com.MainApp.Service;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.MainApp.Entity.Product;
import com.MainApp.Repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	ProductRepository pRepo;
	
	public void addPRoduct(Product p, MultipartFile file)
	{
		String pimageName = file.getOriginalFilename();
		p.setPimageName(pimageName);
		
		if(pimageName.isEmpty())
		{
			String imagename = pRepo.findById(p.getPid()).get().getPimageName();
			p.setPimageName(imagename);
			
		}
		
		pRepo.save(p);
		
		FileOutputStream fos = null;
		InputStream is =  null;
		
		try {
			
			is=file.getInputStream();
			byte[] b = is.readAllBytes();
			
			String path="G:\\coding\\class work\\Spring Boot\\Ecom\\src\\main\\webapp\\images\\"+pimageName;
			fos = new FileOutputStream(path);
			fos.write(b);
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		finally {
			try {
				is.close();
				fos.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}

	}
	
	public List<Product> getProduct(String aname)
	{
		return pRepo.findByAdminName(aname);
	}
	
	
	public void deleteProduct(int pid )
	{
		pRepo.deleteById(pid);
	}
	
	
	public Product getEditProduct(int pid)
	{
		return pRepo.findById(pid).get();
	}
	
	
	
	
	public List<Product> getAllProducts()
	{
		return pRepo.findAll();
	}
	
	
	public Set<String> getCategory()
	{
		Set<String> s = new HashSet<>();
		List<Product> l = pRepo.findAll();
		
		for(Product p:l)
		{
			s.add(p.getCategory());
			
		}
		return s;
	}
	
	public List<Product> getAllProductByCategory(String category)
	{
		return pRepo.findByCategory(category);
	}
	
	
	
	
	
}
