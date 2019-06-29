package com.kitri.godinator.model;

public class CategoryDto {

	private int categoryNo; 		// 카테고리 번호
	private String categoryName;	// 카테고리 이름

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}
