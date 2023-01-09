package com.kenya.javaproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kenya.javaproject.models.CartItems;
import com.kenya.javaproject.models.Shopper;
import com.kenya.javaproject.repo.CartItemsRepo;

@Service
public class CartService {
	@Autowired
	private CartItemsRepo cartRepo;
	
	public List<CartItems> cartItems(Shopper shopper){
		return cartRepo.findByShopper(shopper);
	}
	

}
