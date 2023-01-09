package com.kenya.javaproject.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kenya.javaproject.models.CartItems;
import com.kenya.javaproject.models.Shopper;

@Repository
public interface CartItemsRepo extends JpaRepository<CartItems,Integer> {
	
	List<CartItems> findByShopper(Shopper shopper);

}
