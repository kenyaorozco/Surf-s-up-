package com.kenya.javaproject.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kenya.javaproject.models.Shopper;

@Repository
public interface ShopperRepo extends CrudRepository<Shopper, Long> {
	
	List<Shopper> findAll();
	
	Optional <Shopper> findByEmail(String email);

}
