package dto;

import java.io.Serializable;

public class Product implements Serializable{
//직렬화란??
// 자바 시스템 내부에서 사용되는 객체 , 데이터를 외부의 자바에서도 사용할 수 있도록
// byte 형태로 데이터를 변환한다. 
	
	private static final long serialVersionUID = -23543254325432564L;
	
	private String productId; // 제품 아이디
	private String pname;// 제품 이름
	private Integer unitPrice; //가격
	private String description; //설명
	private String manufacturer; //제조사
	private String category; //분류
	private long unitsInStock;// 재고
	private String condition; //제품 상태
	
	public Product() {
		super();
	}
	
	public Product(String productId, String pname, Integer unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	
}
