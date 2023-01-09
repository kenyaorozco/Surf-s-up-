package com.kenya.javaproject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kenya.javaproject.models.Products;
import com.kenya.javaproject.repo.ProductsRepository;

@Service
public class ProductService {
	@Autowired
	private ProductsRepository productsRepo;

//	============= SHOW ALL ==========
	public List<Products> allProductss() {
		return productsRepo.findAll();
	}
	

//	=========== CREATE =============
	public Products createProduct(Products p) {
		return productsRepo.save(p);
	}

	
//	============= READ ONE ==========
	public Products findProduct(Long id) {
		Optional<Products> optionalProduct = productsRepo.findById(id);
		if (optionalProduct.isPresent()) {
			return optionalProduct.get();
		} else {
			return null;
		}
	}
	
	
//	============ UPDATE ==============
	public Products updateProduct(Products p) {
		Products updatedProduct = productsRepo.save(p);
		return updatedProduct;
	}
	
//	=========== DELETE ===============
	public void deleteProduct(Long id) {
		productsRepo.deleteById(id);
	}
}
