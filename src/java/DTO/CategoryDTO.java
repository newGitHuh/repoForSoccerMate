/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author admin
 */
public class CategoryDTO {
    private String productCategory,categoryName;

    public CategoryDTO() {
    }

    public CategoryDTO(String productCategory, String categoryName) {
        this.productCategory = productCategory;
        this.categoryName = categoryName;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "productCategory=" + productCategory + ", categoryName=" + categoryName + '}';
    }
    
}
