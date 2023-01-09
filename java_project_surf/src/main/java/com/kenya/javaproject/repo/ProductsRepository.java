package com.kenya.javaproject.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kenya.javaproject.models.Products;

@Repository
public interface ProductsRepository extends CrudRepository<Products, Long> {
	
	List <Products> findAll();

//	@Query(" SELECT  FROM Products where productName LIKE %?1%")
//	public List<Products> findAll(String keyword);	
//}
}
