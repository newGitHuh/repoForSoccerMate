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
public class invoiceDTO {
    private String name,address,completeStatus;
    int phone,id,totalPrice;

    public invoiceDTO() {
    }

    public invoiceDTO(String name, String address, String completeStatus, int phone, int id, int totalPrice) {
        this.name = name;
        this.address = address;
        this.completeStatus = completeStatus;
        this.phone = phone;
        this.id = id;
        this.totalPrice = totalPrice;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCompleteStatus() {
        return completeStatus;
    }

    public void setCompleteStatus(String completeStatus) {
        this.completeStatus = completeStatus;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "invoiceDTO{" + "name=" + name + ", address=" + address + ", completeStatus=" + completeStatus + ", phone=" + phone + ", id=" + id + ", totalPrice=" + totalPrice + '}';
    }
    
    
}
