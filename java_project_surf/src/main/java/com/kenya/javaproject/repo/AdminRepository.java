package com.kenya.javaproject.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kenya.javaproject.models.Admin;

@Repository
public interface AdminRepository extends CrudRepository<Admin, Long> {
	
	List<Admin> findAll();
	
	Optional <Admin> findByEmail(String email);
	
// QUERY CREATED TO HELP FIND 
    @Query("SELECT u FROM Admin u WHERE u.verificationCode = ?1")
    public Admin findByVerificationCode(String code);

}


