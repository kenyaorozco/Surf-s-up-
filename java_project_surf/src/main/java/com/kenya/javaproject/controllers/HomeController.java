package com.kenya.javaproject.controllers;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kenya.javaproject.Utility;
import com.kenya.javaproject.models.Admin;
import com.kenya.javaproject.models.AdminLogin;
import com.kenya.javaproject.models.CartItems;
import com.kenya.javaproject.models.Products;
import com.kenya.javaproject.models.Shopper;
import com.kenya.javaproject.models.ShopperLogin;
import com.kenya.javaproject.service.AdminService;
import com.kenya.javaproject.service.CartService;
import com.kenya.javaproject.service.ProductService;
import com.kenya.javaproject.service.ShopperService;

@Controller
public class HomeController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ShopperService shopperService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ProductService productService;

	@GetMapping("/")
	public String homePage(Model model) {
		List<Products> allProducts = productService.allProductss();
		model.addAttribute("allProducts", allProducts);
		return "homePage.jsp";
	}
	
	@GetMapping("/item/{id}")
	public String displayProduct(@PathVariable long id, Model model) {
		Products product = productService.findProduct(id);
		model.addAttribute("product", product);
		return "oneItem.jsp";
	}

	@GetMapping("/home")
	public String home() {
		return "redirect:/";
	}

	@GetMapping("/login")
	public String whoIsLoggin() {
		return "whoIsLoggin.jsp";
	}

// ======= CUSTOMER REGISTER ======================

	@GetMapping("/customer")
	public String CustomerPage(Model model) {
		model.addAttribute("newShopper", new Shopper());
		model.addAttribute("newLogin", new ShopperLogin());
		return "customerLoggin.jsp";
	}
	
	@GetMapping("/register")
	public String registerPage(Model model) {
		model.addAttribute("newShopper", new Shopper());
		model.addAttribute("newLogin", new ShopperLogin());
		return "registerShopper.jsp";
	}

	// ========= Customer POST ================
	@PostMapping("/register/customer")
	public String register(@Valid @ModelAttribute("newShopper") Shopper newShopper, BindingResult result, Model model,
			HttpSession session) {
		shopperService.register(newShopper, result);
		if (result.hasErrors()) {
			// send in the empty LoginUser before re-rendering the page.
			model.addAttribute("newLogin", new AdminLogin());
			return "registerShopper.jsp";
		} else {
			session.setAttribute("shopper_id", newShopper.getId());
			return "redirect:/dashboard";
		}
	}
// ============ CUSTOMER LOGIN ==============
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") ShopperLogin newLogin, BindingResult result, Model model,
			HttpSession session) {
		Shopper shopper = shopperService.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newShopper", new ShopperLogin());
			return "customerLoggin.jsp";
		}
		session.setAttribute("shopper_id", shopper.getId());
		return "redirect:/dashboard";
	}
	
// ============ SHOPPER DAHBOARD ====================== 
	@GetMapping("/dashboard")
	public String shopperDash(Model model, HttpSession session) {
		Long shopper_id = (Long) session.getAttribute("shopper_id");
//		check if userId is signed in otherwise redirect
		if (shopper_id == null) {
			return "redirect:/customer";
		} else {
			// bring in user
			Shopper shopper = shopperService.findOne(shopper_id);
			model.addAttribute("shopper", shopper);
			// bring in db info
		return "shopperDashboard.jsp";
		}
	}
// ================ CART STUFF ================
	@GetMapping("/cart/checkout")
	public String shoppingCartCheck(Model model, HttpSession session) {
		Long shopper_id = (Long) session.getAttribute("shopper_id");
		if (shopper_id == null) {
			return "redirect:/customer";
		} else {
			// bring in user
			Shopper shopper = shopperService.findOne(shopper_id);
			List<CartItems> cartItems = cartService.cartItems(shopper);
		
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("pageTitle", "Shopping cart");
		return "cart.jsp";
		}
	}
	
	@GetMapping("/cart")
	public String shoppingCart(Model model, HttpSession session) {
		
		model.addAttribute("pageTitle", "Shopping cart");
		return "cart.jsp";
		
	}
	
	
// ==================== ADMIN ===================================================================

// =========== ADMIN REGISTER ===============
	@GetMapping("/admin")
	public String AdminPage(Model model) {
		model.addAttribute("newAdmin", new Admin());
		model.addAttribute("newLogin", new AdminLogin());

		return "RegisterEmployee.jsp";
	}

// ========= ADMIN POST ================
	@PostMapping("/register/admin")
	public String register(@Valid @ModelAttribute("newAdmin") Admin newAdmin, BindingResult result, Model model,
			 HttpServletRequest request)throws UnsupportedEncodingException, MessagingException  {
		adminService.register(newAdmin, result);
		
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new AdminLogin());
			return "RegisterEmployee.jsp";
		} else {
			String siteURL = Utility.getSiteURL(request);
			adminService.sendVerificationEmail(newAdmin, siteURL);
			model.addAttribute("pageTitle", siteURL);
			return "redirect:/verify";
		}
	}
	
 @GetMapping("/verify")
 public String verifyAccount(@Param("code") String code, Model model) {
	 boolean verified = adminService.verify(code);
	 
	 String pageTitle = verified ? "YAY you were able to verify your accounts!": "OOPS something went wrong!";
	 model.addAttribute("pageTitle",pageTitle);
	 return "adminVerification.jsp";
 }

//=========== ADMIN Login PAGE ===============
	@GetMapping("/employee")
	public String AdminLogin(Model model) {
		model.addAttribute("newLogin", new AdminLogin());
		return "AdminLoggin.jsp";
	}
// ========== ADMIN Login ===========
	@PostMapping("/loginAdmin")
	public String loginAdmin(@Valid @ModelAttribute("newLogin") AdminLogin newAdmin, BindingResult result, Model model,
			HttpSession session) {
		Admin admin = adminService.login(newAdmin, result);
		if (result.hasErrors()) {
			model.addAttribute("newAdmin", new Admin());
			return "AdminLoggin.jsp";
		}
		session.setAttribute("admin_id", admin.getId());
		return "redirect:/inventory";
	}
	
	
// ========== ADMIN INVENTORY =================
	
	@GetMapping("/inventory")
	public String dashboard(Model model, HttpSession session) {

		Long admin_id = (Long) session.getAttribute("admin_id");
//		check if userId is signed in otherwise redirect
		if (admin_id == null) {
			return "redirect:/admin";
		} else {
			// bring in user
			Admin admin = adminService.findOne(admin_id);
			model.addAttribute("admin", admin);
			// bring in db info
			List<Products> allProducts = productService.allProductss();
			model.addAttribute("allProducts", allProducts);
			return "inventory.jsp";
		}
	}
	
	// ================== ADMIN LOGOUT ====================
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("admin_id", null);
		return "redirect:/";
	}
//  =================== CREATE PRODUCT ==================
	@GetMapping("/createProduct")
	public String sendProduct(@ModelAttribute("product") Products product) {
		return "createProduct.jsp";
	}
	
	@PostMapping("/newProduct")
	public String createProduct(@Valid @ModelAttribute("product") Products product, BindingResult result, Model model, 
			RedirectAttributes flash, HttpSession sesh) {
		if (result.hasErrors()) {
			List<Products> allProducts = productService.allProductss();
			model.addAttribute("allProducts", allProducts);
			return "createProduct.jsp";
		} else {
			productService.createProduct(product);
			return "redirect:/inventory";
		}
	}
	
	// ===== SHOW ONE ENTRY ==============
	@GetMapping("/display/{id}")
	public String display(@PathVariable long id, Model model) {
		Products product = productService.findProduct(id);
		model.addAttribute("product", product);
		return "showOne.jsp";
	}
	
	// ========== BRING UP EDIT PAGE ============================
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable long id, Model model) {
		Products product = productService.findProduct(id);
		model.addAttribute("product", product);
		return "updateProduct.jsp";
	}

	// =========== MAKE AN EDIT POST ===================
	@PutMapping("/edit/{id}")
	public String editPage(@Valid @ModelAttribute("product") Products product, BindingResult result) {
		if (result.hasErrors()) {
			return "updateProduct.jsp";
		} else {
			productService.updateProduct(product);
			return "redirect:/inventory";
		}
	}
	

	// ========= DELETE =========================
	@RequestMapping(value = "/product/{id}", method = RequestMethod.DELETE)
	public String remove(@PathVariable("id") Long id) {
		productService.deleteProduct(id);
		return "redirect:/inventory";
	}
// ============ BEACH ======================

	@GetMapping("/beach")
	public String beachPage() {
		return "beachSearch.jsp";
	}


}
