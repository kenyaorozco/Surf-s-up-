package com.kenya.javaproject.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.kenya.javaproject.models.Admin;
import com.kenya.javaproject.models.AdminLogin;
import com.kenya.javaproject.repo.AdminRepository;

import net.bytebuddy.utility.RandomString;

@Service
public class AdminService {

	@Autowired
	private AdminRepository adminRepo;
	
	// Built in java mail sender
	@Autowired
	private JavaMailSender mailSender;

	

	// ====================== REGISTER =========================
	public Admin register(Admin newUser, BindingResult result) {
		Optional<Admin> potentailUser = adminRepo.findByEmail(newUser.getEmail());
		if (potentailUser.isPresent()) {
			result.rejectValue("email", "registerError", "this email is taken");
		}
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "registerError", "passwords must match");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			// Generate random string
			String randomCode = RandomString.make(64);
			// saves random code to db so it can be sent to user in confirmation email
			newUser.setVerificationCode(randomCode);
			Admin newCreatedUser = adminRepo.save(newUser);
			return newCreatedUser;
		}
	}
	
// ========== FORM FOR VERIFICATION EMAIL ==============
	
	public void sendVerificationEmail(Admin newUser, String siteURL) throws UnsupportedEncodingException, MessagingException {
		String subject =" Please verify your account";
		String senderName = "Surf's Up";
		String mailContent = "<p>Dear " + newUser.getUserName() + ",</p>";
		mailContent += "<p> Please click the link to verify your account:</p>";
		String verifyURL = siteURL + "/verify?code=" + newUser.getVerificationCode();
		mailContent +=  "<a href=\""+ verifyURL + "\">Click Here to Verfiy</a>";
		mailContent += "<p> Thank you <br> Surf's Up team </p>";	
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom("korozco654@gmail.com", senderName);
	
		helper.setTo(newUser.getEmail());
		helper.setSubject(subject);
		helper.setText(mailContent, true);
		
		mailSender.send(message);
		}
	
	
	public boolean verify(String verificationCode) {
	    Admin user = adminRepo.findByVerificationCode(verificationCode);
	     
	    if (user == null || user.isEnabled()) {
	        return false;
	    } else {
	        user.setVerificationCode(null);
	        user.setEnabled(true);
	        adminRepo.save(user);
	         
	        return true;
	    }
	     
	}

	// ================ LOGIN ================================
	public Admin login(AdminLogin newLogin, BindingResult result) {
		Optional<Admin> potentialUser = adminRepo.findByEmail(newLogin.getEmail());
		// Find user in the DB by email
		// Reject if NOT present
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "Matches", "Admin not found!");
			return null;
		}
		// Admin exists, retrieve user from DB
		Admin user = potentialUser.get();

		// Reject if BCrypt password match fails
		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Password!");
		}
		// Return null if result has errors
		if (result.hasErrors()) {
			return null;
		}
		// Otherwise, return the user object
		return user;
	}

	// ============= Read all ==============
	public List<Admin> showAllUsers() {
		return adminRepo.findAll();
	}

	// =========== Read One Admin ==================
	public Admin findOne(Long id) {
		Optional<Admin> optionalUser = adminRepo.findById(id);
		if (optionalUser.isPresent()) {
			return optionalUser.get();
		}
		return null;
	}

}
