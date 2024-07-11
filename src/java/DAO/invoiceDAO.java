/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.cartDTO;
import DTO.invoiceDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class invoiceDAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    static private String insertInvoice = "insert into invoice values (?,?,?,?,?,?)";
    static private String invoidDetail = "insert into invoiceDetail values (?,?,?,?)";
    static private String count = "select top 1 invoiceID as counted from invoice order by invoiceID desc";
    static private String listInvoice = "select * from invoice";
    static private String selectInvoiceByID = "select * from invoiceDetail where invoiceID = ?";
    static private String listInvoiceByID = "select * from invoice where invoiceID = ?";
    static private String updateStatus = "update invoice\n"
            + "set completeStatus = ?\n"
            + "where invoiceID = ?";
    
    public void createInvoice(int id, String username, String shipAdress, int phone, int price, String status) {
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(insertInvoice);
            ps.setInt(1, id);
            ps.setString(2, username);
            ps.setString(3, shipAdress);
            ps.setInt(4, phone);
            ps.setInt(5, price);
            ps.setString(6, status);
            ps.executeUpdate();
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
    }
    
    public void invoiceDetail(int invoiceID, String pid, int qty, int totalPrice) {
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(invoidDetail);
            ps.setInt(1, invoiceID);
            ps.setString(2, pid);
            ps.setInt(3, qty);
            ps.setInt(4, totalPrice);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
    }
    
    public int genID() {
        int countNumber = 0;
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(count);
            rs = ps.executeQuery();
            if (rs.next()) {
                countNumber = rs.getInt("counted");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return countNumber + 1;
    }
    
    public List<invoiceDTO> listAllInvoice() {
        List<invoiceDTO> list = new ArrayList<>();
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(listInvoice);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new invoiceDTO(rs.getString("username"), rs.getString("ShippingAddress"), rs.getString("completeStatus"), rs.getInt("phone"), rs.getInt("invoiceID"), rs.getInt("totalPrice")));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        
        return list;
    }
    
    public List<cartDTO> listInvoiceByID(String id) {
        List<cartDTO> list = new ArrayList<>();
        productDAO dao = new productDAO();
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(selectInvoiceByID);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new cartDTO(rs.getInt("quantity"), dao.getProductByID(rs.getString("productID"))));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return list;
    }
    
    public invoiceDTO listDetailCartByID(String id) {
        invoiceDTO cart = null;
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(listInvoiceByID);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                cart = new invoiceDTO();
                
                cart.setId(rs.getInt("invoiceID"));
                cart.setName(rs.getString("username"));
                cart.setAddress(rs.getString("ShippingAddress"));
                cart.setPhone(rs.getInt("phone"));
                cart.setTotalPrice(rs.getInt("totalPrice"));
                cart.setCompleteStatus(rs.getString("completeStatus"));
                
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return cart;
    }
    
    public void updateStatus(int id, String status) {
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(updateStatus);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        invoiceDAO dao = new invoiceDAO();
//        int a=dao.genID();
//        System.out.println(a);
//        List<invoiceDTO> listA = new ArrayList<>();
//        listA=dao.listAllInvoice();
//        for (invoiceDTO dTO : listA) {
//            System.out.println(dTO);
//        }
        List<cartDTO> list = new ArrayList<>();
//        list = dao.listInvoiceByID("1");
//        for (cartDTO dTO : list) {
//            System.out.println(dTO);
//        }
            dao.updateStatus(2, "Completed ");
//    invoiceDTO cart = new invoiceDTO();
//    cart=dao.listDetailCartByID("1");
//        System.out.println(cart);
    }
}
