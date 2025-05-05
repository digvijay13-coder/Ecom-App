package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.MainApp.Entity.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer>{
	
	List<Cart> findByUname(String uname);
	
	@Modifying
	@Transactional
	void deleteByPidAndUname(int pid, String uname);

}
