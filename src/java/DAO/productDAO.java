/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CategoryDTO;
import DTO.cartDTO;
import DTO.productDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author admin
 */
public class productDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private static String getProductByID = "select * from product where productID =?";
    private static String getAllProduct = "select * from product";
    private static String getAllProductByCate = "select * from product where productCategory = ?";
    private static String getAllProductBySearch = "select * from product where productName like ?";
    private static String getAllCategory = "select * from category";
    private static String genProductID = "select top 1 productID as counted from product order by productID  desc";
    private static String addProduct = "insert into product values (?,?,?,?,?,?,?)";
    private static String deleteProduct = "delete from product where productID =?";
    private static String currentProduct = "select count(productID) as counted from product";
    public static String editProduct = "update product \n"
            + "set productName = ?,\n"
            + "	productDes = ?,\n"
            + "	prices = ?,\n"
            + "	productImage = ?\n"
            + "where productID = ?";

    public static String pagingProduct = "select * \n"
            + "from product \n"
            + "order by productID\n"
            + "offset ? rows\n"
            + "fetch next ? rows only";

    

    public productDTO getProductByID(String id) {
        productDTO product = null;
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(getProductByID);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                product = new productDTO();
                product.setProductID(rs.getString("productID"));
                product.setProductName(rs.getString("productName"));
                product.setProductDes(rs.getString("productDes"));
                product.setProductImg(rs.getString("productImage"));
                product.setProductCategory(rs.getString("productCategory"));
                product.setPrices(rs.getInt("prices"));
                product.setIsOnSale(rs.getInt("isOnSale"));
            }
        } catch (Exception e) {
        }

        return product;

    }

    public List<productDTO> listAllProduct() {
        List<productDTO> list = new ArrayList<>();
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(getAllProduct);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new productDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("productDes"), rs.getString("productImage"), rs.getString("productCategory"), rs.getInt("prices"), rs.getInt("isOnSale")));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return list;
    }

    public List<productDTO> listProductByCategory(String category) {
        List<productDTO> list = new ArrayList<>();
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(getAllProductByCate);
            ps.setString(1, category);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new productDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("productDes"), rs.getString("productImage"), rs.getString("productCategory"), rs.getInt("prices"), rs.getInt("isOnSale")));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return list;
    }

    public List<productDTO> listProductBySearch(String name) {
        List<productDTO> list = new ArrayList<>();
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(getAllProductBySearch);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new productDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("productDes"), rs.getString("productImage"), rs.getString("productCategory"), rs.getInt("prices"), rs.getInt("isOnSale")));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return list;
    }

    public List<CategoryDTO> listCategory() {
        List<CategoryDTO> list = new ArrayList<>();
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(getAllCategory);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CategoryDTO(rs.getString("productCategory"), rs.getString("categoryName")));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return list;

    }

    public int genID() {
        int count = 0;
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(genProductID);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("counted");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return count += 1;

    }

    public void addProduct(String id, String name, String des, int price, String img, String category, int sale) {
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(addProduct);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, des);
            ps.setInt(4, price);
            ps.setString(5, img);
            ps.setString(6, category);
            ps.setInt(7, sale);
            ps.executeQuery();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }

    }

    public void deleteProduct(String pid) {
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(deleteProduct);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
    }

    public int currentProduct() {
        int count = 0;
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(currentProduct);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("counted");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return count;
    }

    public void editProduct(String productName,
            String productImg,
            int productID,
            int price,
            String productDes,
            String productCategory) {
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(editProduct);
            ps.setString(1, productName);
            ps.setString(2, productDes);
            ps.setInt(3, price);
            ps.setString(4, productImg);
            ps.setInt(5, productID);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public List<productDTO> sortProduct(String column, String sortBy) {
        List<productDTO> list = new ArrayList<>();
        String sortProduct = "select * \n"
                + "from product\n"
                + "order by " + column
                + " " + sortBy + ";";
        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(sortProduct);

            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new productDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("productDes"), rs.getString("productImage"), rs.getString("productCategory"), rs.getInt("prices"), rs.getInt("isOnSale")));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return list;

    }

    public List<productDTO> pagePaging(int offset, int limit) {
        List<productDTO> list = new ArrayList<>();

        try {
            conn = DBContext.DBUtils.getConnection();
            ps = conn.prepareStatement(pagingProduct);
            ps.setInt(1, offset);
            ps.setInt(2, limit);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new productDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("productDes"), rs.getString("productImage"), rs.getString("productCategory"), rs.getInt("prices"), rs.getInt("isOnSale")));
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return list;

    }

    public static void main(String[] args) {
        productDAO dao = new productDAO();
//        List<CategoryDTO> list = new ArrayList<>();
//        list = dao.listCategory();
//        for (CategoryDTO categoryDTO : list) {
//            System.out.println(categoryDTO);
//        }
        List<productDTO> list = new ArrayList<>();
//        list=dao.listAllProduct();
//        for (productDTO dTO : list) {
//            System.out.println(dTO);
//        }

//        List<cartDTO> list = new ArrayList<>();
//        list.add(new cartDTO(1, dao.getProductByID("1")));
//        System.out.println("" + list);
        list = dao.pagePaging(0, 4);
        for (productDTO dTO : list) {
            System.out.println(dTO);
        }
    }
}
