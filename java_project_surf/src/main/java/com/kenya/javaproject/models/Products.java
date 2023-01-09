package com.kenya.javaproject.models;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="products")
public class Products {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull(message="please include procducts name")
	@Size(min=2,message="Product Name must be at least 2 characters")
	private String productName;
	
	@NotNull(message="product must have a price")
	@Min(value=1, message="are we handing out free products now... hmmm")
	private float price;

	@NotNull(message="please upload an image")
	@Size(min=2,max=255,message="image URL is too long pls shorten it ")

	private String image;

	@NotNull(message="don't forget to add a description")
	@Size(min=4,max=255, message="We don't need an essay here, pls shorten description")
	private String description;
	//  =============== CONSTRUCTOR =============
	public Products() {}

//  =============== MANY- TO- ONE (SHOPPER) ==========
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="shopper_id")
	private Shopper shopper;
	

//  =============== MANY- TO- ONE () ==========
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="admin_id")
	private Admin admin;

	
	// ========== SHOPPER SETTER & GETTERS ==============
public Shopper getShopper() {
		return shopper;
	}
	public void setShopper(Shopper shopper) {
	this.shopper = shopper;
}
	



//  ============== SETTERS & GETTERS ==========
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
//  ============== ADMIN SETTERS & GETTERS ==========

	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

}
