package com.kenya.javaproject.service;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.kenya.javaproject.models.Shopper;
import com.kenya.javaproject.models.ShopperLogin;
import com.kenya.javaproject.repo.ShopperRepo;

@Service
public class ShopperService {

	@Autowired
	private ShopperRepo shopperRepo;

	// ====================== REGISTER =========================
	public Shopper register(Shopper newUser, BindingResult result) {
		Optional<Shopper> potentailUser = shopperRepo.findByEmail(newUser.getEmail());
		if (potentailUser.isPresent()) {
			result.rejectValue("email", "registerError", "this email is taken");
		}
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "registerError", "passwords must match");
		}
//		    	return the errors back
		if (result.hasErrors()) {
			return null;
		} else {
//		    		has the password
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
//		    		SAVE USER TO THE DB!!
			Shopper newCreatedUser = shopperRepo.save(newUser);
			return newCreatedUser;
		}
	}

	// ================ LOGIN ================================
	public Shopper login(ShopperLogin newLogin, BindingResult result) {
		Optional<Shopper> potentialUser = shopperRepo.findByEmail(newLogin.getEmail());
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "Matches", "Shopper not found!");
			return null;
		}
		Shopper user = potentialUser.get();

		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Password!");
		}
		if (result.hasErrors()) {
			return null;
		}
		return user;
	}

	// ============= Read all users ==============
	public List<Shopper> showAllUsers() {
		return shopperRepo.findAll();
	}

	// =========== Read One Shopper ==================
	public Shopper findOne(Long id) {
		Optional<Shopper> optionalUser = shopperRepo.findById(id);
		if (optionalUser.isPresent()) {
			return optionalUser.get();
		}
		return null;
	}

}
