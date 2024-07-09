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
public class cartDTO {
    int qty;
    productDTO product;

    public cartDTO() {
    }

    public cartDTO(int qty, productDTO product) {
        this.qty = qty;
        this.product = product;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public productDTO getProduct() {
        return product;
    }

    public void setProduct(productDTO product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "cartDTO{" + "qty=" + qty + ", product=" + product + '}';
    }

    
    
}
