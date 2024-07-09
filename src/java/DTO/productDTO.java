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
public class productDTO {
    private String productID,productName,productDes,productImg,productCategory;
    private int prices,isOnSale;

    public productDTO() {
    }

    public productDTO(String productID, String productName, String productDes, String productImg, String productCategory, int prices, int isOnSale) {
        this.productID = productID;
        this.productName = productName;
        this.productDes = productDes;
        this.productImg = productImg;
        this.productCategory = productCategory;
        this.prices = prices;
        this.isOnSale = isOnSale;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDes() {
        return productDes;
    }

    public void setProductDes(String productDes) {
        this.productDes = productDes;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public int getPrices() {
        return prices;
    }

    public void setPrices(int prices) {
        this.prices = prices;
    }

    public int getIsOnSale() {
        return isOnSale;
    }

    public void setIsOnSale(int isOnSale) {
        this.isOnSale = isOnSale;
    }

    @Override
    public String toString() {
        return "productDTO{" + "productID=" + productID + ", productName=" + productName + ", productDes=" + productDes + ", productImg=" + productImg + ", productCategory=" + productCategory + ", prices=" + prices + ", isOnSale=" + isOnSale + '}';
    }
    
}
