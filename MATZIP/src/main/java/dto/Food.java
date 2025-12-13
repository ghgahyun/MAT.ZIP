package dto;

import java.io.Serializable;

public class Food implements Serializable {

	private static final long serialVersionUID = -4274700572038677000L;

	private String foodId; 		    // 음식 코드 
	private String name;			// 음식 이름 
	private int unitPrice; 	        // 가격 
	private String country;			// 나라 
	private String type; 	        // 종류 
	private String shortDesc;	    // 설명
	private String ingredients; 	// 재료 
	private String recipe; 	        // 조리법 
	private String allergy;         // 알레르기 정
	private String filename;        // 이미지 
	private int quantity;			// 장바구니에 담은 개수
	
	public Food() {
		super();
	}

	public Food(String foodId, String name, Integer unitPrice) {
		this.foodId = foodId;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	public String getFoodId() {
		return foodId;
	}

	public void setFoodId(String foodId) {
		this.foodId = foodId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getShortDesc() {
		return shortDesc;
	}

	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getRecipe() {
		return recipe;
	}

	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}